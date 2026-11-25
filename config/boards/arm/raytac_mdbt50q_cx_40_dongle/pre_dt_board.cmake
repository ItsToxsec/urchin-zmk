# SPDX-License-Identifier: MIT

# Suppresses duplicate unit-address warnings for power, clock, acl and
# flash-controller in the nRF52840 devicetree.
list(APPEND EXTRA_DTC_FLAGS "-Wno-unique_unit_address_if_enabled")
