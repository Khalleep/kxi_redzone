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
3. Add the following to your `server.cfg`: start kxi-redzone
4. Configure your red zones in the `Config.Redzones` table inside the script.

## Configuration

Edit the `Config.Redzones` table in the script to define your zones. Each zone requires:

- `coords`: vector3 coordinates for the center of the zone  
- `radius`: radius of the zone
- `name`: a descriptive name for the zone  

Example:

```lua
Config.Redzones = {
 {
     coords = vector3(-1056.22, -241.06, 44.02),
     radius = 100.0,
     name = "Office"
 },
 {
     coords = vector3(1000.0, 2000.0, 40.0),
     radius = 80.0,
     name = "Central"
 }
}

