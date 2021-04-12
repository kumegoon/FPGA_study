library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity TIMER_COUNTER is
  
  port (
    I_CLK       :   in std_logic;
    I_RSTN      :   in std_logic;
    I_EN_1MS    :   in std_logic;
    I_CLEAR_EN  :   in std_logic;
    I_START_EN  :   in std_logic;
    O_TIMER_MS  :   out std_logic_vector(9 downto 0);
    O_TIMER_SEC :   out std_logic_vector(5 downto 0)
    );
  
end TIMER_COUNTER;

architecture RTL of TIMER_COUNTER is

    signal clear_en_w           : std_logic;
    signal timer_ms_buf1         : std_logic_vector(9 downto 0);
    signal timer_ms_buf2         : std_logic_vector(9 downto 0);
    signal timer_ms_buf3         : std_logic_vector(9 downto 0);
    signal timer_ms_buf4         : std_logic_vector(9 downto 0);
    signal timer_ms_reg         : std_logic_vector(9 downto 0);

    signal timer_sec_buf1        : std_logic_vector(5 downto 0);
    signal timer_sec_buf2        : std_logic_vector(5 downto 0);
    signal timer_sec_buf3        : std_logic_vector(5 downto 0);
    signal timer_sec_buf4        : std_logic_vector(5 downto 0);
    signal timer_sec_reg        : std_logic_vector(5 downto 0);

    
    begin  -- RTL of TIMER_COUNTER

        O_TIMER_MS  <= timer_ms_reg;
        O_TIMER_SEC <= timer_sec_reg;
        clear_en_w <= I_CLEAR_EN;


    -- timer ms reg 
        timer_ms_buf4 <=  "0000000000" when clear_en_w = '1'    else timer_ms_buf3 ;
        timer_ms_buf3 <= timer_ms_buf2 when I_START_EN = '1'    else timer_ms_reg ;
        timer_ms_buf2 <= timer_ms_buf1 when I_EN_1MS ='1'       else timer_ms_reg ;
      -- timer_ms_regが1000でリセット
        timer_ms_buf1 <= "0000000000"  when ( timer_ms_reg = "1111100111" ) else timer_ms_reg + 1;

        process (I_CLK, I_RSTN) begin
            if (I_RSTN  ='0')then
                timer_ms_reg  <=  "0000000000";
            elsif (I_CLK'event and I_CLK='1') then
                timer_ms_reg  <=  timer_ms_buf4;
            end if;
        end process;

    -- timer sec reg 
        timer_sec_buf4 <=  "000000" when clear_en_w = '1' else timer_sec_buf3 ;
        timer_sec_buf3 <= timer_sec_buf2 when I_START_EN = '1' else timer_sec_reg; 
        timer_sec_buf2 <= timer_sec_buf1 when I_EN_1MS = '1' else timer_sec_reg;
        -- timer_sec_regが60でリセット
        timer_sec_buf1 <= "000000" when timer_sec_reg =  "111100" else
                          timer_sec_reg + 1 when timer_ms_reg = "1111100111" else
                          timer_sec_reg;
        
    process (I_CLK, I_RSTN) begin
        if (I_RSTN  ='0')then
            timer_sec_reg  <=  "000000";
        elsif (I_CLK'event and I_CLK='1') then
            timer_sec_reg  <=  timer_sec_buf4;
        end if;
    end process;

end RTL;
