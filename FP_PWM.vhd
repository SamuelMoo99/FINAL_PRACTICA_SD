library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity FP_PWM is
    Port ( PWM_INT : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK: in  STD_LOGIC;
			  
           PWM_OUT : out  STD_LOGIC);
end FP_PWM;

architecture FP_PWM_ARCH of FP_PWM is
signal COUNTER: integer:=0; --cuenta hasta un millon de pulsasiones del reloj de 50 MHz correspondientes a un periodo de 20 ms
signal CYCLEDUTY: integer; --cuenta los levantamientos del reloj de 50MHz correspondientes al duty cycle

begin

	SELECT_CYCLEDUTY: process (PWM_INT)
begin  	
	case PWM_INT is
		when  "00000000" => CYCLEDUTY <= 50000;
		when  "00010100" => CYCLEDUTY <= 55555;
		when  "00011110" => CYCLEDUTY <= 58333;
		when  "00101000" => CYCLEDUTY <= 61111;
		when  "00110010" => CYCLEDUTY <= 63888;
		when  "00111100" => CYCLEDUTY <= 66666;
		when  "01000110" => CYCLEDUTY <= 69444;
		when  "01010000" => CYCLEDUTY <= 72222;
		when  "01011010" => CYCLEDUTY <= 75000;
		when  "01100100" => CYCLEDUTY <= 77777;
		when  "01101110" => CYCLEDUTY <= 80555;
		when  "01111000" => CYCLEDUTY <= 83333;
		when  "10000010" => CYCLEDUTY <= 86111;
		when  "10001100" => CYCLEDUTY <= 88888;
		when  "10010110" => CYCLEDUTY <= 91666;
		when others => CYCLEDUTY <= 94444;
	end case;	
end process SELECT_CYCLEDUTY;


	PULSE_COUNTER: process (CLK,CYCLEDUTY,COUNTER)
begin 
		
		if (rising_edge(CLK)) then
				if(COUNTER<1000000) then
					if(COUNTER<CYCLEDUTY) then
					PWM_OUT <= '1';
					COUNTER <= COUNTER+1;
					else 
					PWM_OUT <= '0';
					COUNTER <= COUNTER+1;
					end if;
				else 
				COUNTER <= 0;
					
			end if;
		end if;			
					
end process PULSE_COUNTER;
end FP_PWM_ARCH;

