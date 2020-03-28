# LiteX IP cores

This repository holds IP cores extracted from [LiteX](https://github.com/enjoy-digital/litex).
Currently there are 2 cores available:

* PWM
* UART

Pregenerated Verilog code and scripts used for generating it are provided in the core's directories.

To regenerate a PWM core follow the guide:

#. Setup LiteX environment following the [LiteX README guide](https://github.com/enjoy-digital/litex/blob/master/README.md)
#. Rebuild the core with:

   ```
   cd litex-pwm/build-litex
   ./build_litex.sh
   cp soc_litexcore___main__/gateware/litex_core.v ../LitePWM.v
   ```

Similar procedure can be applied to the UART core.
