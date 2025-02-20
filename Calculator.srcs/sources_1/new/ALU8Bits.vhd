library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port (
        A : in STD_LOGIC_VECTOR (8 downto 0); -- 9 bits including sign
        B : in STD_LOGIC_VECTOR (8 downto 0); -- 9 bits including sign
        ALU_Sel : in STD_LOGIC_VECTOR (1 downto 0); -- 2-bit control signal for selecting operation
        result : out STD_LOGIC_VECTOR (15 downto 0); -- 16-bit result including sign for multiplication
        done : out STD_LOGIC; -- operation complete signal
        overflow : out STD_LOGIC; -- Overflow signal
        underflow : out STD_LOGIC -- Underflow signal
    );
end ALU;

architecture Behavioral of ALU is
begin
    process (A, B, ALU_Sel)
        variable A_unsigned, B_unsigned : STD_LOGIC_VECTOR (7 downto 0);
        variable A_sign, B_sign : STD_LOGIC;
        variable result_sign : STD_LOGIC;
        variable internal_result : STD_LOGIC_VECTOR (15 downto 0);
        variable quotient, remainder : STD_LOGIC_VECTOR (7 downto 0);
        variable adder_result : STD_LOGIC_VECTOR (7 downto 0);
        variable mult_result : STD_LOGIC_VECTOR (15 downto 0);
        variable A_unsigned_ext, B_unsigned_ext : unsigned(8 downto 0);
        variable overflow_var, underflow_var : STD_LOGIC := '0';
    begin
        -- Reset done signal
        done <= '0';
        overflow <= '0';
        underflow <= '0';
        result_sign := '0';
        internal_result := (others => '0');

        -- Extract sign and unsigned parts
        A_unsigned := A(7 downto 0);
        B_unsigned := B(7 downto 0);
        A_sign := A(8);
        B_sign := B(8);

        -- Extend the unsigned parts to 9 bits for sign extension
        A_unsigned_ext := unsigned('0' & A_unsigned);
        B_unsigned_ext := unsigned('0' & B_unsigned);

        -- Perform operations based on ALU_Sel
        case ALU_Sel is
            when "00" => -- Addition
                if A_sign = B_sign then
                    -- Both operands have the same sign
                    result_sign := A_sign;
                    internal_result := std_logic_vector(resize(A_unsigned_ext + B_unsigned_ext, 16));
                    if (internal_result(15) /= result_sign) then
                        overflow_var := '1';
                    end if;
                else
                    -- Operands have different signs, perform subtraction
                    if A_unsigned_ext >= B_unsigned_ext then
                        result_sign := A_sign;
                        internal_result := std_logic_vector(resize(A_unsigned_ext - B_unsigned_ext, 16));
                    else
                        result_sign := B_sign;
                        internal_result := std_logic_vector(resize(B_unsigned_ext - A_unsigned_ext, 16));
                    end if;
                end if;
                done <= '1';

            when "01" => -- Subtraction
                if A_sign /= B_sign then
                    -- Operands have different signs, perform addition
                    result_sign := A_sign;
                    internal_result := std_logic_vector(resize(A_unsigned_ext + B_unsigned_ext, 16));
                    if (internal_result(15) /= result_sign) then
                        overflow_var := '1';
                    end if;
                else
                    -- Operands have the same sign, perform subtraction
                    if A_unsigned_ext >= B_unsigned_ext then
                        result_sign := A_sign;
                        internal_result := std_logic_vector(resize(A_unsigned_ext - B_unsigned_ext, 16));
                    else
                        result_sign := not A_sign;
                        internal_result := std_logic_vector(resize(B_unsigned_ext - A_unsigned_ext, 16));
                    end if;
                    if (internal_result(15) /= result_sign) then
                        underflow_var := '1';
                    end if;
                end if;
                done <= '1';

            when "10" => -- Multiplication
                result_sign := A_sign xor B_sign; -- Result sign is determined by the XOR of input signs
                mult_result := std_logic_vector(resize(A_unsigned_ext * B_unsigned_ext, 16));
                internal_result := mult_result;
                if (internal_result(15) /= result_sign) then
                    overflow_var := '1';
                end if;
                done <= '1';

            when "11" => -- Division
                result_sign := A_sign xor B_sign; -- Result sign is determined by the XOR of input signs
                if B_unsigned /= "00000000" then
                    quotient := std_logic_vector(resize(A_unsigned_ext / B_unsigned_ext, 8));
                    remainder := std_logic_vector(resize(A_unsigned_ext mod B_unsigned_ext, 8));
                    internal_result := (others => '0');
                    internal_result(7 downto 0) := quotient;
                    if (internal_result(15) /= result_sign) then
                        underflow_var := '1';
                    end if;
                    done <= '1';
                else
                    -- Handle division by zero
                    internal_result := (others => '0');
                    underflow_var := '1';
                    done <= '0';
                end if;

            when others =>
                internal_result := (others => '0');
                done <= '0';
        end case;

        -- Assign result with sign
        result <= result_sign & internal_result(14 downto 0);
        overflow <= overflow_var;
        underflow <= underflow_var;
    end process;
end Behavioral;
