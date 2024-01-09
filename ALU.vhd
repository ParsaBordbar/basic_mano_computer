library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use ieee.math_real.all;

ENTITY ALU IS PORT (
   	clk : in std_logic;	
     
	A : in std_logic_vector(15 downto 0);
	B : in std_logic_vector(15 downto 0);
	output : out std_logic_vector (15 downto 0);
	
	ALU_Cin : in std_logic;
	ALU_Zin : in std_logic;
	
	ALU_Cout : out std_logic;
	ALU_Zout : out std_logic;

	B15to0 : in std_logic;
	AandB : in std_logic;
	AorB : in std_logic;
	Bshl : in std_logic;
  	Bshr : in std_logic;
	AcmpB : in std_logic;
	AaddB : in std_logic;
	AsubB : in std_logic;
	AxorB : in std_logic;
	Btws : in std_logic;
	AmulB : in std_logic;
	AdivB : in std_logic;
	Bsqr : in std_logic;
	rand : in std_logic;
	AnotB : in std_logic;
	sinB : in std_logic;
	cosB : in std_logic;
	tanB : in std_logic;
	cotB : in std_logic);  
END ALU;


ARCHITECTURE dataflow OF ALU IS 

component adder16 is 
generic (n : integer := 16);

 port(
  
  inputA , inputB : in std_logic_vector(n - 1 downto 0);
  carryin : in std_logic;
  result  : out std_logic_vector(n downto 0));
end component;

	signal sum : std_logic_vector(16 downto 0);
	signal sub : std_logic_vector(16 downto 0);
	signal Asigned : signed(15 downto 0);
	signal Asigned_save : signed (15 downto 0);
	signal Bsigned : signed(15 downto 0);
	signal output_tmp : std_logic_vector(15 downto 0);
 	signal Btws_c : std_logic_vector (15 downto 0);
	type T is array (0 to 10) of integer;
	signal triangle_pos : T := (0,1,2,3,4,5,6,7,8,9,10);
	signal triangle_neg : T := (0,-1,-2,-3,-4,-5,-6,-7,-8,-9,-10);

