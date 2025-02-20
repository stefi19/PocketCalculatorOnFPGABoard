library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SevenSegmentDisplay is
    Port (
        clock_100Mhz : in STD_LOGIC; -- 100Mhz clock on Basys 3 FPGA board
        reset : in STD_LOGIC; -- reset
        Anode_Activate : out STD_LOGIC_VECTOR (3 downto 0); -- 4 Anode signals
        Cathode_out : out STD_LOGIC_VECTOR (6 downto 0); -- Cathode patterns of 7-segment display
        Number_Display : in STD_LOGIC_VECTOR (15 downto 0) -- Input Number
    );
end SevenSegmentDisplay;

architecture Behavioral of SevenSegmentDisplay is
    signal one_second_counter : STD_LOGIC_VECTOR (27 downto 0) := (others => '0');
    signal one_second_enable : std_logic := '0';
    signal displayed_number : STD_LOGIC_VECTOR (15 downto 0) := (others => '0');
    signal LED_BCD : STD_LOGIC_VECTOR (3 downto 0);
    signal refresh_counter : STD_LOGIC_VECTOR (19 downto 0) := (others => '0');
    signal LED_activating_counter : std_logic_vector(1 downto 0);

    -- Signals for BCD conversion
    signal tens_of_thousands, thousands, hundreds, tens, unit : STD_LOGIC_VECTOR (3 downto 0);

    -- Signal to indicate if the number is negative
    signal is_negative : std_logic := '0';

begin
-- BCD to 7-segment decoder
process(LED_BCD)
begin
    case LED_BCD is
        when "0000" => Cathode_out <= "0000001"; -- "0"
        when "0001" => Cathode_out <= "1001111"; -- "1"
        when "0010" => Cathode_out <= "0010010"; -- "2"
        when "0011" => Cathode_out <= "0000110"; -- "3"
        when "0100" => Cathode_out <= "1001100"; -- "4"
        when "0101" => Cathode_out <= "0100100"; -- "5"
        when "0110" => Cathode_out <= "0100000"; -- "6"
        when "0111" => Cathode_out <= "0001111"; -- "7"
        when "1000" => Cathode_out <= "0000000"; -- "8"
        when "1001" => Cathode_out <= "0000100"; -- "9"
        when "1111" => Cathode_out <= "1111110"; -- "-" for negative sign
        when others => Cathode_out <= "1111111"; -- off
    end case;
end process;

-- Generate refresh period of 10.5ms
process(clock_100Mhz, reset)
begin
    if reset = '1' then
        refresh_counter <= (others => '0');
    elsif rising_edge(clock_100Mhz) then
        refresh_counter <= refresh_counter + 1;
    end if;
end process;

LED_activating_counter <= refresh_counter(19 downto 18);

-- 4-to-1 MUX to generate anode activating signals for 4 LEDs 
process(LED_activating_counter, thousands, hundreds, tens, unit, is_negative)
begin
    case LED_activating_counter is
        when "00" =>
            Anode_Activate <= "0111"; 
            LED_BCD <= thousands;
        when "01" =>
            Anode_Activate <= "1011"; 
            LED_BCD <= hundreds;
        when "10" =>
            Anode_Activate <= "1101"; 
            LED_BCD <= tens;
        when "11" =>
            Anode_Activate <= "1110"; 
            if is_negative = '1' then
                LED_BCD <= "1111"; -- Display "-"
            else
                LED_BCD <= unit;
            end if;
        when others =>
            Anode_Activate <= "1111"; 
            LED_BCD <= "1111"; -- off
    end case;
end process;

process(clock_100Mhz, reset)
begin
    if reset = '1' then
        one_second_counter <= (others => '0');
    elsif rising_edge(clock_100Mhz) then
        if one_second_counter >= x"5F5E0FF" then
            one_second_counter <= (others => '0');
        else
            one_second_counter <= one_second_counter + 1;
        end if;
    end if;
end process;

one_second_enable <= '1' when one_second_counter = x"5F5E0FF" else '0';

process(clock_100Mhz, reset)
begin
    if reset = '1' then
        displayed_number <= (others => '0');
    elsif rising_edge(clock_100Mhz) then
        if one_second_enable = '1' then
            displayed_number <= Number_Display;
        end if;
    end if;
end process;

-- Binary to BCD conversion process
process(displayed_number)
    variable value : integer;
    variable abs_value : integer;
    variable bcd_tensofthousands, bcd_thousands, bcd_hundreds, bcd_tens, bcd_units : integer;
begin
    value := to_integer(signed(displayed_number));
    abs_value := abs(value); -- Take the absolute value for BCD conversion

    -- Determine if the number is negative
    if value < 0 then
        is_negative <= '1';
    else
        is_negative <= '0';
    end if;

    -- Extract BCD digits
    bcd_tensofthousands := abs_value / 10000;
    abs_value := abs_value mod 10000; 
    bcd_thousands := abs_value / 1000;
    abs_value := abs_value mod 1000;
    bcd_hundreds := abs_value / 100;
    abs_value := abs_value mod 100;
    bcd_tens := abs_value / 10;
    bcd_units := abs_value mod 10;

    -- Assign to signals
    tens_of_thousands <= std_logic_vector(to_unsigned(bcd_tensofthousands, 4));
    thousands <= std_logic_vector(to_unsigned(bcd_thousands, 4));
    hundreds <= std_logic_vector(to_unsigned(bcd_hundreds, 4));
    tens <= std_logic_vector(to_unsigned(bcd_tens, 4));
    unit <= std_logic_vector(to_unsigned(bcd_units, 4));
end process;

end Behavioral;
