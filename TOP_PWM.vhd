library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity TOP_PWM is
    Port ( TOP_IN: in  STD_LOGIC_VECTOR (7 downto 0);
           CLOCK : in  STD_LOGIC;          
           PWM_OUT : out  STD_LOGIC;
			  AN : out  STD_LOGIC:= '1';
           DISP : out  STD_LOGIC_VECTOR (6 downto 0));
end TOP_PWM;

architecture TOP_PWM_ARCH of TOP_PWM is
------------------------Components--------------------------
component FP_DECODER_NIVEL is
    Port ( DN_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           DN_OUT1 : out  STD_LOGIC_VECTOR (3 downto 0);
           DN_OUT2 : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;

component FP_DECODER_BCD7S is
    Port ( BCD7S_IN : in  STD_LOGIC_VECTOR (3 downto 0);
           BCD7S_OUT : out  STD_LOGIC_VECTOR (6 downto 0);
           AN : out  STD_LOGIC);
end component;

component FP_PWM is
    Port ( PWM_INT : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK: in  STD_LOGIC;			  
           PWM_OUT : out  STD_LOGIC);
end component;
---------------------------Signals------------------------
signal CABLE1: std_logic_vector(3 downto 0);
signal CABLE2: std_logic_vector(7 downto 0);
-------------------------Portmap----------------------------
begin
	U0: FP_DECODER_NIVEL port map(
	DN_IN => TOP_IN,
	DN_OUT1 => CABLE1,
   DN_OUT2 => CABLE2
	);
	
	U1: FP_DECODER_BCD7S port map (
	BCD7S_IN => CABLE1,
	BCD7S_OUT => DISP,
	AN=> AN
	);
	
	U2: FP_PWM port map (
	PWM_INT => CABLE2,
	CLK => CLOCK,
	PWM_OUT => PWM_OUT
	);

end TOP_PWM_ARCH;

