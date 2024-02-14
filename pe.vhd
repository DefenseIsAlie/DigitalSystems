library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.NUMERIC_STD.all;

entity pe is
Port ( inp : in STD_LOGIC_VECTOR (3 downto 0);
enable : in STD_LOGIC ;
OUTPUT : out STD_LOGIC_VECTOR (1 downto 0));
end pe;



architecture Behavioral of pe is
begin
process(inp)
begin
if enable = '1' then
if (inp(3)='1') then
OUTPUT <= "11";
elsif (inp(2)='1') then
OUTPUT <= "10";
elsif (inp(1)='1') then
OUTPUT <= "01";
elsif (inp(0)='1') then
OUTPUT <= "00";
end if;
else
OUTPUT <= "00";
end if;
end process;
end Behavioral;
