LIBRARY DISCIPLINES;
USE DISCIPLINES.ELECTROMAGNETIC_SYSTEM.ALL;
LIBRARY ieee;
USE ieee.math_real.ALL;

ENTITY testbench IS
END;

ARCHITECTURE behav of testbench IS
COMPONENT resistor
	GENERIC(resistance : real:=100.0);
	PORT(TERMINAL a,b: ELECTRICAL);
END COMPONENT;

TERMINAL a,b: ELECTRICAL;
QUANTITY V_R ACROSS I_R THROUGH a to b;

QUANTITY V_GND ACROSS I_GND THROUGH b;

BEGIN

  r1 : ENTITY work.resistor_E(simple)
    GENERIC MAP (
      resistance => 250.0)
    PORT MAP (
      a => a,
      b => b);

  V_GND == 0.0;                         --Masse

  V_R == 1.0e8*now;
END;
