library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Prueba is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           op : in  STD_LOGIC;
           s : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end Prueba;

architecture A_Prueba of Prueba is
signal eb : std_logic_vector (3 downto 0);
signal c : std_logic_vector (4 downto 0);
begin

	c(0) <= op;
	sumador : for i in 0 to 3 generate
		EB(i) <= B(i) xor OP;
		S(i) <= A(i) xor EB(i) xor C(i);
		C(i+1) <= (EB(i) and C(i)) or (A(i) and C(i)) or(A(i) and EB(i));	
	end generate;
	cout <= c(4);

end A_Prueba;

