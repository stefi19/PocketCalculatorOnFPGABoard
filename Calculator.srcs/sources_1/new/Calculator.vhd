library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU_System is
    Port (
        clock_100Mhz : in STD_LOGIC; -- 100Mhz clock on Basys 3 FPGA board
        reset : in STD_LOGIC; -- reset button
        nextbtn : in STD_LOGIC; -- button to move to the next state
        backbtn : in STD_LOGIC; -- button to move to the previous state
        switches : in STD_LOGIC_VECTOR (8 downto 0); -- 8 bits for number, 1 for sign
        op_switches : in STD_LOGIC_VECTOR (1 downto 0); -- 2-bit control signal for selecting operation
        Anode_Activate : out STD_LOGIC_VECTOR (3 downto 0); -- 4 Anode signals
        Cathode_out : out STD_LOGIC_VECTOR (6 downto 0); -- Cathode patterns of 7-segment display
        overflow : out STD_LOGIC; -- Overflow signal
        underflow : out STD_LOGIC; -- Underflow signal
        led : out STD_LOGIC_VECTOR (8 downto 0) -- LEDs for switch status
    );
end ALU_System;

architecture Behavioral of ALU_System is

    type state_type is (wait_for_first_num, wait_for_operation, wait_for_second_num, display_result);
    signal current_state, next_state : state_type;

    signal A, B : STD_LOGIC_VECTOR (8 downto 0);
    signal result : STD_LOGIC_VECTOR (15 downto 0);
    signal ALU_Sel_internal : STD_LOGIC_VECTOR (1 downto 0);
    signal alu_done, alu_overflow, alu_underflow : STD_LOGIC;
    
    signal A_temp, B_temp : STD_LOGIC_VECTOR (8 downto 0);
    signal display_number : STD_LOGIC_VECTOR (15 downto 0);

    component ALU is
        Port (
            A : in STD_LOGIC_VECTOR (8 downto 0); -- 9 bits including sign
            B : in STD_LOGIC_VECTOR (8 downto 0); -- 9 bits including sign
            ALU_Sel : in STD_LOGIC_VECTOR (1 downto 0); -- 2-bit control signal for selecting operation
            result : out STD_LOGIC_VECTOR (15 downto 0); -- 16-bit result including sign for multiplication
            done : out STD_LOGIC; -- operation complete signal
            overflow : out STD_LOGIC; -- Overflow signal
            underflow : out STD_LOGIC -- Underflow signal
        );
    end component;

    component SevenSegmentDisplay is
        Port (
            clock_100Mhz : in STD_LOGIC; -- 100Mhz clock on Basys 3 FPGA board
            reset : in STD_LOGIC; -- reset
            Anode_Activate : out STD_LOGIC_VECTOR (3 downto 0); -- 4 Anode signals
            Cathode_out : out STD_LOGIC_VECTOR (6 downto 0); -- Cathode patterns of 7-segment display
            Number_Display : in STD_LOGIC_VECTOR (15 downto 0) -- Input Number
        );
    end component;

begin

    -- Instantiate ALU
    alu_inst : ALU
        port map (
            A => A_temp,
            B => B_temp,
            ALU_Sel => ALU_Sel_internal,
            result => result,
            done => alu_done,
            overflow => alu_overflow,
            underflow => alu_underflow
        );

    -- Instantiate Seven Segment Display
    ssd_inst : SevenSegmentDisplay
        port map (
            clock_100Mhz => clock_100Mhz,
            reset => reset,
            Anode_Activate => Anode_Activate,
            Cathode_out => Cathode_out,
            Number_Display => display_number
        );

    process (clock_100Mhz, reset)
    begin
        if reset = '1' then
            led <= (others => '0');
        elsif rising_edge(clock_100Mhz) then
            led <= switches; -- Map the switches directly to the LEDs
        end if;
    end process;

    -- State transition and signal assignment
    process (clock_100Mhz, reset)
    begin
        if reset = '1' then
            current_state <= wait_for_first_num;
                    next_state <= wait_for_first_num;
                    A <= (others => '0');
                    B <= (others => '0');
                    A_temp <= (others => '0');
                    B_temp <= (others => '0');
                    ALU_Sel_internal <= (others => '0');
                    display_number <= (others => '0');
        elsif rising_edge(clock_100Mhz) then
            current_state <= next_state;

            -- State-specific assignments
            case current_state is
                when wait_for_first_num =>
                    display_number <= std_logic_vector(resize(signed(('0' & switches(7 downto 0))), 16));
                    display_number(15) <= switches(8); -- Assign sign bit to 16th bit

                    if nextbtn = '1' then
                        A_temp <= switches;
                        A <= switches;
                        next_state <= wait_for_operation;
                    end if;

                when wait_for_operation =>
                    display_number <= std_logic_vector(resize(signed(('0' & switches(7 downto 0))), 16));
                    display_number(15) <= switches(8); -- Assign sign bit to 16th bit

                    if nextbtn = '1' then
                        ALU_Sel_internal <= op_switches;
                        next_state <= wait_for_second_num;
                    elsif backbtn = '1' then
                        next_state <= wait_for_first_num;
                    end if;

                when wait_for_second_num =>
                    display_number <= std_logic_vector(resize(signed(('0' & switches(7 downto 0))), 16));
                    display_number(15) <= switches(8); -- Assign sign bit to 16th bit

                    if nextbtn = '1' then
                        B_temp <= switches;
                        B <= switches;
                        next_state <= display_result;
                    elsif backbtn = '1' then
                        next_state <= wait_for_operation;
                    end if;

                when display_result =>
                    display_number <= result;

                    if alu_done = '1' then
                        if nextbtn = '1' then
                            A <= result(8 downto 0); -- Store result as the first number for the next operation
                            next_state <= wait_for_operation;
                        elsif backbtn = '1' then
                            next_state <= wait_for_second_num;
                        end if;
                    end if;

                when others =>
                    next_state <= wait_for_first_num;
            end case;
        end if;
    end process;

    -- Output overflow and underflow signals
    overflow <= alu_overflow;
    underflow <= alu_underflow;

end Behavioral;