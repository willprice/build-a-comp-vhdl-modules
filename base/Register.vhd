library ieee;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Reg is
	port(
		-- Control in "DCBA":
		-- A: Clock
		-- B: Reset
		-- C: Enable
		control_in  : in  unsigned(3 downto 0) := "0101";
		control_out : out unsigned(3 downto 0);
		data_in     : in  unsigned(3 downto 0) := "0000";
		data_out    : out unsigned(3 downto 0)
	);
end entity Reg;

architecture Behavioural of Reg is
	signal clock, enable : std_logic;
begin
	control_out <= control_in;

	clock  <= control_in(0);
	enable <= control_in(2);

	process(clock, enable, data_in) is
	begin
		if (clock = '1' and enable = '1') then
			data_out <= data_in;
		end if;
	end process;
end architecture Behavioural;