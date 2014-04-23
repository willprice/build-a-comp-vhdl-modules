library ieee, base;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use base.base.all;

entity Mux is
	port(
		data_in_array : in  FourInput(3 downto 0);
		data_out      : out unsigned(3 downto 0);
		control_in    : in  unsigned(3 downto 0);
		control_out   : out unsigned(3 downto 0)
	);
end entity Mux;

architecture rtl of Mux is
	signal control : unsigned(1 downto 0);
begin
	control     <= control_in(1 downto 0);
	control_out <= control_in;

	process(control, data_in_array)
	begin
		case (control) is
			when "00"   => data_out <= data_in_array(0);
			when "01"   => data_out <= data_in_array(1);
			when "10"   => data_out <= data_in_array(2);
			when "11"   => data_out <= data_in_array(3);
			when others => data_out <= "0000";
		end case;
	end process;
end architecture;

