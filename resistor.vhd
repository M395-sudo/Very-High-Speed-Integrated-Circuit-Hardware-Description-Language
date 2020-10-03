LIBRARY DISCIPLINES;
USE DISCIPLINES.ELECTROMAGNETIC_SYSTEM.ALL;

ENTITY resistor_E IS
  
  GENERIC (
    resistance : real := 100.0);        -- Widerstand

  PORT (
    TERMINAL a,b : ELECTRICAL);

END resistor_E;

ARCHITECTURE simple OF resistor_E IS
  QUANTITY u_r ACROSS i_r THROUGH a TO b;
BEGIN  -- simple

  i_r == u_r/resistance;

END simple;
