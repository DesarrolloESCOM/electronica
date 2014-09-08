library ieee;
use ieee.std_logic_1164.all;

entity Prueba is 
	generic (numeroBits : integer :=20); --cuatro bits
	Port(
		a: in std_logic_vector (numeroBits-1 downto 0);
		b: in std_logic_vector (numeroBits-1 downto 0);
		op: in std_logic ;
		s: out std_logic_vector (numeroBits-1 downto 0);
		cout: out std_logic
		);
end Prueba;
--/*
--
--Ecuaciones de sumador con acarreo en cascada
--
--EB(i) =  B(i) xor OP
--S(i) = A(i) xor EB(i) xor C(i)*
--C(i+1) = EB(i)C(i) or A(i)C(i) + A(i)EB(i)
--
--*Implica una salida del circuito
--
--Sentencias de repetición en vhdl.
--
-->> Concurrente
--	for-generate -> Se puede ejecutar fuera de un bloque process
--	etiqueta:
--		for [variable] in [rango] generate
--		--codigo vhdl
--		end generate;
-->> Iterativa
--	for-loop -> Se ejecuta dentro de un bloque process
--	etiqueta:
--		for [variable] in [rango] LOOP
--		--codigo vhdl
--		end loop;
--
--*/

architecture A_Prueba of Prueba is
--/*Declaracion de señales*/
--signal eb: std_logic_vector (3 downto 0);
--signal c : std_logic_vector (4 downto 0);
--/*Proceso inicial*/
begin
	process(a,b,op)
		variable eb: std_logic_vector (numeroBits-1 downto 0);
		variable c: std_logic_vector (numeroBits downto 0);
	begin
		c(0):= '0';
		for i in 0 to (numeroBits -1) loop
			eb(i) := b(i) xor op;
			s(i) <= a(i) xor eb(i) xor c(i);
			c(i+1) := (eb(i) and c(i)) or (a(i) and c(i)) or (a(i) and eb(i));
		end loop;
	end process;
end A_Prueba;