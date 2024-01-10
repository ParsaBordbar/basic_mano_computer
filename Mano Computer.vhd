entity mano_computer is
    end mano_computer;
    
    architecture behavior of mano_computer is
        -- Instantiate the bus
        signal bus : std_logic_vector (15 downto 0);
    
        -- Instantiate the components
        component control_unit is
            port (
                opcode : in std_logic_vector (3 downto 0);
                controls : out std_logic_vector (7 downto 0)
            );
        end component;
    
        component accumulator is
            port (
                clk : in std_logic;
                load : in std_logic;
                input : in std_logic_vector (15 downto 0);
                output : out std_logic_vector (15 downto 0)
            );
        end component;
    
        component data_register is
            port (
                clk : in std_logic;
                load : in std_logic;
                input : in std_logic_vector (15 downto 0);
                output : out std_logic_vector (15 downto 0)
            );
        end component;
    
        component temp_register is
            port (
                clk : in std_logic;
                load : in std_logic;
                input : in std_logic_vector (15 downto 0);
                output : out std_logic_vector (15 downto 0)
            );
        end component;
    
        component output_register is
            port (
                clk : in std_logic;
                load : in std_logic;
                input : in std_logic_vector (15 downto 0);
                output : out std_logic_vector (15 downto 0)
            );
        end component;
    
        component instruction_decoder is
            port (
                opcode : in std_logic_vector (3 downto 0);
                instruction : out std_logic_vector (7 downto 0)
            );
        end component;
        
        component Address_Register is
            Port (
                clk : in std_logic;
                reset : in std_logic;
                load : in std_logic;
                data_in : in std_logic_vector(15 downto 0);
                data_out : out std_logic_vector(15 downto 0)
            );
        end component Address_Register;

        component IR is port (
            data : in std_logic_vector(15 downto 0);
            clk : in std_logic;
            IRload : in std_logic;
            IRout : out std_logic_vector(15 downto 0)
        );
        end component IR;
    
        begin
            -- Connect the components to the bus and each other
            CU: control_unit port map (
                opcode => bus(15 downto 12),
                controls => open
            );
        
            AC: accumulator port map (
                clk => '1',
                load => '1',
                input => bus,
                output => bus
            );
        
            DR: data_register port map (
                clk => '1',
                load => '1',
                input => bus,
                output => bus
            );
        
            TR: temp_register port map (
                clk => '1',
                load => '1',
                input => bus,
                output => bus
            );
        
            OUTR: output_register port map (
                clk => '1',
                load => '1',
                input => bus,
                output => bus
            );
        
            ID: instruction_decoder port map (
                opcode => bus(15 downto 12),
                instruction => open
            );
        
            AR: Address_Register port map (
                clk => '1',
                reset => '0',
                load => '1',
                data_in => bus,
                data_out => bus
            );
        
            IR: IR port map (
                data => bus,
                clk => '1',
                IRload => '1',
                IRout => bus
            );
        end behavior;        