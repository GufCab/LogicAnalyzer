-- Testbench created online at:
--   www.doulos.com/knowhow/perl/testbench_creation/
-- Copyright Doulos Ltd
-- SD, 03 November 2002

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity trigger_mux_tb is
end;

architecture bench of trigger_mux_tb is

  component trigger_mux
    generic (
      num_of_channels : integer := 8
    );
    port (
  	synch_in_vect	: in std_logic_vector(8 -1 downto 0);
  	trig_channel	: in std_logic_vector(3 downto 0);
  	trig_sig		: out std_logic	
    );
  end component;
  
  constant period : time := 10 ns;

  signal synch_in_vect: std_logic_vector(8 -1 downto 0);
  signal trig_channel: std_logic_vector(3 downto 0);
  signal trig_sig: std_logic ;

begin

  -- Insert values for generic parameters !!
  uut: trigger_mux generic map ( num_of_channels =>  8)
                      port map ( synch_in_vect   => synch_in_vect,
                                 trig_channel    => trig_channel,
                                 trig_sig        => trig_sig );

  stimulus: process
  begin
    -- Put test bench stimulus code here
	wait for period*3;
	
	synch_in_vect	<= "00000000";
	wait for period;
	
	synch_in_vect	<= "10000000";
	trig_channel	<= "0111";
	wait for period;

	synch_in_vect	<= "10000000";
	trig_channel	<= "0110";
	wait for period;
	
	synch_in_vect	<= "00000001";
	trig_channel	<= "0000";
	wait for period;
	
	synch_in_vect	<= X"AA";
	trig_channel	<= "0110";
	wait for period;
	wait for period;
	wait for period;
	
	
	
    wait;
  end process;


end;