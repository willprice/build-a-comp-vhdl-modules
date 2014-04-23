library ieee, base;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use base.base.all;

entity DMux is
	port(
		data_in        : in  unsigned(3 downto 0);
		data_out_array : out FourInput(3 downto 0);
		control_in     : in  unsigned(3 downto 0);
		control_out    : out unsigned(3 downto 0)
	);
end entity DMux;

architecture DataFlow of DMux is
	signal control : unsigned(1 downto 0);
begin
	control     <= control_in(1 downto 0);
	control_out <= control_in;

	process(control, data_in)
	begin
		-- Set default values
		for i in data_out_array'range loop
			data_out_array(i) <= "0000";
		end loop;

		case (control) is
			when "00"   => data_out_array(0) <= data_in;
			when "01"   => data_out_array(1) <= data_in;
			when "10"   => data_out_array(2) <= data_in;
			when "11"   => data_out_array(3) <= data_in;
			when others => data_out_array(0) <= data_in;
		end case;
	end process;
end architecture;
