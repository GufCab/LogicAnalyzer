library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
--library unisim;
--use unisim.vcomponents.all;

entity inputs_raw is
	generic (
		num_of_channels : integer := 8
	);
	port (
		-- Inputs
		clk_100			: in std_logic;
		rst_n			: in std_logic;
		input_vect 		: in std_logic_vector(num_of_channels - 1 downto 0);

		-- Outputs
		output_vect		: out std_logic_vector(num_of_channels -1 downto 0)
	);
end entity;

architecture arch of inputs_raw is
	signal input_vect_1 : std_logic_vector(num_of_channels -1 downto 0);
	signal input_vect_2	: std_logic_vector(num_of_channels -1 downto 0);

begin
	synch_proc: process (clk_100, rst_n)
	begin
	  if (rst_n = '0') then
		input_vect_1 	<= (others => '0');
		input_vect_2 	<= (others => '0');
		output_vect	 	<= (others => '0');
		
	  elsif rising_edge(clk_100) then
		input_vect_1 	<= input_vect;
		input_vect_2 	<= input_vect_1;
		output_vect 	<= input_vect_2;
		
	  end if;
	end process;
end architecture;
