# KXI Redzone

## Overview

KXI Redzone is a lightweight FiveM script that allows you to create configurable red zones on the map. When players enter these zones, they get notified and a special loot interaction target becomes available for dead entities inside the zone.

Preview: https://streamable.com/czjnv7

## Features

- Configurable circular red zones with custom coordinates, radius, and names  
- Notifications on entering and leaving red zones  
- Integration with `ox_target` for global player interaction on dead entities  
- Blips displayed on the map for red zones  

## Requirements

- [ox_lib](https://github.com/overextended/ox_lib)  
- [ox_target](https://github.com/overextended/ox_target)  
- [ox_inventory](https://github.com/overextended/ox_inventory)  

Make sure these dependencies are installed and started **before** this resource.

## Installation

1. Clone or download this repository into your FiveM `resources` folder.  
2. Ensure `ox_lib`, `ox_target`, and `ox_inventory` are installed and started before this resource.  
3. Add the following to your `server.cfg`: start kxi_redzone
4. Configure your red zones in the `Config.Redzones` table inside the script.

