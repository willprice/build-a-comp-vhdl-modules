library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LU is
	port(
		a_in        : in  unsigned(3 downto 0);
		b_in        : in  unsigned(3 downto 0);
		control_in  : in  unsigned(3 downto 0);
		control_out : out unsigned(3 downto 0);
		data_out    : out unsigned(3 downto 0)
	);
end entity LU;

architecture Behavioural of LU is
begin
	control_out <= control_in;

	process(a_in, b_in, control_in) is
	begin
		case (control_in(1 downto 0)) is
			when "00"   => data_out <= not a_in;
			when "01"   => data_out <= a_in and b_in;
			when "10"   => data_out <= a_in or b_in;
			when "11"   => data_out <= a_in xor b_in;
			when others => data_out <= "0000";
		end case;
	end process;

end architecture Behavioural;
