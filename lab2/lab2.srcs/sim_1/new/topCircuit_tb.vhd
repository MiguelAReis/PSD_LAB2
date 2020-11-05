----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/01/2020 05:45:47 PM
-- Design Name: 
-- Module Name: topCircuit_tb - Behavioral
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

entity topCircuit_tb is
--  Port ( );
end topCircuit_tb;

architecture Behavioral of topCircuit_tb is

COMPONENT topCircuit
    PORT(   clk : in STD_LOGIC;
            rst : in STD_LOGIC;
            done : out STD_LOGIC;
            we : out STD_LOGIC;
            addr : out STD_LOGIC_VECTOR (3 downto 0);
            dataOUT : out STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

  SIGNAL clk : std_logic :='0';
  SIGNAL rst : std_logic :='0';
  
  SIGNAL done : std_logic :='0';
  SIGNAL we : std_logic :='0';
  SIGNAL addr : STD_LOGIC_VECTOR (3 downto 0):= (OTHERS =>'0');
  SIGNAL dataOUT : STD_LOGIC_VECTOR (31 downto 0):= (OTHERS =>'0');

    CONSTANT clk_period: time := 50ns;
begin

    uut: topCircuit PORT MAP (
        clk => clk,
        rst => rst,
        done => done,
        we => we,
        addr => addr,
        dataOUT => dataOUT);
        
    clk_process : PROCESS
        BEGIN
            clk <= '0';
            WAIT FOR clk_period/2;
            clk <= '1';
            WAIT FOR clk_period/2;
        END PROCESS;
    
     stim_proc : PROCESS
        BEGIN
            rst <=  '1' AFTER 0 ns,
                    '0' AFTER 200 ns;
        WAIT;
        END PROCESS;

end Behavioral;
