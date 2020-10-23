library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_SIGNED.all;

entity ALU is
    Port ( A : in STD_LOGIC_VECTOR (16 downto 0);
           B : in STD_LOGIC_VECTOR (16 downto 0);
           oper : in STD_LOGIC;
           result : out STD_LOGIC_VECTOR (16 downto 0));
end ALU;

architecture Behavioral of ALU is
begin
    PROCESS (A,B,oper)
        BEGIN
        IF oper = '0' then -- 0 or ADD 1 for SUBTRACTION
            result <= A+B;
        ELSE
            result <= A-B;
        END IF;
    END PROCESS;
end Behavioral;
