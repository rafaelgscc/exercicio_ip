---------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.05.2018 14:44:18
-- Design Name: 
-- Module Name: deco - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity deco is
    Port ( ascii : in STD_LOGIC_VECTOR (7 downto 0);
           clk  :  in STD_LOGIC;
           reset:  in STD_LOGIC;
           duty : out STD_LOGIC_VECTOR (3 downto 0);
           leds : out STD_LOGIC_VECTOR (7 downto 0));
end deco;

architecture Behavioral of deco is

begin

process(reset,clk) begin
    if reset = '1' then
    duty<="0000"; --preset do duty
    elsif  rising_edge(clk) then
        case ascii is
            when "00110000"=>duty<="0000"; --0
            when "00110001"=>duty<="0001"; --1
            when "00110010"=>duty<="0010"; --2
            when "00110011"=>duty<="0011"; --3
            when "00110100"=>duty<="0100"; --4
            when "00110101"=>duty<="0101"; --5
            when "00110110"=>duty<="0110"; --6
            when "00110111"=>duty<="0111"; --7
            when "00111000"=>duty<="1000"; --8
            when "00111001"=>duty<="1001"; --9
            when "01000001"=>duty<="1010"; --A
            when "01000010"=>duty<="1011"; --B
            when "01000011"=>duty<="1100"; --C
            when "01000100"=>duty<="1101"; --D
            when "01000101"=>duty<="1110"; --E
            when "01000110"=>duty<="1111"; --F
            when OTHERS=>duty<="----"; --don't care
        end case;
    end if;    
end process;

process (reset,clk) begin
    if reset = '1' then
    leds<="00000000";
    elsif rising_edge(clk) then
        leds<=ascii;
    end if;
end process;        

end Behavioral;