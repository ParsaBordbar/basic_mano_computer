library IEEE;
use IEEE.std_logic_1164.all;


ENTITY PC IS 
  PORT ( 
     EnablePC : IN std_logic;
     input: IN std_logic_vector (15 DOWNTO 0);  
     clk : IN std_logic;  
     output: OUT std_logic_vector (15 DOWNTO 0) := "0000000000000000"  
  );  
END PC;


ARCHITECTURE dataflow OF PC IS BEGIN 
 PROCESS (clk) BEGIN 
  IF (clk = '1' and clk'event) THEN 
    IF (EnablePC = '1') THEN 
      output <= input; 
    END IF; 
  END IF; 
 END PROCESS; 
END dataflow;