library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_SIGNED.all;
use IEEE.numeric_std.all;


entity datapath is
    Port ( clk : in STD_LOGIC;
           muxAddr : in STD_LOGIC_VECTOR (1 downto 0);
           outValue : out STD_LOGIC_VECTOR (31 downto 0);
           inA : in STD_LOGIC_VECTOR (15 downto 0);
           inB : in STD_LOGIC_VECTOR (15 downto 0);
           inC : in STD_LOGIC_VECTOR (15 downto 0);
           inD : in STD_LOGIC_VECTOR (15 downto 0);
           inE : in STD_LOGIC_VECTOR (15 downto 0);
           inF : in STD_LOGIC_VECTOR (15 downto 0);
           oper : in STD_LOGIC);
end datapath;

architecture Behavioral of datapath is
    SIGNAL reg0Out, reg1Out, reg2Out, reg3Out : STD_LOGIC_VECTOR(31 downto 0);
    SIGNAL mux0Out, mux1Out, mux2Out, mux3Out, mux4Out, mux5Out, mux6Out, mux7Out : STD_LOGIC_VECTOR(31 downto 0);
    SIGNAL shifterOut : STD_LOGIC_VECTOR(31 downto 0);
    SIGNAL ALU0Out, ALU1Out : STD_LOGIC_VECTOR(31 downto 0);
    SIGNAL multiplier0Out, multiplier1Out : STD_LOGIC_VECTOR(31 downto 0);
    SIGNAL shiftedSignal :STD_LOGIC_VECTOR(31 downto 0);
    SIGNAL DONTCARE : STD_LOGIC_VECTOR(31 downto 0):= (others =>'X');
    SIGNAL Zeros : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    SIGNAL A, B, C, D, E, F: STD_LOGIC_VECTOR(31 downto 0);
    

    COMPONENT ALU
        PORT(
            A : in STD_LOGIC_VECTOR (31 downto 0);
            B : in STD_LOGIC_VECTOR (31 downto 0);
            oper : in STD_LOGIC;
            result : out STD_LOGIC_VECTOR (31 downto 0));
    END COMPONENT;
    
    COMPONENT multiplier
        PORT(
            A : in STD_LOGIC_VECTOR (31 downto 0);
            B : in STD_LOGIC_VECTOR (31 downto 0);
            result : out STD_LOGIC_VECTOR (31 downto 0));
    END COMPONENT;
    
    COMPONENT multiplexer
        PORT(
            inBus0 : in STD_LOGIC_VECTOR (31 downto 0);
            inBus1 : in STD_LOGIC_VECTOR (31 downto 0);
            inBus2 : in STD_LOGIC_VECTOR (31 downto 0);
            inBus3 : in STD_LOGIC_VECTOR (31 downto 0);
            outBus : out STD_LOGIC_VECTOR (31 downto 0);
            address : in STD_LOGIC_VECTOR (1 downto 0));
    END COMPONENT;
    
    
    COMPONENT reg
        PORT(
            D : in STD_LOGIC_VECTOR (31 downto 0);
            Q : out STD_LOGIC_VECTOR (31 downto 0);
            clk : in STD_LOGIC);
    END COMPONENT;
        
begin


A <= SXT(inA,32);
B <= SXT(inB,32);
C <= SXT(inC,32);
D <= SXT(inD,32);
E <= SXT(inE,32);
F <= SXT(inF,32);
shiftedSignal <= mux5Out(31)& mux5Out(31)& mux5Out(31 downto 2);

    inst_reg0 : reg port map(
        D => multiplier0Out ,
        Q =>  reg0Out,
        clk => clk);
        
    inst_reg1 : reg port map(
        D => multiplier1Out ,
        Q =>  reg1Out,
        clk => clk);
        
    inst_reg2 : reg port map(
        D => ALU0Out ,
        Q =>  reg2Out,
        clk => clk);
        
    inst_reg3 : reg port map(
        D => ALU1Out ,
        Q =>  reg3Out,
        clk => clk);
        
     
    inst_ALU0 : ALU port map(
        A => mux4Out ,
        B => shiftedSignal,
        oper =>  oper,
        result =>  ALU0Out);
    
    inst_ALU1 : ALU port map(
        A => mux6Out ,
        B => mux7Out,
        oper =>  oper,
        result =>  ALU1Out);
        
    inst_multiplier0 : multiplier port map(
        A => mux0Out ,
        B => mux1Out,
        result =>  multiplier0Out);
    
    inst_multiplier1 : multiplier port map(
        A => mux2Out ,
        B => mux3Out,
        result =>  multiplier1Out);
        

    inst_mux0 : multiplexer port map(
        inBus0 => B,
        inBus1 => E,
        inBus2 => reg3Out,
        inBus3 => DONTCARE, -- Dont Care
        outBus => mux0Out,
        address => muxAddr );
        
    inst_mux1 : multiplexer port map(
        inBus0 => F,
        inBus1 => reg3Out,
        inBus2 => reg0Out,
        inBus3 => DONTCARE, -- Dont Care
        outBus => mux1Out,
        address => muxAddr );
        
    inst_mux2 : multiplexer port map(
        inBus0 => DONTCARE,     -- Dont Care
        inBus1 => A,
        inBus2 => reg1Out,
        inBus3 => DONTCARE, -- Dont Care
        outBus => mux2Out,
        address => muxAddr );
        
    inst_mux3 : multiplexer port map(
        inBus0 => DONTCARE,     -- Dont Care
        inBus1 => E,
        inBus2 => reg2Out,
        inBus3 => DONTCARE, -- Dont Care
        outBus => mux3Out,
        address => muxAddr );
        
    inst_mux4 : multiplexer port map(
        inBus0 => DONTCARE,     -- Dont Care
        inBus1 => reg3Out,
        inBus2 => DONTCARE, -- Dont Care
        inBus3 => DONTCARE, -- Dont Care
        outBus => mux4Out,
        address => muxAddr );
    
    inst_mux5 : multiplexer port map(
        inBus0 => DONTCARE,     -- Dont Care
        inBus1 => reg0Out,
        inBus2 => DONTCARE, -- Dont Care
        inBus3 => DONTCARE, -- Dont Care
        outBus => mux5Out,
        address => muxAddr );
   
    inst_mux6 : multiplexer port map(
        inBus0 => C,     
        inBus1 => A,
        inBus2 => DONTCARE, -- Dont Care
        inBus3 => reg1Out, 
        outBus => mux6Out,
        address => muxAddr );
        
    inst_mux7 : multiplexer port map(
        inBus0 => D,     
        inBus1 => reg0Out,
        inBus2 => DONTCARE, -- Dont Care
        inBus3 => reg0Out,
        outBus => mux7Out,
        address => muxAddr );

    
    outValue <= ALU1Out;

end Behavioral;
