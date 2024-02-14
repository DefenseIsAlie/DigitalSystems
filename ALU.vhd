library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;
entity ALU is
Port ( A, B : in STD_LOGIC_VECTOR(2 downto 0); -- 2 inputs 8-bit
ALU_Sel : in STD_LOGIC_VECTOR(1 downto 0);
ALU_Out : out STD_LOGIC_VECTOR(3 downto 0));
end ALU;

architecture Behavioral of ALU is
Begin
	c1: process (A,B,ALU_Sel)
		Begin

		case ALU_Sel is
			when "00" =>
				ALU_Out <= ('0'&A) + ('0'&B);
			when "01" =>
				ALU_Out <= ('0'&A) - ('0'&B);
			when "10" =>
				ALU_Out(3) <= '0';
				ALU_Out(2) <= A(2) and B(2);
				ALU_Out(1) <= A(1) and B(1);
				ALU_Out(0) <= A(0) and B(0);
			when "11" =>
				ALU_Out(3) <= '0';
				ALU_Out(2) <= A(2) xor B(2);
				ALU_Out(1) <= A(1) xor B(1);
				ALU_Out(0) <= A(0) xor B(0);
		end case;
	end process c1;
end Behavioral;