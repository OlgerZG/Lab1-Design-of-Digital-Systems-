library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_tb is
end full_adder_tb;

architecture testbench of full_adder_tb is

    component full_adder is
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               C : in STD_LOGIC;
               S : out STD_LOGIC;
               T : out STD_LOGIC);
    end component;

    signal test_A, test_B, test_C, test_S, test_T: std_logic := '0';
    signal expected_S, expected_T: std_logic;

begin

    -- DUT instantiation
    fa_inst: full_adder port map (
        A => test_A,
        B => test_B,
        C => test_C,
        S => test_S,
        T => test_T
    );

    proc_test: process
    begin
        -- Test Case 1
        test_A <= '0'; test_B <= '0'; test_C <= '0';
        expected_S <= '0'; expected_T <= '0';
        wait for 50 ns;
        check_output;

        -- Test Case 2
        test_A <= '0'; test_B <= '0'; test_C <= '1';
        expected_S <= '1'; expected_T <= '0';
        wait for 50 ns;
        check_output;

        -- Test Case 3
        test_A <= '0'; test_B <= '1'; test_C <= '0';
        expected_S <= '1'; expected_T <= '0';
        wait for 50 ns;
        check_output;

        -- Test Case 4
        test_A <= '0'; test_B <= '1'; test_C <= '1';
        expected_S <= '0'; expected_T <= '1';
        wait for 50 ns;
        check_output;

        -- Continue for other test cases...
        
        -- After running all test cases
        wait;
    end process;

    -- Procedure to compare actual vs expected values
    procedure check_output is
    begin
        if (test_S /= expected_S or test_T /= expected_T) then
            report "Error: Incorrect output at A=" & std_logic'image(test_A) &
                   " B=" & std_logic'image(test_B) & " C=" & std_logic'image(test_C) &
                   ". Expected: S=" & std_logic'image(expected_S) & " T=" & std_logic'image(expected_T) &
                   ". Got: S=" & std_logic'image(test_S) & " T=" & std_logic'image(test_T)
            severity error;
        else
            report "Success: A=" & std_logic'image(test_A) &
                   " B=" & std_logic'image(test_B) & " C=" & std_logic'image(test_C) &
                   ". Output is correct: S=" & std_logic'image(test_S) & " T=" & std_logic'image(test_T)
            severity note;
        end if;
    end procedure;

end testbench;
