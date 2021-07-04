
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TOP_PWM_TB IS
END TOP_PWM_TB;
 
ARCHITECTURE behavior OF TOP_PWM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT TOP_PWM
    PORT(
         TOP_IN : IN  std_logic_vector(7 downto 0);
         CLOCK : IN  std_logic;
        
         PWM_OUT : OUT  std_logic;
         AN : OUT  std_logic;
         DISP : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal TOP_IN : std_logic_vector(7 downto 0) := (others => '0');
   signal CLOCK : std_logic := '0';
   
 	--Outputs
   signal PWM_OUT : std_logic;
   signal AN : std_logic;
   signal DISP : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant CLOCK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: TOP_PWM PORT MAP (
          TOP_IN => TOP_IN,
          CLOCK => CLOCK,
          
          PWM_OUT => PWM_OUT,
          AN => AN,
          DISP => DISP
        );

   -- Clock process definitions
   CLOCK_process :process
   begin
		CLOCK <= '0';
		wait for CLOCK_period/2;
		CLOCK <= '1';
		wait for CLOCK_period/2;
   end process;

			
		
		TOP_IN <="00000000",
                 "00000101" after 20 ms,
                 "00001010" after 40 ms,
                 "00001111" after 60 ms,
                 "00010100" after 80 ms,
                 "00011001" after 100 ms,
                 "00011110" after 120 ms,
                 "00100011" after 140 ms,
                 "00101000" after 160 ms,
                 "00101101" after 180 ms,
                 "00110010" after 200 ms,
                 "00110111" after 220 ms,
                 "00111100" after 240 ms,
                 "01000001" after 260 ms,
                 "01000110" after 280 ms,
                 "01001011" after 300 ms,
                 "01010000" after 320 ms,
                 "01010101" after 340 ms,
                 "01011010" after 360 ms,
                 "01011111" after 380 ms,
                 "01100100" after 400 ms,
                 "01101001" after 420 ms,
                 "01101110" after 440 ms,
                 "01110011" after 460 ms,
                 "01111000" after 480 ms,
                 "01111101" after 500 ms,
                 "10000010" after 520 ms,
                 "10000111" after 540 ms,
                 "10001100" after 560 ms,
                 "10010001" after 580 ms,
                 "10010110" after 600 ms,
                 "10011011" after 620 ms,
                 "10100000" after 640 ms,
                 "10100101" after 660 ms,
                 "10101010" after 680 ms,
                 "10101111" after 700 ms,
                 "10110100" after 720 ms,
                 "10111001" after 740 ms,
                 "10111110" after 760 ms,
                 "11000011" after 780 ms,
                 "11001000" after 800 ms,
                 "11001101" after 820 ms,
                 "11010010" after 840 ms,
                 "11010111" after 860 ms,
                 "11011100" after 880 ms,
                 "11100001" after 900 ms,
                 "11100110" after 920 ms,
                 "11101011" after 940 ms,
                 "11110000" after 960 ms,
                 "11110101" after 980 ms,
                 "11111010" after 1000 ms,
                 "11111111" after 1020 ms;
               


END;
