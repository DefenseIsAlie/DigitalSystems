--- Write VHDL code for 3-bit adder/subtractor in
--- structural modelling style. The adder/subtractor
--- operation is controlled by signal 'm'.

------------- ENTITY DECLARATION --> 1bit adder ---------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity bit_adder is
port(A,B,Cin : in STD_LOGIC;
 
S,Cout : out STD_LOGIC 
);
end bit_adder;

architecture dataflow of bit_adder is
Begin

S <= A xor B xor Cin;
Cout <= (A and B) or (B and Cin) or (Cin and A);

end dataflow;


---------------------------------------------


--- ENTITY DECLARATION --> 3bitAdderSubtractor

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;--define the entity with ports
entity adsub_3bit is
port (a : in STD_LOGIC_VECTOR (2 downto 0);
b : in STD_LOGIC_VECTOR (2 downto 0);
m : in STD_LOGIC;
sum :out STD_LOGIC_VECTOR (2 downto 0);
carry : out STD_LOGIC);
end adsub_3bit;

architecture structural of adsub_3bit is

component bit_adder is
	port(A,B,Cin : in std_LOGIC;
		S , Cout : out std_LOGIC);
end component;

signal C1,C2,C3 : std_LOGIC;
signal G1,G2,G3 : std_LOGIC;

begin
G1 <= b(0) xor m;
G2 <= b(1) xor m;
G3 <= b(2) xor m;

u0: bit_adder port map (a(0),G1,m,sum(0),C1);
u1: bit_adder port map (a(1),G2,C1,sum(1),C2);
u2: bit_adder port map (a(2),G3,C2,sum(2),carry);

end structural;


----------------------------------------------------------------------------------------------------




----------------------------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fulladder is
port(i1, i2, i3: in bit;
o1, o2 : out bit);
end fulladder;

architecture dataflow of fulladder is
Begin
o1 <= i1 xor i2 xor i3;
o2 <= (i1 and i2) or ((i1 xor i2) and i3);
end dataflow;
-----------------------------------------------------------------------------------------------------