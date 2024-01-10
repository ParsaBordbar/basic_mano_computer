library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity memory is
	generic (blocksize : integer := 1024);

	port (clk, readmem, writemem : in std_logic;
		addressbus: in std_logic_vector (15 downto 0);
		databus : inout std_logic_vector (15 downto 0);
		memdataready : out std_logic);
end entity memory;

architecture behavioral of memory is
	type mem is array (0 to blocksize - 1) of std_logic_vector (15 downto 0);
	signal milad: std_logic := '0';
	signal amir: std_logic := 'Z';
begin
	process (clk)
		variable buffermem : mem := (others => (others => '0'));
		variable ad : integer;
		variable init : boolean := true;
	begin
		if init = true then
			-- cwp
			buffermem(0) := "0000000000000110";
			
			-- mil r0, 01011101
			buffermem(1) := "0010010000101100";
			
			-- mil r1, 00000101
			buffermem(2) := "0000000000000000";
			
			-- mul r1 r2, 00000001 ------ nop
			buffermem(3) := "1101011100110101";
			
			-- mih r1, 00000000
			buffermem(4) := "0010000100000001";
			
			-- add r1, r0
			buffermem(5) := "0000000000000101";

			-- some initiation
--			buffermem(0) := "0000000000000000";
			init := false;
		end if;

		databus <= (others => 'Z');

		if  clk'event and clk = '1' then
			ad := to_integer(unsigned(addressbus));
      
			if readmem = '1' then -- Readiing :)
				
				memdataready <= '0';
				if ad >= blocksize then
					databus <= (others => 'Z');
				else
				  milad <= '1';
					databus <= buffermem(ad);
				end if;
			elsif writemem = '1' then -- Writing :)
				memdataready <= '0';
				if ad < blocksize then
					buffermem(ad) := databus;
				end if;

			end if;
			memdataready <= '1';
		end if;
	end process;
end architecture behavioral;