library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
entity main is 
	port (
	sal: inout std_logic_vector (7 downto 0):="11111111";
	CLK : in std_logic;
	multiplicando :  inout  std_logic_vector(7 downto 0) := "00000100";
	aux2 : inout std_logic;
	arreglo : inout std_logic_vector (7 downto 0);
	aux3 : inout std_logic;
	multiplicador :  inout std_logic_vector(7 downto 0) := "00000010";
	test :  inout std_logic_vector(7 downto 0));
end main;
architecture Behavioral of main is
signal I : natural := 0;
begin
	process(CLK)
	begin
		if CLK'event and CLK = '1' then
			for X in 0 to 7 loop
				I <= X;
					if '1' = multiplicador(X) then
						test <= multiplicando + arreglo;
						arreglo <= test ;
					end if;						
					sal(0) <= sal(1);
					sal(1) <= sal(2);
					sal(2) <= sal(3);
					sal(3) <= sal(4);
					sal(4) <= sal(5);
					sal(5) <= sal(6);
					sal(6) <= sal(7);
					sal(7) <= arreglo(0);
					arreglo(0) <= arreglo(1);
					arreglo(1) <= arreglo(2);
					arreglo(2) <= arreglo(3);
					arreglo(3) <= arreglo(4);
					arreglo(4) <= arreglo(5);
					arreglo(5) <= arreglo(6);
					arreglo(6) <= arreglo(7);
					arreglo(7) <= '0';
			end loop;
		end if;
	end process;
end Behavioral;