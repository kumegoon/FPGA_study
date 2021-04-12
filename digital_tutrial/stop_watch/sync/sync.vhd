library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity sync is
  
  port (
    I_CLK      :   in std_logic;
    I_START_EN :   in std_logic;
    I_CLR_EN   :   in std_logic;
    I_RSTN    :   in std_logic;
    O_START_EN :  out std_logic;
    O_CLR_EN   :  out std_logic
    );
end sync;

architecture RTL of sync is

  signal start_en1_reg      : std_logic;
  signal start_en2_reg      : std_logic;
  signal start_en1_equal_en2_w         : std_logic;
  signal start_buf1_w        : std_logic;
  signal start_buf1_reg      : std_logic;     -- out enable start
  signal start_buf2_reg      : std_logic;     -- out enable start
  signal start_up_edge_w     : std_logic;
  signal start_en_buf         : std_logic;  
  signal start_en_reg       : std_logic;     -- out enable start
  signal start_up_edge_reg : std_logic;
  signal clear_en1_reg      : std_logic;
  signal clear_en2_reg      : std_logic;
  signal clear_en_w         : std_logic;
  signal clear_buf_w            : std_logic;
  signal clear_en_reg       : std_logic;     -- out enable clear
  
    begin  -- RTL

     O_START_EN  <= start_en_reg;
     O_CLR_EN    <= clear_en_reg;

       process (I_CLK, I_RSTN) begin
         if (I_RSTN  ='0')then
           start_en1_reg  <=  '0';
         elsif (I_CLK'event and I_CLK='1') then
           start_en1_reg  <=  I_START_EN;
         end if;
       end process;           

       process (I_CLK, I_RSTN) begin
         if (I_RSTN  ='0')then
           start_en2_reg  <=  '0';
         elsif (I_CLK'event and I_CLK='1') then
           start_en2_reg  <=  start_en1_reg;
         end if;
       end process;           

     start_en1_equal_en2_w  <=  '1' when(start_en1_reg = start_en2_reg) else '0';
     start_buf1_w     <=  start_en2_reg when(start_en1_equal_en2_w = '1') else start_buf1_reg;

       process (I_CLK, I_RSTN) begin
         if (I_RSTN  ='0')then
           start_buf1_reg  <=  '0';
         elsif (I_CLK'event and I_CLK='1') then
           start_buf1_reg  <= start_buf1_w;
         end if;
       end process;                

       process (I_CLK, I_RSTN) begin
         if (I_RSTN  ='0')then
           start_buf2_reg  <=  '0';
         elsif (I_CLK'event and I_CLK='1') then
           start_buf2_reg  <= start_buf1_reg;
         end if;
       end process;


      start_up_edge_w <= not start_buf2_reg and start_buf1_reg;

       process (I_CLK, I_RSTN) begin
         if (I_RSTN  ='0')then
           start_up_edge_reg  <=  '0';
         elsif (I_CLK'event and I_CLK='1') then
           start_up_edge_reg  <= start_up_edge_w;
         end if;
       end process;     

      start_en_buf <= not start_en_reg when (start_up_edge_reg ='1') else start_en_reg;
        
       process (I_CLK, I_RSTN) begin
        if (I_RSTN  ='0')then
          start_en_reg  <=  '0';
        elsif (I_CLK'event and I_CLK='1') then
          start_en_reg <= start_en_buf;
        end if;
      end process; 

-- clear 
     
       process (I_CLK, I_RSTN) begin
         if (I_RSTN  ='0')then
           clear_en1_reg  <=  '0';
         elsif (I_CLK'event and I_CLK='1') then
           clear_en1_reg  <=  I_CLR_EN;
         end if;
       end process;           

       process (I_CLK, I_RSTN) begin
         if (I_RSTN  ='0')then
           clear_en2_reg  <=  '0';
         elsif (I_CLK'event and I_CLK='1') then
           clear_en2_reg  <=  clear_en1_reg;
         end if;
       end process;           

     clear_en_w  <=  '1' when(clear_en1_reg = clear_en2_reg) else '0';
     clear_buf_w     <=  clear_en2_reg when(clear_en_w = '1') else clear_en_reg;

       process (I_CLK, I_RSTN) begin
         if (I_RSTN  ='0')then
           clear_en_reg  <=  '0';
         elsif (I_CLK'event and I_CLK='1') then
           clear_en_reg  <=  clear_buf_w;
         end if;
       end process;              
     
    end RTL;    
