library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity STOP_WATCH_TOP is
  
    port (
      I_EN1         :  in std_logic;  --start_en
      I_EN2         :  in std_logic;  --clear_en
      I_CLK         :  in std_logic;
      I_RESN        :  in std_logic;
      O_TIMER_MS  :   out std_logic_vector(9 downto 0);
      O_TIMER_SEC :   out std_logic_vector(5 downto 0)  
      );
    
  end STOP_WATCH_TOP;
  
  architecture RTL of TOP_WATCH_TOP is

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
    