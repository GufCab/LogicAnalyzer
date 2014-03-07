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

entity trigger_mux is
  generic (
    num_of_channels : integer := 8
  );
  port (
    -- Inputs
	synch_in_vect	: in std_logic_vector(num_of_channels -1 downto 0);
	trig_channel	: in std_logic_vector(3 downto 0);	
	
	--Outputs
	trig_sig		: out std_logic	
  );
end entity;

architecture arch of trigger_mux is
begin
	with trig_channel select
	  trig_sig <= synch_in_vect(0) when "0000",
				  synch_in_vect(1) when "0001",
				  synch_in_vect(2) when "0010",
				  synch_in_vect(3) when "0011",
				  synch_in_vect(4) when "0100",
				  synch_in_vect(5) when "0101",
				  synch_in_vect(6) when "0110",
				  synch_in_vect(7) when "0111",
				  synch_in_vect(0) when others;
end architecture;
