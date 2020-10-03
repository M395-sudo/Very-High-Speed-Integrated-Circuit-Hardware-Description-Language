LIBRARY ieee;
USE ieee.math_real.ALL;
LIBRARY ieee_proposed;
USE ieee_proposed.mechanical_systems.ALL;

ENTITY bouncing_ball IS
END;

ARCHITECTURE dae of bouncing_ball IS
QUANTITY height : displacement := 10.0;
QUANTITY speed : velocity := 0.0;
CONSTANT gravitation : real := 9.81;
CONSTANT air_resistance : real;         -- to be calculated
SIGNAL speedsave : real := 0.0;

BEGIN

  speed == height'dot;
  
  if now <= 0.0 use                     -- initial condition
    height == 10.0;
  elsif NOT height'above(0.0) use
    speed == -speed save;
  elsif speed'above(0.0) use
    NULL;                               -- add behavior here
  ELSE
    null;                               -- add behavior here
  END use;

  break WHEN NOT height'above(0.0);
  -- save velocity as break initial is not supported by simulator
  process(height'above(0.0))
  begin
    if NOT height'above(0.0) then
      speedsave<=speed;
    end if;
  end process;

END;
