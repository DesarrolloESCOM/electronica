LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Prueba_tb IS
END Prueba_tb;
 
ARCHITECTURE behavior OF Prueba_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Prueba
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         op : IN  std_logic;
         s : OUT  std_logic_vector(3 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal op : std_logic := '0';

 	--Outputs
   signal s : std_logic_vector(3 downto 0);
   signal cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Prueba PORT MAP (
          a => a,
          b => b,
          op => op,
          s => s,
          cout => cout
        );

	-- estimulos de simulación
	process
	begin
		a <= "0011";
		b <= "0001";
		wait for 10 ns;
		a <= "0111";
		b <= "0010";
		--op <= '1';	
		wait for 10 ns;
		--op <= '0';
		--wait for 40 ns;
	end process;
	
	process 
	begin
		wait for 10 ns;
			op <= not op;
	end process;
   
END;
