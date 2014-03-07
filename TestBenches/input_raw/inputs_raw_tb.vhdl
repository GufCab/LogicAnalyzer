library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity inputs_raw_tb is
end;

architecture bench of inputs_raw_tb is
  component inputs_raw
  	generic (
  		num_of_channels : integer := 8
  	);
  	port (
  		clk_100			: in std_logic;
  		rst_n			: in std_logic;
  		input_vect 		: in std_logic_vector(8 - 1 downto 0);
  		output_vect		: out std_logic_vector(8 -1 downto 0)
  	);
  end component;

  signal clk_100: std_logic;
  signal rst_n: std_logic;
  signal input_vect: std_logic_vector(8 - 1 downto 0);
  signal output_vect: std_logic_vector(8 -1 downto 0) ;

  constant clock_period	: time 	:= 10 ns;
  constant period		: time 	:= 10 ns;
  signal stop_the_clock: boolean;

begin

  -- Insert values for generic parameters !!
  uut: inputs_raw generic map ( num_of_channels => 8 )
                     port map ( clk_100         => clk_100,
                                rst_n           => rst_n,
                                input_vect      => input_vect,
                                output_vect     => output_vect );

  stimulus: process
  begin
  
    -- Put initialisation code here
	wait for period*10;
	
	input_vect <= x"AA";
	wait for period;
	
	input_vect <= x"BB";
	wait for period;
	
	input_vect <= x"CC";
	wait for period;

    wait for period;
	
	wait for period;

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      clk_100 <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end;