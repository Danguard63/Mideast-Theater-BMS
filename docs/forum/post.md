# Mideast for Falcon BMS 4.38 – New Terrain

Hello everyone!

It's a real pleasure to share with the community **Mideast for BMS 4.38**: the much-loved **Mideast128** theater, brought to **Falcon BMS 4.38 and the New Terrain**. Kuwait, Iraq, Iran, the Persian Gulf, Saudi Arabia and the Gulf states, over 2048 × 2048 km, now with real elevation, photoreal satellite terrain and airbases sitting on their real runways.

## Credits first

This theater exists thanks to the work of its original authors:

**ORIGINAL_AUTHORS** – Mideast128 for BMS 4.36/4.37

Their campaigns, objectives, airbases and art are the heart of this theater. What I did was bring their work to 4.38 and the New Terrain, keeping the original georeference so that everything they built still fits the map. A huge thank you to them, and to **Benchmark Sims** for Falcon BMS 4.38 and Terrain Builder.

## Built with the BMS Suite

The whole conversion was done with the **[BMS Suite](https://github.com/Danguard63/BMS-suite)**: TerrainTool for the New Terrain, Objective Studio for objectives and airbases, the Campaign Editor for campaigns and TEs, the Art Editor for the theater art, and Database Interchange for the database. It's the best proof I can give that the tools work on a full theater, from the terrain to the campaign.

## What's new

### New Terrain (2048 × 2048 km, 128 segments)
- Elevation rebuilt from the **Copernicus DEM** (30/90 m), fitted to the original georeference; sea floor from GEBCO.
- **Photoreal Sentinel-2 imagery** over the whole theater.
- Land cover from ESA WorldCover, forest density from Hansen GFC, seasonal snow.
- Coastline, sea and lakes from OpenStreetMap; rivers and missing water painted by hand.
- Bridges checked against real roads and rivers; campaign and 2D maps rebuilt.

### Airbases
- All **141 airbases** checked against real positions: **117 moved onto their real runways**.
- **51 airbases** that used Korean layouts replaced by complete BMS 4.38 bases, turned to the real runway heading.
- Runway numbers set (172 landing directions), 56 taxiway signs updated.
- 18 runways that existed only as paint now get a generic 4.38 runway; 5 bad taxiway branches removed.
- Ground leveling and land cover under 129 airbases; 39 non-existent airbases turned into road junctions.

### Objectives
- **584 objectives** checked by hand, 571 positions and headings corrected; 330 buildings and 458 vehicle positions moved.
- **2,378 objectives** checked against the new coastline: 22 moved out of the sea, 18 of them onto their real place.
- 57 bridges with no water turned into junctions, 49 multi-piece bridges leveled, 4 bridges moved onto the real crossing.
- 22 layouts replaced; turned objectives now show correctly in Recon.

### Air defences and database
- SAM ranges and ceilings corrected to real-world values: SA-2, SA-3, SA-5, SA-6, SA-8, SA-9, SA-10, SA-11, SA-13, SA-14, SA-16, SA-17, SA-19, SA-20A, I-Hawk, Patriot, Crotale NG, Skyguard Aspide, Stinger.
- SA-15 Tor and SA-19 Tunguska engage incoming precision weapons; Skyguard Aspide gets its own missile.
- Fire Dome, Chair Back and Patriot radars to their real ranges; Gepard with its real 35 mm guns.
- Threat circles on the planning map match the new ranges.
- Aircraft carriers made invulnerable – a gameplay choice, since BMS naval air defence never intercepts incoming weapons.

### Campaigns and TEs
- The original campaigns and TEs, updated to the new map and the 4.38 database (393 unit types checked).

Full changelog: [CHANGELOG.md](https://github.com/Danguard63/Mideast-Theater-BMS/blob/main/CHANGELOG.md)

## Download and install

**[Download from GitHub Releases](https://github.com/Danguard63/Mideast-Theater-BMS/releases/latest)**

The installer comes in parts (`Mideast-4.38-Setup.exe` plus `.bin` files, about 8 GB in total):
1. Download **all the files** into the **same folder**.
2. Back up your BMS installation.
3. Run `Mideast-4.38-Setup.exe`: it finds your BMS 4.38 folder, installs the theater into `Data\Add-On Mideast128` and adds it to `theater.lst`.
4. Start BMS, choose **Mideast4_38** in the theater list and restart BMS.

You need about **20 GB** of free space during installation (about 16 GB once installed).

**Please note:** if you have an older Mideast128 (4.36/4.37) in `Data\Add-On Mideast128`, the installer will ask you and then delete it, since it doesn't work with 4.38. Copy anything you want to keep from it first.

To uninstall, use *Apps & features* in Windows: it removes the theater and its line in `theater.lst`.

## Feedback

Found a misplaced base, a wrong SAM, a bridge in the desert? Please report it on the [GitHub issues](https://github.com/Danguard63/Mideast-Theater-BMS/issues) or right here in this thread. Every report helps.

The theater is free, non-commercial community content (see the [terms](https://github.com/Danguard63/Mideast-Theater-BMS/blob/main/LICENSE.md)); map data credits are in [CREDITS.md](https://github.com/Danguard63/Mideast-Theater-BMS/blob/main/CREDITS.md).

Have fun over the Gulf, and check six! ✈️

Danguard63
