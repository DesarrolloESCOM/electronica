LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY sumadorTest IS
END sumadorTest;
 
ARCHITECTURE behavior OF sumadorTest IS 
 
 
    COMPONENT Prueba
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         op : IN  std_logic;
         s : OUT  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal op : std_logic := '0';

 	--Outputs
   signal s : std_logic_vector(3 downto 0);
   signal Cout : std_logic;
 
BEGIN
 
   uut: Prueba PORT MAP (
          a => a,
          b => b,
          op => op,
          s => s,
          Cout => Cout
        );
process
	begin
		a <= "1001";
		b <= "0101";
		wait for 10 ns;
		a <= "0110";
		b <= "0011";
		op <= '1';	
		wait for 20 ns;
		op <= '0';
		wait;
	end process; 

END;
