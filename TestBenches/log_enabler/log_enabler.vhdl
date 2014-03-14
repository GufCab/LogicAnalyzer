--**********************************************************************
-- Copyright 2014 by 11517@iha.dk
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--**********************************************************************
 


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity log_enabler is
  generic (
    num_of_channels : integer := 8
  );
  port (
    -- Inputs
	clk_100			: in std_logic;
	rst_n			: in std_logic;
	synch_vect_in	: in std_logic_vector(num_of_channels -1 downto 0);
	trig_sig		: in std_logic;
	trig_rising		: in std_logic;
	trig_falling	: in std_logic;
	
	-- Outputs
	log_enable		: out std_logic;
	synch_vect_out	: out std_logic	
	
  );
end entity;

architecture arch of log_enabler is
signal flop_sig : std_logic;
signal rising 	: std_logic;
signal falling	: std_logic;
signal conc_sig	: std_logic_vector(1 downto 0);
type states is (SETUP, WAITING_FOR_TRIG, TRIG);
signal state 


begin
	edge_detection : process (clk_100)
	begin
		if rising_edge(clk_100) then
			flop_sig 	<= trig_sig;
			rising		<= trig_sig and not flop_sig;
			falling		<= flop_sig and not trig_sig;
		end if;
	end process;
	
	conc_sig 	<= trig_rising & trig_falling;
	
	log_enable	<= 	rising 	when "10" else
					falling when "01" else
					rising 	for others;
	
end architecture;

