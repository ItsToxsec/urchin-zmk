# Raytac CX-40 (nRF52840) with ZMK v0.3.0

The original archive pinned the external `perrwa` Raytac module at `v0.3` but the build showed that **it did not register `raytac_mdbt50q_cx_40`**. This package adds a local, legacy Zephyr HWMv1 CX-40 board under `boards/arm/raytac_mdbt50q_cx_40/` and removes the conflicting external module. The repository already exposes its root as a Zephyr board root in `zephyr/module.yml`, and the workflow passes that root via `ZMK_EXTRA_MODULES`.

The existing `build.yaml` keeps both nice!nano v2 Urchin halves, their reset build, and the Raytac CX-40 dongle plus reset build. ZMK is still pinned to `v0.3.0`.

## Important limitations

**Unverified**: This board definition is an independently constructed HWMv1 adaptation from the published CX-40 memory layout/pin references, **not** a copied upstream tested v0.3 release. The complete firmware could not be compiled in this environment. Check GitHub Actions logs before considering a device flash. Do not flash a generic nRF52840 `.hex` or a full-chip image; the CX-40 uses Nordic serial DFU and has a resident bootloader. Verify exact hardware revision, bootloader and application offset before packaging via `nrfutil`.

If the build fails, retain the first **actual** compiler/CMake error. Further board-specific Kconfig/DTS fixes may be necessary.

Primary references: https://github.com/rschenk/zmk-component-raytac-dongle/pull/6 and https://docs.zephyrproject.org/latest/boards/raytac/mdbt50q_cx_40_dongle/doc/index.html
