library ieee, base;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use base.base.all;

entity LeftShiftTests is
end entity LeftShiftTests;

architecture TB of LeftShiftTests is
	component LeftShift
		port(c_in     : in  unsigned(3 downto 0) := "0001";
			 c_out    : out unsigned(3 downto 0);
			 data_in  : in  unsigned(3 downto 0);
			 data_out : out unsigned(3 downto 0));
	end component LeftShift;

	for uut : LeftShift use entity work.LeftShift
	port map(c_in     => c_in,
		     c_out    => c_out,
		     data_in  => data_in,
		     data_out => data_out);

	signal c_in     : unsigned(3 downto 0) := "0000";
	signal c_out    : unsigned(3 downto 0) := "0000";
	signal data_in  : unsigned(3 downto 0) := "0000";
	signal data_out : unsigned(3 downto 0) := "0000";

begin
	-- Unit under test
	uut : LeftShift
		port map(c_in     => c_in,
			     c_out    => c_out,
			     data_in  => data_in,
			     data_out => data_out);

	test : process
	begin
		c_in <= "0011";
		wait for 10 ns;
		assert_equal(c_out, "0011");

		c_in    <= "0001";
		data_in <= "0001";
		wait for 10 ns;
		assert_equal(data_out, "0010");

		c_in    <= "0001";
		data_in <= "0010";
		wait for 10 ns;
		assert_equal(data_out, "0100");

		c_in    <= "0100";
		data_in <= "0010";
		wait for 10 ns;
		assert_equal(data_out, "0010");

		report "Test complete";
		wait;
	end process;
end architecture TB;
