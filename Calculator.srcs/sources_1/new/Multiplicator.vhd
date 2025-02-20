library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplicator is
    Port ( n1 : in STD_LOGIC_VECTOR (7 downto 0);
           n2 : in STD_LOGIC_VECTOR (7 downto 0);
           product : out STD_LOGIC_VECTOR (15 downto 0));
          -- enable : in STD_LOGIC); -- Enable signal
end Multiplicator;

architecture Behavioral of Multiplicator is

begin

process(n1, n2)
    -- we use variables, so the changes happen instantly, instead of signals
    variable P : STD_LOGIC_VECTOR (15 downto 0) := (others => '0'); -- product
    variable N1Extended : STD_LOGIC_VECTOR (15 downto 0) := (others => '0'); -- extended n1 to 16 bits
    variable N2Reg : STD_LOGIC_VECTOR (7 downto 0); -- Register for the second number
    variable carry : STD_LOGIC_VECTOR (15 downto 0) := (others => '0'); -- carry signals for addition
    variable N1Shifted : STD_LOGIC_VECTOR (15 downto 0) := (others => '0'); -- signal for shifted n1
    variable temp_sum : STD_LOGIC;
    variable temp_carry : STD_LOGIC;
begin
--if enable='1' then
    -- Extend the first number to 16 bits
    N1Extended(7 downto 0) := n1;
    N1Extended(15 downto 8) := (others => '0');
    N2Reg := n2;

    -- Initialize product to 0 and set the initial shifted N1
    P := (others => '0');
    N1Shifted := N1Extended;

    -- Iterate over each bit of the second number
    for i in 0 to 7 loop
        if N2Reg(i) = '1' then
            -- Add shifted N1Shifted to the product
            carry(0) := '0';
            for j in 0 to 15 loop
                --we can't instantiate the full adder in a process, so I rewrote the equations
                temp_sum := N1Shifted(j) xor P(j) xor carry(j);
                temp_carry := (N1Shifted(j) and P(j)) or (carry(j) and (N1Shifted(j) xor P(j)));
                
                P(j) := temp_sum;
                if j < 15 then
                    carry(j+1) := temp_carry;
                end if;
            end loop;
        end if;

        -- Shift N1Extended left by 1 bit for the next iteration
        N1Shifted(15 downto 1) := N1Shifted(14 downto 0);
        N1Shifted(0) := '0'; -- Fill Least Significant Bit with 0
    end loop;

    product <= P; -- Assign final product
--end if;
end process;

end Behavioral;
