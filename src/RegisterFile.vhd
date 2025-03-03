library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RegisterFile is
	 port (
		  Clock : in std_logic;
		  ReadReg1 : in std_logic_vector(1 downto 0); -- Register 1
		  ReadReg2 : in std_logic_vector(1 downto 0); -- Register 2
		  WriteReg : in std_logic_vector(1 downto 0); -- Register to write
		  WriteData : in std_logic_vector(7 downto 0); -- Data to be write
		  RegWrite : in std_logic; -- Write Enable
		  ReadData1 : out std_logic_vector(7 downto 0);
		  ReadData2 : out std_logic_vector(7 downto 0)
	 );
end RegisterFile;

architecture Behavioral of RegisterFile is
	 type reg_array is array (0 to 3) of std_logic_vector(7 downto 0);
	 signal registers : reg_array := ("00000000","00000000","00000000","00000000"); -- Every register will be 0 for the moment
	 
begin
	-- Read Operation (Asincrono)
		ReadData1 <= registers(to_integer(unsigned(ReadReg1)));
		ReadData2 <= registers(to_integer(unsigned(ReadReg2)));
		
		-- Write Operation (Sincrono with Clock)
		process(Clock)
		begin
			 if rising_edge(Clock) then
				  if RegWrite = '1' and WriteReg /= "00" then  -- Dont write to R0
						registers(to_integer(unsigned(WriteReg))) <= WriteData;
				  end if;
			 end if;
		end process;
end Behavioral;