BEGIN
   
   alu_adder: adder16 port map(inputA => A , inputB => B , carryin => ALU_Cin , result => sum);

   output <= output_tmp;
   Bsigned <= signed(B);
   Asigned <= signed(A); 


  process (clk) 

		variable  tmp : std_logic_vector(15 downto 0) := (others => '0');
		variable  BinInt : integer;
		variable  randreg : std_logic_vector(15 downto 0) := "0010101001000010";
		variable  endloop : std_logic := '0';
		variable  counter : std_logic_vector(15 downto 0) := (others => '0');
  begin
    
	  if clk'event and clk = '1' then
		randreg(10) := randreg(0) xor randreg(11);
		randreg(12) := randreg(0) xor randreg(13);
		randreg(13) := randreg(0) xor randreg(14);

		randreg := randreg(0) & randreg(15 downto 1);
		
		-- A and B (tested)                                                            
		if (AandB = '1') then                                                          
		   output_tmp <= (A and B);                                                        
		--------------------


	   -- AdivB (tested)
	   elsif (AdivB = '1') then
		   for i in 0 to to_integer(unsigned(A))+1 loop
			   if (endloop = '0') then
				   if (Asigned - Bsigned * signed(counter) >= Bsigned) then
					   counter := std_logic_vector(unsigned(counter) + 1);
				   elsif (Asigned - Bsigned * signed(counter) <= 0) then
					   endloop := '1';
				   end if;
			   end if;
			end loop;
			output_tmp <= counter;
	   ---------------------

	   	-- sqr (tested)
	   	elsif (Bsqr = '1') then
			if (Bsigned = 0 ) then
				output_tmp <= (others => '0' );
			elsif (Bsigned < 4 ) then
				 output_tmp <= "0000000000000001";
			elsif (Bsigned < 9 ) then
				 output_tmp <= "0000000000000010";
			elsif (Bsigned < 16 ) then
				 output_tmp <= "0000000000000011";
			elsif (Bsigned < 25 ) then
				 output_tmp <= "0000000000000100";
			elsif (Bsigned < 36 ) then
				 output_tmp <= "0000000000000101";
			elsif (Bsigned < 49 ) then
				 output_tmp <= "0000000000000110";
			elsif (Bsigned < 64 ) then
				 output_tmp <= "0000000000000111";
			elsif (Bsigned < 81 ) then
				 output_tmp <= "0000000000001000";
			elsif (Bsigned < 100 ) then
				 output_tmp <= "0000000000001001";
			elsif (Bsigned < 121 ) then
				 output_tmp <= "0000000000001010";
			elsif (Bsigned < 144 ) then
				 output_tmp <= "0000000000001011";
			elsif (Bsigned < 169 ) then
				 output_tmp <= "0000000000001100";
			elsif (Bsigned < 196 ) then
				 output_tmp <= "0000000000001101";
			elsif (Bsigned < 225 ) then
				 output_tmp <= "0000000000001110";
			elsif (Bsigned < 256 ) then
				 output_tmp <= "0000000000001111";
			elsif (Bsigned < 289 ) then
				 output_tmp <= "0000000000010000";
			elsif (Bsigned < 324 ) then
				 output_tmp <= "0000000000010001";
			elsif (Bsigned < 361 ) then
				 output_tmp <= "0000000000010010";
			elsif (Bsigned < 400 ) then
				 output_tmp <= "0000000000010011";
			elsif (Bsigned < 441 ) then
				 output_tmp <= "0000000000010100";
			elsif (Bsigned < 484 ) then
				 output_tmp <= "0000000000010101";
			elsif (Bsigned < 529 ) then
				 output_tmp <= "0000000000010110";
			elsif (Bsigned < 576 ) then
				 output_tmp <= "0000000000010111";
			elsif (Bsigned < 625 ) then
				 output_tmp <= "0000000000011000";
			elsif (Bsigned < 676 ) then
				 output_tmp <= "0000000000011001";
			elsif (Bsigned < 729 ) then
				 output_tmp <= "0000000000011010";
			elsif (Bsigned < 784 ) then
				 output_tmp <= "0000000000011011";
			elsif (Bsigned < 841 ) then
				 output_tmp <= "0000000000011100";
			elsif (Bsigned < 900 ) then
				 output_tmp <= "0000000000011101";
			elsif (Bsigned < 961 ) then
				 output_tmp <= "0000000000011110";
			elsif (Bsigned < 1024 ) then
				 output_tmp <= "0000000000011111";
			elsif (Bsigned < 1089 ) then
				 output_tmp <= "0000000000100000";
			elsif (Bsigned < 1156 ) then
				 output_tmp <= "0000000000100001";
			elsif (Bsigned < 1225 ) then
				 output_tmp <= "0000000000100010";
			elsif (Bsigned < 1296 ) then
				 output_tmp <= "0000000000100011";
			elsif (Bsigned < 1369 ) then
				 output_tmp <= "0000000000100100";
			elsif (Bsigned < 1444 ) then
				 output_tmp <= "0000000000100101";
			elsif (Bsigned < 1521 ) then
				 output_tmp <= "0000000000100110";
			elsif (Bsigned < 1600 ) then
				 output_tmp <= "0000000000100111";
			elsif (Bsigned < 1681 ) then
				 output_tmp <= "0000000000101000";
			elsif (Bsigned < 1764 ) then
				 output_tmp <= "0000000000101001";
			elsif (Bsigned < 1849 ) then
				 output_tmp <= "0000000000101010";
			elsif (Bsigned < 1936 ) then
				 output_tmp <= "0000000000101011";
			elsif (Bsigned < 2025 ) then
				 output_tmp <= "0000000000101100";
			elsif (Bsigned < 2116 ) then
				 output_tmp <= "0000000000101101";
			elsif (Bsigned < 2209 ) then
				 output_tmp <= "0000000000101110";
			elsif (Bsigned < 2304 ) then
				 output_tmp <= "0000000000101111";
			elsif (Bsigned < 2401 ) then
				 output_tmp <= "0000000000110000";
			elsif (Bsigned < 2500 ) then
				 output_tmp <= "0000000000110001";
			elsif (Bsigned < 2601 ) then
				 output_tmp <= "0000000000110010";
			elsif (Bsigned < 2704 ) then
				 output_tmp <= "0000000000110011";
			elsif (Bsigned < 2809 ) then
				 output_tmp <= "0000000000110100";
			elsif (Bsigned < 2916 ) then
				 output_tmp <= "0000000000110101";
			elsif (Bsigned < 3025 ) then
				 output_tmp <= "0000000000110110";
			elsif (Bsigned < 3136 ) then
				 output_tmp <= "0000000000110111";
			elsif (Bsigned < 3249 ) then
				 output_tmp <= "0000000000111000";
			elsif (Bsigned < 3364 ) then
				 output_tmp <= "0000000000111001";
			elsif (Bsigned < 3481 ) then
				 output_tmp <= "0000000000111010";
			elsif (Bsigned < 3600 ) then
				 output_tmp <= "0000000000111011";
			elsif (Bsigned < 3721 ) then
				 output_tmp <= "0000000000111100";
			elsif (Bsigned < 3844 ) then
				 output_tmp <= "0000000000111101";
			elsif (Bsigned < 3969 ) then
				 output_tmp <= "0000000000111110";
			elsif (Bsigned < 4096 ) then
				 output_tmp <= "0000000000111111";
			elsif (Bsigned < 4225 ) then
				 output_tmp <= "0000000001000000";
			elsif (Bsigned < 4356 ) then
				 output_tmp <= "0000000001000001";
			elsif (Bsigned < 4489 ) then
				 output_tmp <= "0000000001000010";
			elsif (Bsigned < 4624 ) then
				 output_tmp <= "0000000001000011";
			elsif (Bsigned < 4761 ) then
				 output_tmp <= "0000000001000100";
			elsif (Bsigned < 4900 ) then
				 output_tmp <= "0000000001000101";
			elsif (Bsigned < 5041 ) then
				 output_tmp <= "0000000001000110";
			elsif (Bsigned < 5184 ) then
				 output_tmp <= "0000000001000111";
			elsif (Bsigned < 5329 ) then
				 output_tmp <= "0000000001001000";
			elsif (Bsigned < 5476 ) then
				 output_tmp <= "0000000001001001";
			elsif (Bsigned < 5625 ) then
				 output_tmp <= "0000000001001010";
			elsif (Bsigned < 5776 ) then
				 output_tmp <= "0000000001001011";
			elsif (Bsigned < 5929 ) then
				 output_tmp <= "0000000001001100";
			elsif (Bsigned < 6084 ) then
				 output_tmp <= "0000000001001101";
			elsif (Bsigned < 6241 ) then
				 output_tmp <= "0000000001001110";
			elsif (Bsigned < 6400 ) then
				 output_tmp <= "0000000001001111";
			elsif (Bsigned < 6561 ) then
				 output_tmp <= "0000000001010000";
			elsif (Bsigned < 6724 ) then
				 output_tmp <= "0000000001010001";
			elsif (Bsigned < 6889 ) then
				 output_tmp <= "0000000001010010";
			elsif (Bsigned < 7056 ) then
				 output_tmp <= "0000000001010011";
			elsif (Bsigned < 7225 ) then
				 output_tmp <= "0000000001010100";
			elsif (Bsigned < 7396 ) then
				 output_tmp <= "0000000001010101";
			elsif (Bsigned < 7569 ) then
				 output_tmp <= "0000000001010110";
			elsif (Bsigned < 7744 ) then
				 output_tmp <= "0000000001010111";
			elsif (Bsigned < 7921 ) then
				 output_tmp <= "0000000001011000";
			elsif (Bsigned < 8100 ) then
				 output_tmp <= "0000000001011001";
			elsif (Bsigned < 8281 ) then
				 output_tmp <= "0000000001011010";
			elsif (Bsigned < 8464 ) then
				 output_tmp <= "0000000001011011";
			elsif (Bsigned < 8649 ) then
				 output_tmp <= "0000000001011100";
			elsif (Bsigned < 8836 ) then
				 output_tmp <= "0000000001011101";
			elsif (Bsigned < 9025 ) then
				 output_tmp <= "0000000001011110";
			elsif (Bsigned < 9216 ) then
				 output_tmp <= "0000000001011111";
			elsif (Bsigned < 9409 ) then
				 output_tmp <= "0000000001100000";
			elsif (Bsigned < 9604 ) then
				 output_tmp <= "0000000001100001";
			elsif (Bsigned < 9801 ) then
				 output_tmp <= "0000000001100010";
			elsif (Bsigned < 10000 ) then
				 output_tmp <= "0000000001100011";
			elsif (Bsigned < 10201 ) then
				 output_tmp <= "0000000001100100";
			elsif (Bsigned < 10404 ) then
				 output_tmp <= "0000000001100101";
			elsif (Bsigned < 10609 ) then
				 output_tmp <= "0000000001100110";
			elsif (Bsigned < 10816 ) then
				 output_tmp <= "0000000001100111";
			elsif (Bsigned < 11025 ) then
				 output_tmp <= "0000000001101000";
			elsif (Bsigned < 11236 ) then
				 output_tmp <= "0000000001101001";
			elsif (Bsigned < 11449 ) then
				 output_tmp <= "0000000001101010";
			elsif (Bsigned < 11664 ) then
				 output_tmp <= "0000000001101011";
			elsif (Bsigned < 11881 ) then
				 output_tmp <= "0000000001101100";
			elsif (Bsigned < 12100 ) then
				 output_tmp <= "0000000001101101";
			elsif (Bsigned < 12321 ) then
				 output_tmp <= "0000000001101110";
			elsif (Bsigned < 12544 ) then
				 output_tmp <= "0000000001101111";
			elsif (Bsigned < 12769 ) then
				 output_tmp <= "0000000001110000";
			elsif (Bsigned < 12996 ) then
				 output_tmp <= "0000000001110001";
			elsif (Bsigned < 13225 ) then
				 output_tmp <= "0000000001110010";
			elsif (Bsigned < 13456 ) then
				 output_tmp <= "0000000001110011";
			elsif (Bsigned < 13689 ) then
				 output_tmp <= "0000000001110100";
			elsif (Bsigned < 13924 ) then
				 output_tmp <= "0000000001110101";
			elsif (Bsigned < 14161 ) then
				 output_tmp <= "0000000001110110";
			elsif (Bsigned < 14400 ) then
				 output_tmp <= "0000000001110111";
			elsif (Bsigned < 14641 ) then
				 output_tmp <= "0000000001111000";
			elsif (Bsigned < 14884 ) then
				 output_tmp <= "0000000001111001";
			elsif (Bsigned < 15129 ) then
				 output_tmp <= "0000000001111010";
			elsif (Bsigned < 15376 ) then
				 output_tmp <= "0000000001111011";
			elsif (Bsigned < 15625 ) then
				 output_tmp <= "0000000001111100";
			elsif (Bsigned < 15876 ) then
				 output_tmp <= "0000000001111101";
			elsif (Bsigned < 16129 ) then
				 output_tmp <= "0000000001111110";
			elsif (Bsigned < 16384 ) then
				 output_tmp <= "0000000001111111";
			elsif (Bsigned < 16641 ) then
				 output_tmp <= "0000000010000000";
			elsif (Bsigned < 16900 ) then
				 output_tmp <= "0000000010000001";
			elsif (Bsigned < 17161 ) then
				 output_tmp <= "0000000010000010";
			elsif (Bsigned < 17424 ) then
				 output_tmp <= "0000000010000011";
			elsif (Bsigned < 17689 ) then
				 output_tmp <= "0000000010000100";
			elsif (Bsigned < 17956 ) then
				 output_tmp <= "0000000010000101";
			elsif (Bsigned < 18225 ) then
				 output_tmp <= "0000000010000110";
			elsif (Bsigned < 18496 ) then
				 output_tmp <= "0000000010000111";
			elsif (Bsigned < 18769 ) then
				 output_tmp <= "0000000010001000";
			elsif (Bsigned < 19044 ) then
				 output_tmp <= "0000000010001001";
			elsif (Bsigned < 19321 ) then
				 output_tmp <= "0000000010001010";
			elsif (Bsigned < 19600 ) then
				 output_tmp <= "0000000010001011";
			elsif (Bsigned < 19881 ) then
				 output_tmp <= "0000000010001100";
			elsif (Bsigned < 20164 ) then
				 output_tmp <= "0000000010001101";
			elsif (Bsigned < 20449 ) then
				 output_tmp <= "0000000010001110";
			elsif (Bsigned < 20736 ) then
				 output_tmp <= "0000000010001111";
			elsif (Bsigned < 21025 ) then
				 output_tmp <= "0000000010010000";
			elsif (Bsigned < 21316 ) then
				 output_tmp <= "0000000010010001";
			elsif (Bsigned < 21609 ) then
				 output_tmp <= "0000000010010010";
			elsif (Bsigned < 21904 ) then
				 output_tmp <= "0000000010010011";
			elsif (Bsigned < 22201 ) then
				 output_tmp <= "0000000010010100";
			elsif (Bsigned < 22500 ) then
				 output_tmp <= "0000000010010101";
			elsif (Bsigned < 22801 ) then
				 output_tmp <= "0000000010010110";
			elsif (Bsigned < 23104 ) then
				 output_tmp <= "0000000010010111";
			elsif (Bsigned < 23409 ) then
				 output_tmp <= "0000000010011000";
			elsif (Bsigned < 23716 ) then
				 output_tmp <= "0000000010011001";
			elsif (Bsigned < 24025 ) then
				 output_tmp <= "0000000010011010";
			elsif (Bsigned < 24336 ) then
				 output_tmp <= "0000000010011011";
			elsif (Bsigned < 24649 ) then
				 output_tmp <= "0000000010011100";
			elsif (Bsigned < 24964 ) then
				 output_tmp <= "0000000010011101";
			elsif (Bsigned < 25281 ) then
				 output_tmp <= "0000000010011110";
			elsif (Bsigned < 25600 ) then
				 output_tmp <= "0000000010011111";
			elsif (Bsigned < 25921 ) then
				 output_tmp <= "0000000010100000";
			elsif (Bsigned < 26244 ) then
				 output_tmp <= "0000000010100001";
			elsif (Bsigned < 26569 ) then
				 output_tmp <= "0000000010100010";
			elsif (Bsigned < 26896 ) then
				 output_tmp <= "0000000010100011";
			elsif (Bsigned < 27225 ) then
				 output_tmp <= "0000000010100100";
			elsif (Bsigned < 27556 ) then
				 output_tmp <= "0000000010100101";
			elsif (Bsigned < 27889 ) then
				 output_tmp <= "0000000010100110";
			elsif (Bsigned < 28224 ) then
				 output_tmp <= "0000000010100111";
			elsif (Bsigned < 28561 ) then
				 output_tmp <= "0000000010101000";
			elsif (Bsigned < 28900 ) then
				 output_tmp <= "0000000010101001";
			elsif (Bsigned < 29241 ) then
				 output_tmp <= "0000000010101010";
			elsif (Bsigned < 29584 ) then
				 output_tmp <= "0000000010101011";
			elsif (Bsigned < 29929 ) then
				 output_tmp <= "0000000010101100";
			elsif (Bsigned < 30276 ) then
				 output_tmp <= "0000000010101101";
			elsif (Bsigned < 30625 ) then
				 output_tmp <= "0000000010101110";
			elsif (Bsigned < 30976 ) then
				 output_tmp <= "0000000010101111";
			elsif (Bsigned < 31329 ) then
				 output_tmp <= "0000000010110000";
			elsif (Bsigned < 31684 ) then
				 output_tmp <= "0000000010110001";
			elsif (Bsigned < 32041 ) then
				 output_tmp <= "0000000010110010";
			elsif (Bsigned < 32400 ) then
				 output_tmp <= "0000000010110011";
			elsif (Bsigned < 32761 ) then
				 output_tmp <= "0000000010110100";
			end if;
		------------------------


		-- cos
	    elsif (cosB = '1') then
			if (Bsigned = 0) then
				output_tmp <= (others => '0');
			elsif (Bsigned < 26) then
				output_tmp <= "0000000000001001";
			elsif (Bsigned < 37) then
				output_tmp <= "0000000000001000";
			elsif (Bsigned < 46) then
				output_tmp <= "0000000000000111";
			elsif (Bsigned < 54) then
				output_tmp <= "0000000000000110";
			elsif (Bsigned < 61) then
				output_tmp <= "0000000000000101";
			elsif (Bsigned < 67) then
				output_tmp <= "0000000000000100";
			elsif (Bsigned < 73) then
				output_tmp <= "0000000000000011";
			elsif (Bsigned < 79) then
				output_tmp <= "0000000000000010";
			elsif (Bsigned < 85) then
				output_tmp <= "0000000000000001";
			elsif (Bsigned < 96) then
				output_tmp <= "0000000000000000";
			elsif (Bsigned < 102) then
				output_tmp <= "1111111111111111";
