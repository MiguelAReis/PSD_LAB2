----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2020 06:30:33 PM
-- Design Name: 
-- Module Name: multiplexer - Behavioral
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
------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux3to1 is
    Port ( inBus0 : in STD_LOGIC_VECTOR (31 downto 0);
           inBus1 : in STD_LOGIC_VECTOR (31 downto 0);
           inBus2 : in STD_LOGIC_VECTOR (31 downto 0);
           outBus : out STD_LOGIC_VECTOR (31 downto 0);
           address : in STD_LOGIC_VECTOR (1 downto 0));
end mux3to1;

architecture Behavioral of mux3to1 is

begin
WITH address SELECT
    outBus <= inBus0 when "00",
              inBus1 when "01",  
              inBus2 WHEN OTHERS;
              
              
end Behavioral;