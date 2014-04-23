library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AU is
	port(
		a_in           : in  unsigned(3 downto 0);
		b_in           : in  unsigned(3 downto 0);
		control_in     : in  unsigned(3 downto 0);
		control_out    : out unsigned(3 downto 0);
		data_out       : out unsigned(3 downto 0);
		comparison_out : out unsigned(3 downto 0)
	);
end entity AU;

architecture Behavioural of AU is
begin
	control_out <= control_in;

	process(a_in, b_in, control_in) is
	begin
		case (control_in(2 downto 0)) is
			when "000" =>
				data_out       <= a_in + b_in;
				comparison_out <= "0000";
			when "001" =>
				data_out       <= a_in;
				comparison_out <= "0000";
			when "110" =>
				data_out <= (a_in + not b_in) + 1;
				if (a_in = b_in) then
					comparison_out <= "1111";
				else
					comparison_out <= "0000";
				end if;
			when "111" =>
				data_out <= a_in - b_in;
				if (a_in < b_in) then
					comparison_out <= "1111";
				else
					comparison_out <= "0000";
				end if;
			when others => data_out <= "0000";
		end case;
	end process;

end architecture Behavioural;

