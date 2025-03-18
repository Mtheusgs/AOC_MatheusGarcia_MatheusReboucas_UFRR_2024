library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RegisterFile is
	port (
		Clock : in std_logic;
		ReadReg1 : in std_logic_vector(1 downto 0); -- First Operand Register
		ReadReg2 : in std_logic_vector(1 downto 0); -- Second Operand Register
		WriteData : in std_logic_vector(7 downto 0); -- Data to be written
		RegWrite : in std_logic; -- Write Enable
		ReadData1 : out std_logic_vector(7 downto 0);
		ReadData2 : out std_logic_vector(7 downto 0)
	);
end RegisterFile;

architecture Behavioral of RegisterFile is
	type reg_array is array (0 to 3) of std_logic_vector(7 downto 0);
	signal registers : reg_array := ("00000000","00000000","00000000","00000000"); -- Initialize all registers to 0

	function slv_to_string(slv: std_logic_vector) return string is
		variable result : string(1 to slv'length);
	begin
		for i in slv'range loop
			if slv(i) = '0' then
				result(i + 1) := '0';
			else
				result(i + 1) := '1';
			end if;
		end loop;
		return result;
	end function;

begin
	-- Read Operation (Asynchronous)
	ReadData1 <= registers(to_integer(unsigned(ReadReg1)));
	ReadData2 <= registers(to_integer(unsigned(ReadReg2)));

	-- Write Operation (Synchronous with Clock)
	process(Clock)
	begin
		if rising_edge(Clock) then
			if RegWrite = '1' and ReadReg1 /= "00" then  -- Prevent writing to R0
				registers(to_integer(unsigned(ReadReg1))) <= WriteData;
			end if;
			report "Registers: " &
				"R0=" & slv_to_string(registers(0)) & " " &
				"R1=" & slv_to_string(registers(1)) & " " &
				"R2=" & slv_to_string(registers(2)) & " " &
				"R3=" & slv_to_string(registers(3))
				severity note;
		end if;
	end process;
end Behavioral;
