library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator8Bit is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           A_greater_B : out STD_LOGIC;
           A_equal_B : out STD_LOGIC;
           A_less_B : out STD_LOGIC);
end Comparator8Bit;

architecture Behavioral of Comparator8Bit is
begin
    process(A, B)
    begin
        if A > B then
            A_greater_B <= '1';
            A_equal_B <= '0';
            A_less_B <= '0';
        elsif A = B then
            A_greater_B <= '0';
            A_equal_B <= '1';
            A_less_B <= '0';
        else
            A_greater_B <= '0';
            A_equal_B <= '0';
            A_less_B <= '1';
        end if;
    end process;
end Behavioral;
