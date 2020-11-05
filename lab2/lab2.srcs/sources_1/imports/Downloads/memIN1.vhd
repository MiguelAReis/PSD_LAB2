-----------------------------------------------------------------------------
-- Memory generated for 'Matrix and Determinat Computation', PSD/DSD (2020/21)
-- Copyright (C) by Paulo Flores <paulo.flores@tecnico.ulisboa.pt>
-- Version: Ver. 1.0 2020-10-21
-- Command: dat2mem.pl -f
-- Seed: -s 1603648640 ( dat2mem.pl -f -s 1603648640 )
-- Date: Sun Oct 25 17:57:20 WET 2020
-----------------------------------------------------------------------------
library ieee;
library UNISIM;
library UNIMACRO;

use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use UNISIM.Vcomponents.all;
use UNIMACRO.vcomponents.all;


entity MemIN is
  port (
    clk    : in  std_logic;
    addr   : in  std_logic_vector(9 downto 0);
    A, B, C, D, E, F : out std_logic_vector(15 downto 0)
    );
end MemIN;


architecture GEN1603648640 of MemIN is
  signal dout0,dout1,dout2: std_logic_vector(31 downto 0);
begin

  MEM_in0 : BRAM_SINGLE_MACRO
    generic map (          -- memory initialization
      BRAM_SIZE => "36Kb", -- Target BRAM, "18Kb" or "36Kb"
      DEVICE => "7SERIES", -- Target Device: "VIRTEX5", "7SERIES", "VIRTEX6, "SPARTAN6"
      WRITE_WIDTH => 32,   -- Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
      READ_WIDTH  => 32,   -- Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
      -- Initialize memory predefined data
      INIT_00 => X"FFF4FFE8FFFF000B0015FFEFFFE4FFECFFF7FFE50004FFEBFFF0FFEB000CFFE6",
      INIT_01 => X"FFEA00010001001900090005FFE7FFF9FFE3FFF6FFE30002FFE8FFE6000A0011",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
    port map (
      CLK   => clk,         -- Clock
      ADDR  => addr,        -- 9-bit Address Input, width defined by read/write port depth
      DI    => x"00000000", -- 32-bit Data Input, width defined by WRITE_WIDTH parameter
      DO    => dout0,       -- 32-bit Data Output, width defined by READ_WIDTH parameter
      EN    => '1',         -- 1-bit RAM Enable Input
      WE    => "0000",      -- Write Enable Input, width defined by write port depth
      REGCE => '0',         -- 1-bit Input, output register enable
      RST   => '0'          -- 1-bit Input reset
      );

  MEM_in1 : BRAM_SINGLE_MACRO
    generic map (          -- memory initialization
      BRAM_SIZE => "36Kb", -- Target BRAM, "18Kb" or "36Kb"
      DEVICE => "7SERIES", -- Target Device: "VIRTEX5", "7SERIES", "VIRTEX6, "SPARTAN6"
      WRITE_WIDTH => 32,   -- Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
      READ_WIDTH  => 32,   -- Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
      -- Initialize memory predefined data
      INIT_00 => X"001500150018001EFFEA0011FFF800020013001A001A000C001D000A00090000",
      INIT_01 => X"FFF00002000100000000000DFFEF001CFFEC000E00190016FFF90008FFE20011",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
    port map (
      CLK   => clk,         -- Clock
      ADDR  => addr,        -- 9-bit Address Input, width defined by read/write port depth
      DI    => x"00000000", -- 32-bit Data Input, width defined by WRITE_WIDTH parameter
      DO    => dout1,       -- 32-bit Data Output, width defined by READ_WIDTH parameter
      EN    => '1',         -- 1-bit RAM Enable Input
      WE    => "0000",      -- Write Enable Input, width defined by write port depth
      REGCE => '0',         -- 1-bit Input, output register enable
      RST   => '0'          -- 1-bit Input reset
      );

  MEM_in2 : BRAM_SINGLE_MACRO
    generic map (          -- memory initialization
      BRAM_SIZE => "36Kb", -- Target BRAM, "18Kb" or "36Kb"
      DEVICE => "7SERIES", -- Target Device: "VIRTEX5", "7SERIES", "VIRTEX6, "SPARTAN6"
      WRITE_WIDTH => 32,   -- Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
      READ_WIDTH  => 32,   -- Valid values are 1-72 (37-72 only valid when BRAM_SIZE="36Kb")
      -- Initialize memory predefined data
      INIT_00 => X"00140012FFF40019000A00020002FFF8001DFFE2FFFC0014000E00190002FFF4",
      INIT_01 => X"FFF40008001D00040019001E000CFFE70000001C0000000F00100008FFE9FFF0",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000"
    )
    port map (
      CLK   => clk,         -- Clock
      ADDR  => addr,        -- 9-bit Address Input, width defined by read/write port depth
      DI    => x"00000000", -- 32-bit Data Input, width defined by WRITE_WIDTH parameter
      DO    => dout2,       -- 32-bit Data Output, width defined by READ_WIDTH parameter
      EN    => '1',         -- 1-bit RAM Enable Input
      WE    => "0000",      -- Write Enable Input, width defined by write port depth
      REGCE => '0',         -- 1-bit Input, output register enable
      RST   => '0'          -- 1-bit Input reset
      );

  A <= dout0(15 downto 0);
  B <= dout0(31 downto 16);

  C <= dout1(15 downto 0);
  D <= dout1(31 downto 16);

  E <= dout2(15 downto 0);
  F <= dout2(31 downto 16);

end GEN1603648640;

--- Mat:  0 --------------------------------------------------------------  0
-- Inp A=   -26 (0xFFE6)  B=    12 (0x000C)  C=     0 (0x0000)
--     D=     9 (0x0009)  E=   -12 (0xFFF4)  F=     2 (0x0002)
-- Res m11=         312 (0x00000138)        m12=          -2 (0xFFFFFFFE)
--     m21=        -108 (0xFFFFFF94)        m22=          15 (0x0000000F)
--- Det   4464 (0x00001170)
--- Mat:  1 --------------------------------------------------------------  1
-- Inp A=   -21 (0xFFEB)  B=   -16 (0xFFF0)  C=    10 (0x000A)
--     D=    29 (0x001D)  E=    25 (0x0019)  F=    14 (0x000E)
-- Res m11=        -525 (0xFFFFFDF3)        m12=        -245 (0xFFFFFF0B)
--     m21=         975 (0x000003CF)        m22=         -17 (0xFFFFFFEF)
--- Det 247800 (0x0003C7F8)
--- Mat:  2 --------------------------------------------------------------  2
-- Inp A=   -21 (0xFFEB)  B=     4 (0x0004)  C=    12 (0x000C)
--     D=    26 (0x001A)  E=    20 (0x0014)  F=    -4 (0xFFFC)
-- Res m11=        -420 (0xFFFFFE5C)        m12=         -37 (0xFFFFFFDB)
--     m21=         760 (0x000002F8)        m22=          34 (0x00000022)
--- Det  13840 (0x00003610)
--- Mat:  3 --------------------------------------------------------------  3
-- Inp A=   -27 (0xFFE5)  B=    -9 (0xFFF7)  C=    26 (0x001A)
--     D=    19 (0x0013)  E=   -30 (0xFFE2)  F=    29 (0x001D)
-- Res m11=         810 (0x0000032A)        m12=        -288 (0xFFFFFEE0)
--     m21=       -1350 (0xFFFFFABA)        m22=         -21 (0xFFFFFFEB)
--- Det -405810 (0xFFF9CECE)
--- Mat:  4 --------------------------------------------------------------  4
-- Inp A=   -20 (0xFFEC)  B=   -28 (0xFFE4)  C=     2 (0x0002)
--     D=    -8 (0xFFF8)  E=    -8 (0xFFF8)  F=     2 (0x0002)
-- Res m11=         160 (0x000000A0)        m12=         -76 (0xFFFFFFB4)
--     m21=          48 (0x00000030)        m22=         -20 (0xFFFFFFEC)
--- Det    448 (0x000001C0)
--- Mat:  5 --------------------------------------------------------------  5
-- Inp A=   -17 (0xFFEF)  B=    21 (0x0015)  C=    17 (0x0011)
--     D=   -22 (0xFFEA)  E=     2 (0x0002)  F=    10 (0x000A)
-- Res m11=         -34 (0xFFFFFFDE)        m12=         193 (0x000000C1)
--     m21=         -10 (0xFFFFFFF6)        m22=          47 (0x0000002F)
--- Det    332 (0x0000014C)
--- Mat:  6 --------------------------------------------------------------  6
-- Inp A=    11 (0x000B)  B=    -1 (0xFFFF)  C=    30 (0x001E)
--     D=    24 (0x0018)  E=    25 (0x0019)  F=   -12 (0xFFF4)
-- Res m11=         275 (0x00000113)        m12=          23 (0x00000017)
--     m21=        1350 (0x00000546)        m22=          57 (0x00000039)
--- Det -15375 (0xFFFFC3F1)
--- Mat:  7 --------------------------------------------------------------  7
-- Inp A=   -24 (0xFFE8)  B=   -12 (0xFFF4)  C=    21 (0x0015)
--     D=    21 (0x0015)  E=    18 (0x0012)  F=    20 (0x0014)
-- Res m11=        -432 (0xFFFFFE50)        m12=        -264 (0xFFFFFEF8)
--     m21=         756 (0x000002F4)        m22=         -18 (0xFFFFFFEE)
--- Det 207360 (0x00032A00)
--- Mat:  8 --------------------------------------------------------------  8
-- Inp A=    17 (0x0011)  B=    10 (0x000A)  C=    17 (0x0011)
--     D=   -30 (0xFFE2)  E=   -16 (0xFFF0)  F=   -23 (0xFFE9)
-- Res m11=        -272 (0xFFFFFEF0)        m12=        -213 (0xFFFFFF2B)
--     m21=         208 (0x000000D0)        m22=         -71 (0xFFFFFFB9)
--- Det  63616 (0x0000F880)
--- Mat:  9 --------------------------------------------------------------  9
-- Inp A=   -26 (0xFFE6)  B=   -24 (0xFFE8)  C=     8 (0x0008)
--     D=    -7 (0xFFF9)  E=     8 (0x0008)  F=    16 (0x0010)
-- Res m11=        -208 (0xFFFFFF30)        m12=        -410 (0xFFFFFE66)
--     m21=           8 (0x00000008)        m22=         -95 (0xFFFFFFA1)
--- Det  23040 (0x00005A00)
--- Mat: 10 -------------------------------------------------------------- 10
-- Inp A=     2 (0x0002)  B=   -29 (0xFFE3)  C=    22 (0x0016)
--     D=    25 (0x0019)  E=    15 (0x000F)  F=     0 (0x0000)
-- Res m11=          30 (0x0000001E)        m12=           2 (0x00000002)
--     m21=         705 (0x000002C1)        m22=          47 (0x0000002F)
--- Det      0 (0x00000000)
--- Mat: 11 -------------------------------------------------------------- 11
-- Inp A=   -10 (0xFFF6)  B=   -29 (0xFFE3)  C=    14 (0x000E)
--     D=   -20 (0xFFEC)  E=    28 (0x001C)  F=     0 (0x0000)
-- Res m11=        -280 (0xFFFFFEE8)        m12=         -10 (0xFFFFFFF6)
--     m21=        -168 (0xFFFFFF58)        m22=          -6 (0xFFFFFFFA)
--- Det      0 (0x00000000)
--- Mat: 12 -------------------------------------------------------------- 12
-- Inp A=    -7 (0xFFF9)  B=   -25 (0xFFE7)  C=    28 (0x001C)
--     D=   -17 (0xFFEF)  E=   -25 (0xFFE7)  F=    12 (0x000C)
-- Res m11=         175 (0x000000AF)        m12=        -307 (0xFFFFFECD)
--     m21=        -275 (0xFFFFFEED)        m22=         -64 (0xFFFFFFC0)
--- Det -95625 (0xFFFE8A77)
--- Mat: 13 -------------------------------------------------------------- 13
-- Inp A=     5 (0x0005)  B=     9 (0x0009)  C=    13 (0x000D)
--     D=     0 (0x0000)  E=    30 (0x001E)  F=    25 (0x0019)
-- Res m11=         150 (0x00000096)        m12=         230 (0x000000E6)
--     m21=         390 (0x00000186)        m22=          69 (0x00000045)
--- Det -79350 (0xFFFECA0A)
--- Mat: 14 -------------------------------------------------------------- 14
-- Inp A=    25 (0x0019)  B=     1 (0x0001)  C=     0 (0x0000)
--     D=     1 (0x0001)  E=     4 (0x0004)  F=    29 (0x001D)
-- Res m11=         100 (0x00000064)        m12=          54 (0x00000036)
--     m21=           4 (0x00000004)        m22=           8 (0x00000008)
--- Det    584 (0x00000248)
--- Mat: 15 -------------------------------------------------------------- 15
-- Inp A=     1 (0x0001)  B=   -22 (0xFFEA)  C=     2 (0x0002)
--     D=   -16 (0xFFF0)  E=     8 (0x0008)  F=   -12 (0xFFF4)
-- Res m11=           8 (0x00000008)        m12=         265 (0x00000109)
--     m21=        -112 (0xFFFFFF90)        m22=          52 (0x00000034)
--- Det  30096 (0x00007590)

