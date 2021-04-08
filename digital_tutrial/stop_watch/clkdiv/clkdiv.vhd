library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity CLKDIV is
  
  port (
    I_CLK      :   in std_logic;
    I_RSTN    :   in std_logic;
    O_EN_1MS   :  out std_logic
    );
  
end CLKDIV;

architecture RTL of CLKDIV is

    signal en_1ms_reg           : std_logic;
    signal en_1ms_w             : std_logic;
    signal counter_1ms_w        : std_logic_vector(3 downto 0);
    signal counter_1ms_reg      : std_logic_vector(3 downto 0);
    
    begin  -- RTL of CLKDIV

        O_EN_1MS <= en_1ms_reg;

    -- counter limit 13
        counter_1ms_w <= "0000" when ( counter_1ms_reg = "1011" )
                        else  counter_1ms_reg + 1;
        
    -- counter reg 
        process (I_CLK, I_RSTN) begin
            if (I_RSTN  ='0')then
                counter_1ms_reg  <=  "0000";
            elsif (I_CLK'event and I_CLK='1') then
                counter_1ms_reg  <= counter_1ms_w ;
            end if;
        end process;

    -- enble
        en_1ms_w <= '1' when (counter_1ms_reg = "1011") else '0';
                    
    -- output en
        process (I_CLK, I_RSTN) begin
            if (I_RSTN  ='0')then
                en_1ms_reg  <=  '0';
            elsif (I_CLK'event and I_CLK='1') then
                en_1ms_reg <= en_1ms_w;
            end if;
        end process;
end RTL;
