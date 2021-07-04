library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity FP_DECODER_NIVEL is
    Port ( DN_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           DN_OUT1 : out  STD_LOGIC_VECTOR (3 downto 0);
           DN_OUT2 : out  STD_LOGIC_VECTOR (7 downto 0));
end FP_DECODER_NIVEL;

architecture FP_DECODER_NIVEL_ARCH of FP_DECODER_NIVEL is
signal IN_INT: integer;
begin
IN_INT <= to_integer(unsigned(DN_IN));
process (IN_INT)
	begin 
	case IN_INT is
		when 0 to 19 => DN_OUT1 <= "0000"; DN_OUT2<= "00000000";
		when 20 to 29 => DN_OUT1 <= "0001"; DN_OUT2<="00010100";    
		when 30 to 39 => DN_OUT1 <= "0010"; DN_OUT2<="00011110"; 
		when 40 to 49 => DN_OUT1 <= "0011"; DN_OUT2<="00101000";
		when 50 to 59 => DN_OUT1 <= "0100"; DN_OUT2<="00110010";
		when 60 to 69 => DN_OUT1 <= "0101"; DN_OUT2<="00111100";
		when 70 to 79 => DN_OUT1 <= "0110"; DN_OUT2<="01000110";
		when 80 to 89 => DN_OUT1 <= "0111"; DN_OUT2<="01010000";
		when 90 to 99 => DN_OUT1 <= "1000"; DN_OUT2<="01011010";
		when 100 to 109 =>DN_OUT1 <= "1001"; DN_OUT2<="01100100";
		when 110 to 119 =>DN_OUT1 <= "1010"; DN_OUT2<="01101110";
		when 120 to 129 =>DN_OUT1 <= "1011"; DN_OUT2<="01111000";
		when 130 to 139 =>DN_OUT1 <= "1100"; DN_OUT2<="10000010";
		when 140 to 149 =>DN_OUT1 <= "1101"; DN_OUT2<="10001100";
		when 150 to 159 =>DN_OUT1 <= "1110"; DN_OUT2<="10010110";
		when others => DN_OUT1 <= "1111"; DN_OUT2<="10100000";
	
end case;
	end process;

end FP_DECODER_NIVEL_ARCH;

