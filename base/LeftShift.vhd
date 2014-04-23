library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LeftShift is
	port (
		c_in : in unsigned(3 downto 0) := "0001";
		c_out : out unsigned(3 downto 0);
		data_in : in unsigned(3 downto 0) := "0000";
		data_out : out unsigned(3 downto 0)
	);
end entity LeftShift;


architecture Behavioural of LeftShift is

begin
	c_out <= c_in;
	data_out <= data_in sll to_integer(c_in(1 downto 0));
end architecture Behavioural;
