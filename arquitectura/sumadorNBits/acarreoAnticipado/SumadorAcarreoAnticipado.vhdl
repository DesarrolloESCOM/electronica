library ieee;
use ieee.std_logic_1164.all;

entity Prueba is 
	generic (numeroBits : integer :=4); --cantidad de bits
	Port(
		a: in std_logic_vector (numeroBits-1 downto 0);
		b: in std_logic_vector (numeroBits-1 downto 0);
		op : in  std_logic;
		s: out std_logic_vector (numeroBits-1 downto 0);
		Cout: out std_logic);
end Prueba;

--eb(i) = b(i) xor op;
--c(0) = op;
--p(i) = a(i) or eb(i);
--g(i) = a(i) and eb(i);
--s(i) = p(i) or c(i);
--c(i+1) = c(i) and p(i) or g(i);
architecture A_Prueba of Prueba is
begin
	process(a,b,op)
		variable eb: std_logic_vector (numeroBits-1 downto 0);
		variable p: std_logic_vector (numeroBits-1 downto 0);
		variable g: std_logic_vector (numeroBits-1 downto 0);
		variable c: std_logic_vector (numeroBits downto 0);
	begin
		C(0) := op;
		for i in 0 to (numeroBits -1) loop
			eb(i) := b(i) xor op;
			p(i) := a(i) xor eb(i);
			g(i) := a(i) and eb(i);
			s(i) <= p(i) xor c(i);
			c(i+1) := (c(i) and p(i)) or g(i);
		end loop;
		cout <= c(numeroBits);
	--	
	end process;
end A_Prueba;