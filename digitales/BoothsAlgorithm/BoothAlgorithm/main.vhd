library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;
entity main is 
	port (
	sal: inout std_logic_vector (7 downto 0);
	CLK : in std_logic;
	multiplicando :  inout  std_logic_vector(7 downto 0) := "00000111";
	arreglo : inout std_logic_vector (7 downto 0):="00000000";
	multiplicador :  inout std_logic_vector(7 downto 0) := "00000011";
	test :  inout std_logic_vector(7 downto 0):="00000000");
end main;
architecture Behavioral of main is
signal I : natural := 0;
signal auxArray : std_logic_vector(7 downto 0) := "00000000";
function reverse_any_vector (a: in std_logic_vector)
return std_logic_vector is
  variable result: std_logic_vector(a'RANGE);
  alias aa: std_logic_vector(a'REVERSE_RANGE) is a;
begin
  for i in aa'RANGE loop
    result(i) := aa(i);
  end loop;
  return result;
end; -- function reverse_any_vector
begin
	process(CLK)
	begin
		if CLK'event and CLK = '1' then
			if I <= 7 then
				if '1' = multiplicador(I) then
					--arreglo <= reverse_any_vector(arreglo)(7 downto 0);
					test <= multiplicando + arreglo;
					arreglo <= test(7 downto 0);
				end if;
				--sal <= reverse_any_vector(sal)(7 downto 0);
				--arreglo <= reverse_any_vector(arreglo)(7 downto 0);
				sal <= sal(6 downto 0)&arreglo(0);
				arreglo <= arreglo(6 downto 0) & '0';
			end if;
			I <= I + 1;
		end if;
	end process;
end Behavioral;