library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity STOP_WATCH_TOP is
  
    port (
      --EN1 start en
        I_EN1         :  in std_logic;
      --EN2 clear_en
        I_EN2         :  in std_logic;
        I_CLK         :  in std_logic;
        I_RESN        :  in std_logic;
        O_TIMER_MS  :   out std_logic_vector(9 downto 0);
        O_TIMER_SEC :   out std_logic_vector(5 downto 0)  
        );
    
  end STOP_WATCH_TOP;
  
  architecture RTL of STOP_WATCH_TOP is

    component CLKDIV
        Port (
            I_CLK      :  in std_logic;
            I_RSTN     :  in std_logic;
            I_CLEAR_EN :  in std_logic;
            I_START_EN :  in std_logic;
            O_EN_1MS   :  out std_logic
            );
    end component;

    component SYNC
        Port (
            I_CLK      :   in std_logic;
            I_START_EN :   in std_logic;
            I_CLR_EN   :   in std_logic;
            I_RSTN     :   in std_logic;
            O_START_EN :  out std_logic;
            O_CLR_EN   :  out std_logic
            );
    end component;

    component TIMER_COUNTER
        Port (
            I_CLK       :   in std_logic;
            I_RSTN      :   in std_logic;
            I_EN_1MS    :   in std_logic;
            I_CLEAR_EN  :   in std_logic;
            I_START_EN  :   in std_logic;
            O_TIMER_MS  :   out std_logic_vector(9 downto 0);
            O_TIMER_SEC :   out std_logic_vector(5 downto 0)
            );
    end component;
    
    signal  clock         :   std_logic;
    signal  resn          :   std_logic;
    signal  start_en      :   std_logic;
    signal  clear_en      :   std_logic;
    signal  sync_o_start_en :   std_logic;
    signal  sync_o_clear_en :   std_logic;
    signal  en_1ms          :   std_logic;
    signal  timer_ms      :   std_logic_vector(9 downto 0);
    signal  timer_sec     :   std_logic_vector(5 downto 0);

begin
    clock     <=  I_CLK;
    resn      <=  I_RESN;
    start_en  <=  I_EN1;
    clear_en  <=  I_EN2;
    O_TIMER_MS  <=  timer_ms;
    O_TIMER_SEC <=  timer_sec;

    U_CLKDIV: CLKDIV
    port map(
        I_CLK       =>  clock,      
        I_RSTN      =>  resn,
        I_CLEAR_EN  =>  sync_o_clear_en,
        I_START_EN  =>  sync_o_start_en,
        O_EN_1MS    =>  en_1ms
    );

    U_SYNC: SYNC
    port map(
        I_CLK       =>  clock,
        I_START_EN  =>  start_en,
        I_CLR_EN    =>  clear_en,
        I_RSTN      =>  resn,
        O_START_EN  =>  sync_o_start_en,
        O_CLR_EN    =>  sync_o_clear_en
    );

    U_TIMER_COUNTER: TIMER_COUNTER
    port map(
        I_CLK       =>  clock,
        I_RSTN      =>  resn,
        I_EN_1MS    =>  en_1ms,
        I_CLEAR_EN  =>  sync_o_clear_en,
        I_START_EN  =>  sync_o_start_en,
        O_TIMER_MS  =>  timer_ms,
        O_TIMER_SEC =>  timer_sec
    );

end;
