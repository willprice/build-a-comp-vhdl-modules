library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package Base is
	type FourInput is array (natural range <>) of unsigned(3 downto 0);
	subtype BasicSignal is unsigned(3 downto 0);
	procedure assert_equal(actual, expected : unsigned);
	procedure wait_for_sim_setup;

end package Base;

package body Base is
procedure assert_equal(
		actual, expected : unsigned) is
	begin
		assert (actual = expected) report LF & "Expected = " & integer'image(to_integer(expected)) & LF & 
		 										"Actual = " & integer'image(to_integer(actual)) & LF
			severity note;
	end;

	procedure wait_for_sim_setup is
	begin
		wait for 100 ns;
	end procedure wait_for_sim_setup;

end package body Base; 