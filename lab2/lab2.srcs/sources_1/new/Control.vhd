library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_SIGNED.all;


entity Control is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           done : out STD_LOGIC;
           we : out STD_LOGIC;
           oper : out STD_LOGIC;
           muxAddr : out STD_LOGIC_VECTOR ( 1 downto 0);
           memAddr : out STD_LOGIC_VECTOR (3 downto 0);
           memAddr_delay :out STD_LOGIC_VECTOR (3 downto 0));
end Control;

architecture Behavioral of Control is
SIGNAL enableCounter : STD_LOGIC;
SIGNAL we_delay : STD_LOGIC;
SIGNAL counterValue: std_LOGIC_VECTOR (3 downto 0);
SIGNAL memAddr_intdelay: std_LOGIC_VECTOR (3 downto 0);

COMPONENT StateMachine 
    PORT(
        done : out STD_LOGIC;
        clk : in STD_LOGIC;
        we : out STD_LOGIC;
        rst: in STD_LOGIC;
        oper : out STD_LOGIC;
        enable : out STD_LOGIC;
        addr : out STD_LOGIC_VECTOR (1 downto 0);
        index : in STD_LOGIC_VECTOR (3 downto 0));
    END COMPONENT;
    
COMPONENT counter
    PORT(
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        enable : in STD_LOGIC;
        counterOut : out STD_LOGIC_VECTOR (3 downto 0));
    END COMPONENT;
COMPONENT delay
    PORT(
        D : in STD_LOGIC_VECTOR (3 downto 0);
        Q : out STD_LOGIC_VECTOR (3 downto 0);
        clk : in STD_LOGIC);
    END COMPONENT;
        
   
begin


    
    inst_counter: counter port map(
        clk => clk,
        rst => rst,
        enable => enableCounter ,
        counterOut => counterValue);
        
    inst_delay : delay port map(
        D => counterValue ,
        Q =>  memAddr_intdelay,
        clk => clk);
    
    inst_StateMachine: StateMachine port map(
        done => done,
        clk => clk,
        we => we_delay,
        rst => rst,
        oper => oper,
        enable => enableCounter,
        addr => muxAddr,
        index => memAddr_intdelay);
    
    memAddr <=counterValue;
    memAddr_delay <=memAddr_intdelay;
   
   
    PROCESS(clk)
    BEGIN
        IF clk'event and clk ='1' then
            we <= we_delay;
        end if;
    END PROCESS;
    
end Behavioral;
