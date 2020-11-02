----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2020 05:21:10 PM
-- Design Name: 
-- Module Name: topCircuit - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.all;

entity topCircuit is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           done : out STD_LOGIC;
           we : out STD_LOGIC;
           addr : out STD_LOGIC_VECTOR (3 downto 0);
           dataOUT : out STD_LOGIC_VECTOR (31 downto 0));
end topCircuit;

architecture Behavioral of topCircuit is
SIGNAL we_int: STD_LOGIC;
SIGNAL oper_int: STD_LOGIC;
SIGNAL muxAddr_int : STD_LOGIC_VECTOR (1 downto 0);
SIGNAL memAddr_int : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL memAddr_delay : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL A_int, B_int, C_int, D_int, E_int, F_int : std_logic_vector(15 downto 0);
SIGNAL outValue_int : std_logic_vector(31 downto 0);
SIGNAL memAddr : STD_LOGIC_VECTOR (9 downto 0);
SIGNAL memAddr_intdelay : STD_LOGIC_VECTOR (9 downto 0);



COMPONENT Control 
    PORT(
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        done : out STD_LOGIC;
        we : out STD_LOGIC;
        oper : out STD_LOGIC;
        muxAddr : out STD_LOGIC_VECTOR ( 1 downto 0);
        memAddr : out STD_LOGIC_VECTOR (3 downto 0);
        memAddr_delay : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

COMPONENT datapath
    PORT(
        clk : in STD_LOGIC;
        muxAddr : in STD_LOGIC_VECTOR (1 downto 0);
        outValue : out STD_LOGIC_VECTOR (31 downto 0);
        inA : in STD_LOGIC_VECTOR (15 downto 0);
        inB : in STD_LOGIC_VECTOR (15 downto 0);
        inC : in STD_LOGIC_VECTOR (15 downto 0);
        inD : in STD_LOGIC_VECTOR (15 downto 0);
        inE : in STD_LOGIC_VECTOR (15 downto 0);
        inF : in STD_LOGIC_VECTOR (15 downto 0);
        oper : in STD_LOGIC);
END COMPONENT;

COMPONENT MemIN
    PORT(
        clk    : in  std_logic;
        addr   : in  std_logic_vector(9 downto 0);
        A, B, C, D, E, F : out std_logic_vector(15 downto 0));
END COMPONENT;
    
    
COMPONENT memOUT
    PORT(
        clk     : in  std_logic;                    
        addr    : in  std_logic_vector(9 downto 0); 
        we      : in  std_logic;                    
        dataIN  : in  std_logic_vector(31 downto 0);
        dataOUT : out  std_logic_vector(31 downto 0));
END COMPONENT;

begin

memAddr <= "000000"&memAddr_int;
memAddr_intdelay <= "000000"&memAddr_delay;

inst_Control : Control port map(
    clk => clk,
    rst => rst,
    done => done,
    we => we_int,
    oper => oper_int,
    muxAddr => muxAddr_int,
    memAddr => memAddr_int,
    memAddr_delay =>memAddr_delay);
    
we <= we_int;
addr <= memAddr_delay;

inst_datapath : datapath port map(
    clk => clk,
    muxAddr => muxAddr_int,
    outValue => outValue_int,
    inA => A_int,
    inB => B_int,
    inC => C_int,
    inD => D_int,
    inE => E_int,
    inF => F_int,
    oper => oper_int);
    
inst_memOut : memOut port map(
    clk => clk   ,
    addr => memAddr_intdelay,
    we => we_int,
    dataIN => outValue_int,
    dataOUT => dataOUT);
    
 
 inst_MemIN : MemIN port map(
    clk => clk,
    addr => memAddr,
    A => A_int,
    B => B_int,
    C => C_int,
    D => D_int, 
    E => E_int,  
    F => F_int);-- falta memIN

end Behavioral;
