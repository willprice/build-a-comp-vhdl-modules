library ieee, base;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use base.base.all;

entity MuxTests is
end entity MuxTests;

architecture behaviour of MuxTests is
	signal data_in_array : FourInput(3 downto 0) := ("0000", "0000", "0000", "0000");
	signal data_out      : unsigned(3 downto 0) := "0000";
	signal control_in    : unsigned(3 downto 0) := "0000";
	signal control_out   : unsigned(3 downto 0) := "0000";

begin
	uut : entity base.Mux
		port map(data_in_array => data_in_array,
			     data_out      => data_out,
			     control_in    => control_in,
			     control_out   => control_out);

	process
	begin
		wait_for_sim_setup;

		data_in_array(0) <= "0001";
		control_in <= "0000";
		wait for 10 ns;
		assert_equal(data_out, "0001");
		
		data_in_array(2) <= "1111";
		control_in <= "0010";
		wait for 10 ns;
		assert_equal(data_out, "1111");

		data_in_array(2) <= "1111";
		control_in <= "1010";
		wait for 10 ns;
		assert_equal(data_out, "1111");
		report "Tests completed";
		wait;
	end process;

end architecture behaviour;

