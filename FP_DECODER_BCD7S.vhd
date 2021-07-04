library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FP_DECODER_BCD7S is
    Port ( BCD7S_IN : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD7S_OUT : out  STD_LOGIC_VECTOR (6 downto 0);
           AN : out  STD_LOGIC:= '1');
end FP_DECODER_BCD7S;

architecture FP_DECODER_BCD7S_ARCH of FP_DECODER_BCD7S is

begin
with BCD7S_IN select 
	BCD7S_OUT <= "0000000" when "0000",
		"0110000" when "0001",
		"1101101" when "0010",
		"1111001" when "0011",
		"0110011" when "0100",
		"1011011" when "0101",
		"1011111" when "0110",
		"1110000" when "0111",
		"1111111" when "1000",
		"1110011" when "1001",
		"1110111" when "1010",
		"0011111" when "1011",
		"1001110" when "1100",
		"0111101" when "1101",
		"1001111" when "1110",
		"1000111" when others;

end FP_DECODER_BCD7S_ARCH;

