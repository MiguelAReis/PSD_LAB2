
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity StateMachine is
    Port ( done : out STD_LOGIC;
           clk : in STD_LOGIC;
		   we : out STD_LOGIC;
		   rst: in STD_LOGIC;
		   oper : out STD_LOGIC;
		   enable : out STD_LOGIC;
		   addr : out STD_LOGIC_VECTOR (1 downto 0);
		   index : in STD_LOGIC_VECTOR (3 downto 0));
end StateMachine;

architecture Behavioral of StateMachine is
    TYPE STATE_TYPE is (s0,s1,s2,s3,s4,s5,sFim);
    SIGNAL state : STATE_TYPE;

begin
    PROCESS (clk, rst)
    BEGIN
        IF rst = '1' THEN
            state <=s0;
        ELSIF (clk'EVENT AND clk ='1') THEN
            CASE state IS 
                WHEN s0 =>
                    state <= s1;
                WHEN s1 =>
                    state <= s2;
                WHEN s2 =>
                    state <= s3;
                WHEN s3 =>
					state <= s4;
                WHEN s4=>
                    state <= s5;
				WHEN s5=>
					IF index = 16 THEN
					state <= sFim;
					ELSE
					state <= s1;
					END IF;
                WHEN OTHERS =>
                    state <= sFim;
             END CASE;
        END IF;
    END PROCESS;
    
        PROCESS (state)
    BEGIN
        CASE state IS 
            WHEN s0=> 
				addr <= "00";
				oper <= '0';
				we <= '0';
				enable <= '0';
				done <= '0';
			WHEN s1=>
				addr <= "00";
				oper <= '0';
				we <= '0';
				enable <= '0';
				done <= '0';
			WHEN s2=>
				addr <= "00";
				oper <= '0';
				we <= '0';
				enable <= '0';
				done <= '0';
			WHEN s3=>
				addr <= "01";
				oper <= '0';
				we <= '0';
				enable <= '0';
				done <= '0';
			WHEN s4=>
				addr <= "10";
				oper <= '0';
				we <= '0';
				enable <= '0';
				done <= '0';
			WHEN s5=>
				addr <= "11";
				oper <= '1';
				we <= '1';
				enable <= '1';
				done <= '0';
			WHEN sFim=>
				addr <= "00";
				oper <= '0';
				we <= '0';
				enable <= '0';
				done <= '1';
        END CASE;
    END PROCESS;
    
end Behavioral;
