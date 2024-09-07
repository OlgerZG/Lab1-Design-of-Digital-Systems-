library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity full_adder_tb is
--  Port ( );
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
    
begin

proc_test: process
begin 
    test_A <= '0'; test_B <= '0'; test_C <= '0'; wait for 50 ns;
    test_A <= '0'; test_B <= '0'; test_C <= '1'; wait for 50 ns;
    test_A <= '0'; test_B <= '1'; test_C <= '0'; wait for 50 ns;
    test_A <= '0'; test_B <= '1'; test_C <= '1'; wait for 50 ns;
    test_A <= '1'; test_B <= '0'; test_C <= '0'; wait for 50 ns;
    test_A <= '1'; test_B <= '0'; test_C <= '1'; wait for 50 ns;
    test_A <= '1'; test_B <= '1'; test_C <= '0'; wait for 50 ns;
    test_A <= '1'; test_B <= '1'; test_C <= '1'; wait for 50 ns;
    test_A <= '0'; test_B <= '0'; test_C <= '0'; wait for 50 ns;
    wait;
end process; 
    
fa_inst: full_adder port map (
    A => test_A,
    B => test_B,
    C => test_C,
    S => test_S,
    T => test_T
);


end testbench;
