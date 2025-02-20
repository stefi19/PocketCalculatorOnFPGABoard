library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Complement2 is
    Port ( number : in STD_LOGIC_VECTOR (7 downto 0);
           complement_out : out STD_LOGIC_VECTOR (7 downto 0));
end Complement2;

architecture Behavioral of Complement2 is
    component Adder8Bit is
        Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
               B : in STD_LOGIC_VECTOR (7 downto 0);
               Cin : in STD_LOGIC;
               Cout : out STD_LOGIC;
               Sum : out STD_LOGIC_VECTOR (7 downto 0));
    end component;

    signal oneComplement : STD_LOGIC_VECTOR (7 downto 0);
    signal carry_out : STD_LOGIC;
    signal one : STD_LOGIC_VECTOR (7 downto 0) := "00000001"; -- to add 1 to the number
    signal adder_sum : STD_LOGIC_VECTOR (7 downto 0);

begin
    -- Adder8Bit instantiation
    Adder: Adder8Bit Port map (A => oneComplement, B => one, Cin => '0', Cout => carry_out, Sum => adder_sum);

    -- 1's complement
    oneComplement <= not number; -- negate all the bits from the input

    -- Output assignment
    complement_out <= adder_sum;

end Behavioral;
