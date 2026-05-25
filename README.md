# Simulation harness for RTL

This repository contains an Xcelium-oriented simulation harness layout under `sim/`.

## Layout

- `sim/Makefile` - convenience targets for xrun
- `sim/filelist.f` - compile order for xrun
- `sim/tb/` - testbench sources (AHB, reg model, common runner)
- `sim/pat/` - test patterns
- `sim/sva/` - SVA checkers (placeholder)

## Quick start

```sh
make -C sim TEST=ALL
```
