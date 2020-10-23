----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2020 04:47:15 PM
-- Design Name: 
-- Module Name: shifter - Behavioral
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
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_SIGNED.all;

entity shifter is
    Port ( inBus : in STD_LOGIC_VECTOR (31 downto 0);
           outBus : out STD_LOGIC_VECTOR (31 downto 0);
           enable : in STD_LOGIC);
end shifter;

architecture Behavioral of shifter is


begin
    PROCESS (inBus,enable)
    BEGIN
        IF enable = '1' THEN
            outBus <= "00" & inBus(31 downto 2);
        ELSE
            outBus <= inBus;
        END IF;
    END PROCESS;


end Behavioral;
