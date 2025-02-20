library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Entity definition for an 8-bit divider
entity SimpleDivider8Bit is
    Port (
        dividend  : in  STD_LOGIC_VECTOR(7 downto 0); -- 8-bit dividend input
        divisor   : in  STD_LOGIC_VECTOR(7 downto 0); -- 8-bit divisor input
        quotient  : out STD_LOGIC_VECTOR(7 downto 0); -- 8-bit quotient output
        remainder : out STD_LOGIC_VECTOR(7 downto 0)  -- 8-bit remainder output
    );
end SimpleDivider8Bit;

architecture Behavioral of SimpleDivider8Bit is
begin
    -- Process to perform the division
    process(dividend, divisor)
        -- Temporary variables for calculations
        variable temp_dividend : UNSIGNED(15 downto 0);  -- 16-bit temporary dividend
        variable temp_divisor  : UNSIGNED(7 downto 0);   -- 8-bit temporary divisor
        variable temp_quotient : UNSIGNED(7 downto 0) := (others => '0'); -- 8-bit temporary quotient, initialized to 0
        variable temp_remainder: UNSIGNED(7 downto 0);   -- 8-bit temporary remainder
    begin
        -- Extend the 8-bit dividend to 16 bits by appending 8 zeros
        temp_dividend := UNSIGNED(dividend) & "00000000";
        -- Convert divisor to unsigned type
        temp_divisor := UNSIGNED(divisor);
        -- Initialize quotient and remainder to 0
        temp_quotient := (others => '0');
        temp_remainder := (others => '0');

        -- Loop to perform the subtract-and-shift division algorithm
        for i in 7 downto 0 loop
            -- Shift left the remainder and bring down the next bit of the dividend
            temp_remainder := temp_remainder(6 downto 0) & temp_dividend(15);
            -- Shift left the dividend
            temp_dividend := temp_dividend(14 downto 0) & '0';
            -- Check if the current remainder is greater than or equal to the divisor
            if temp_remainder >= temp_divisor then
                -- If so, subtract the divisor from the remainder
                temp_remainder := temp_remainder - temp_divisor;
                -- Set the corresponding bit of the quotient to 1
                temp_quotient := temp_quotient(6 downto 0) & '1';
            else
                -- Otherwise, set the corresponding bit of the quotient to 0
                temp_quotient := temp_quotient(6 downto 0) & '0';
            end if;
        end loop;

        -- Assign the calculated quotient and remainder to the output ports
        quotient <= STD_LOGIC_VECTOR(temp_quotient);
        remainder <= STD_LOGIC_VECTOR(temp_remainder);
    end process;
end Behavioral;
