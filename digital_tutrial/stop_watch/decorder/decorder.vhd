library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity DECORDER is
  
  port (
    DATA_IN  : in   std_logic_vector(3 downto 0);
    DATA_OUT : out  std_logic_vector(6 downto 0)
    );
  
end DECORDER;

architecture RTL of DECORDER is

begin  -- RTL of DECORDER
   process ( DATA_IN ) begin
        case DATA_IN is
              when "0000" => DATA_OUT <= "1111110" ;
              when "0001" => DATA_OUT <= "0110000" ;
              when "0010" => DATA_OUT <= "1101101" ;
              when "0011" => DATA_OUT <= "1111001" ;
              when "0100" => DATA_OUT <= "0110011" ;
              when "0101" => DATA_OUT <= "1011011" ;
              when "0110" => DATA_OUT <= "1011111" ;
              when "0111" => DATA_OUT <= "1110000" ;
              when "1000" => DATA_OUT <= "1111111" ;
              when "1001" => DATA_OUT <= "1111011" ;
              when "1010" => DATA_OUT <= "0000000" ;
              when "1011" => DATA_OUT <= "0000000" ;
              when "1100" => DATA_OUT <= "0000000" ;
              when "1101" => DATA_OUT <= "0000000" ;
              when "1110" => DATA_OUT <= "0000000" ;
              when "1111" => DATA_OUT <= "0000000" ;                            
              when others  => DATA_OUT <= "XXXXXXX" ;
        end case;
   end process;
end RTL;
