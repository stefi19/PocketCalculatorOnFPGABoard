----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2024 06:33:23 PM
-- Design Name: 
-- Module Name: Adder1Bit - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder1Bit is
    Port ( n1 : in STD_LOGIC;
           n2 : in STD_LOGIC;
           cin : in STD_LOGIC;
           cout : out STD_LOGIC;
           s : out STD_LOGIC);
end Adder1Bit;

architecture Behavioral of Adder1Bit is

begin

    process(n1,n2,cin)
    begin
        s<=(n1 xor n2) xor cin; -- Sum Bit
        cout<=(n1 and n2) or (cin and (n1 xor n2)); --Cout Bit
    end process;
        

end Behavioral;
