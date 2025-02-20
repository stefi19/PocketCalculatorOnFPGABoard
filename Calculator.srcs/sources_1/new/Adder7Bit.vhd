----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2024 10:46:52 AM
-- Design Name: 
-- Module Name: Adder8Bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Adder8Bit is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           Cin : in STD_LOGIC;
           Cout : out STD_LOGIC;
           sum : out STD_LOGIC_VECTOR (7 downto 0));
        --   enable : in STD_LOGIC);
end Adder8Bit;

architecture Behavioral of Adder8Bit is
component Adder1Bit is
    Port ( n1 : in STD_LOGIC;
           n2 : in STD_LOGIC;
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           s : out STD_LOGIC);
end component;

signal carry : STD_LOGIC_VECTOR (7 downto 0):= (others=>'0');
signal internal_sum : STD_LOGIC_VECTOR (7 downto 0):= (others=>'0');
signal internal_cout : STD_LOGIC;

begin

-- Cascading 1Bit Full adders
BIT0: Adder1Bit Port map(n1 => A(0), n2 => B(0), cin => Cin, s => internal_sum(0), cout => carry(0)); -- least significant bit
BIT1: Adder1Bit Port map(n1 => A(1), n2 => B(1), cin => carry(0), s => internal_sum(1), cout => carry(1));
BIT2: Adder1Bit Port map(n1 => A(2), n2 => B(2), cin => carry(1), s => internal_sum(2), cout => carry(2));
BIT3: Adder1Bit Port map(n1 => A(3), n2 => B(3), cin => carry(2), s => internal_sum(3), cout => carry(3));
BIT4: Adder1Bit Port map(n1 => A(4), n2 => B(4), cin => carry(3), s => internal_sum(4), cout => carry(4));
BIT5: Adder1Bit Port map(n1 => A(5), n2 => B(5), cin => carry(4), s => internal_sum(5), cout => carry(5));
BIT6: Adder1Bit Port map(n1 => A(6), n2 => B(6), cin => carry(5), s => internal_sum(6), cout => carry(6));
BIT7: Adder1Bit Port map(n1 => A(7), n2 => B(7), cin => carry(6), s => internal_sum(7), cout => internal_cout); -- most significat bit

sum <= internal_sum;
Cout <= carry(7);

end Behavioral;