--			elsif (Bsigned < 108) then 
			end if;
			----------------------
		
		-- rand (tested)
		elsif (rand = '1') then
		   output_tmp <= randreg;
	    --------------------	   
		                                                                               
	  	-- shift B to right(tested)
		elsif (Bshr = '1') then
			output_tmp <= '0' &  B(15 downto 1);
		--------------------
	
		-- A not B(tested)
		elsif (AnotB = '1') then
			output_tmp <= not B;
		--------------------

		-- B 15 to 0(tested)
		elsif (B15to0 = '1') then
			output_tmp <= B;
		--------------------

		-- B two's complement (tested)
		elsif (Btws = '1') then
			output_tmp <= std_logic_vector(unsigned(not B) + 1);
		--------------------

		-- A multiply B (tested)
		elsif (AmulB = '1') then
			BinInt := to_integer(unsigned(B));
			for i in 1 to BinInt loop
				tmp := std_logic_vector(unsigned(tmp) + unsigned(A));
			end loop;
			output_tmp <= tmp;
		--------------------

		-- A or B (tested)                                                             
		elsif (AorB = '1') then
		  output_tmp <= A or B;
		--------------------
		
		-- shift B to left (tested)
		elsif (Bshl = '1') then 
		  output_tmp <= B(14 downto 0) & '0';
		--------------------
		
		-- compare B and A (tested)
		elsif (AcmpB = '1') then
		  if (A = B) then
		    ALU_Zout <= '1';
		  elsif (Asigned < Bsigned) then
		    ALU_Cout <= '1';
		  end if; 
		---------------------
		
		-- A + B + ALU_Cin with carry out (tested)
		elsif (AaddB = '1') then
		  output_tmp <= sum(15 downto 0);
		  ALU_Cout <= sum(16);
		 
		---------------------
		
		-- subtract (Tested) 
	  	elsif (AsubB = '1') then
			if (ALU_Cin = '1') then
				output_tmp <= std_logic_vector(Asigned - Bsigned - 1);
				if (Asigned < (Bsigned + 1)) then
					ALU_Cout <= '1';
				else
					ALU_Cout <= '0';
				end if;
			else
				output_tmp <= std_logic_vector(Asigned - Bsigned);
				if (Asigned < Bsigned) then
					ALU_Cout <= '1';
				else
					ALU_Cout <= '0';
				end if;
			end if;
		---------------------
		
		-- A xor B (tested)
		elsif (AxorB = '1') then 
		  for i in 0 to 15 loop
		    output_tmp(i) <= A(i) xor B(i);
		  end loop;
		---------------------
		end if;

		if (AcmpB = '0') then
		   ALU_Zout <= not(output_tmp(0) or output_tmp(1) or output_tmp(2) or output_tmp(3) 
				  or output_tmp(7) or output_tmp(6) or output_tmp(5) or output_tmp(4) or 
				  output_tmp(8) or output_tmp(9) or output_tmp(10) or output_tmp(11) or 
				  output_tmp(15) or output_tmp(14) or output_tmp(13) or output_tmp(12));
   		end if;
   		
 		elsif (clk'event and clk = '0') then
 		  tmp := (others => '0');
	end if;

    
  end process;

		  

END dataflow;