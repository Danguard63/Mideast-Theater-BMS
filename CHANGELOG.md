# Changelog

## 1.0.0 – first release for Falcon BMS 4.38

The Mideast128 theater, brought from BMS 4.36/4.37 to **BMS 4.38 and the New Terrain**, with the same georeference as the original theater, so its campaigns, objectives and bases still fit the map. All the work was done with the [BMS Suite](https://github.com/Danguard63/BMS-suite).

### New Terrain (2048 × 2048 km, 128 segments)
- **Elevation:** rebuilt from the Copernicus DEM (30 m / 90 m). The old theater's georeference was kept and fitted to the real ground: a transverse Mercator projection plus a degree-5 correction, with about 150–200 m rms against the old terrain. Sea floor from GEBCO.
- **Satellite imagery:** photoreal 4K tiles over the whole theater from Sentinel-2 cloudless (EOX). Small gaps (some Gulf islands) were filled from later years.
- **Land cover, forests and snow:** land cover from ESA WorldCover 2021 (10 m); forest density from Hansen Global Forest Change; seasonal snow maps.
- **Water:**
  - coastline, sea and lakes from OpenStreetMap water polygons;
  - water depth map, wave direction map and water culling map;
  - rivers and missing water painted by hand where the data was incomplete.
- **Bridges** checked against the OpenStreetMap roads and rivers.
- **2D maps:** the campaign map and the 2D map rebuilt for the New Terrain.

### Airbases
- **Real positions:** all 141 airbases checked against OurAirports. **117 airbases moved onto their real runways** (CampObjData.XML).
- **Korean bases replaced:** 51 airbases that used Korean base layouts were replaced by complete BMS 4.38 bases, turned to the real runway heading.
- **Runway numbers:** set on the generic runways and on the Korean bases, with 172 landing directions at magnetic variation 3°E. 56 taxiway signs were updated with the new numbers.
- **Runways with no 3D pieces:** 18 runways existed only as paint on the old terrain tiles and now get a generic 4.38 runway.
- **Taxiways:** 5 backward taxiway branches removed (BMS 4.38 stops with "bad airbase branch setup").
- **Ground leveling and land cover** under 129 airbases (TerrainRelatedData).
- **Removed airbases:** 39 airbases that do not exist or did not fit were turned into road junctions, with their links kept.

### Objectives
- **Hand edits:**
  - 584 objectives checked in the objective editor; 571 positions and headings corrected;
  - 330 buildings and pieces moved or turned and 2 removed, in 17 objectives;
  - 458 vehicle positions moved, in 19 objectives.
- **Coast:**
  - 2,378 objectives checked against the new coastline;
  - 22 objectives with buildings in the sea moved to land, 18 of them onto their real place from OpenStreetMap;
  - 8 road junctions moved out of the water.
- **Bridges:**
  - 57 bridges with no water under them turned into road junctions;
  - 49 multi-piece bridges leveled, with the ground under them adapted;
  - 4 bridges moved onto the real river crossing, unblocking 5 ground links.
- **Layouts:**
  - 22 layouts replaced by hand;
  - turned objectives now carry their rotation inside their own layout, so the Recon view shows them correctly;
  - 12 feature codes remapped to the matching 4.38 objects.
- **New junction:** one road junction added (Al-Obailah Village Junction).

### Database (BMS 4.38 database, theater copy in Terrdata\ObjectsNT)
Air defences and weapons corrected to their real-world performance. Every change is documented in the theater's DbEdits notes.
- **SAM ranges and ceilings:**
  - SA-2, SA-3, SA-5 (S-200VE), SA-6, SA-10 (S-300P);
  - SA-11, SA-17, SA-20A;
  - SA-8, SA-9, SA-13, SA-14, SA-16, SA-19;
  - I-Hawk, Patriot PAC-2, Crotale NG, Skyguard Aspide, FIM-92 Stinger.
  The Sim launch tables were scaled to the real maximum ranges.
- **Seekers:** SA-9 photo-contrast seeker (less decoyed by flares); SA-16 flare logic.
- **SA-19 Tunguska:** its own radar file (no longer shared with the Gepard), with faster fire and the ability to engage incoming air-to-ground missiles.
- **SA-15 Tor:** engages precision weapons; up to 4 missiles in the air; 25 km search range.
- **Skyguard Aspide:** its own missile file with a ground-SAM range table, instead of the aircraft AIM-7.
- **Radars:** Fire Dome (SA-11) and Chair Back (SA-17) acquire and guide to their real ranges; Patriot radar guides to 166 km.
- **AAA:** Gepard with its 35 mm guns (it had the 23 mm of the ZSU-23-4); ZSU-57-2 limited to its optical-sight range.
- **Carriers:** aircraft carriers made invulnerable. This is a gameplay choice, not realism: BMS naval air defence never intercepts incoming weapons, so a carrier was lost too easily.
- **Mission planning:** the threat circles on the planning map (Ppt.ini) match the new ranges.

### Campaigns and Tactical Engagements
- Campaigns and TEs of the original theater kept as they were.
- Units checked against the 4.38 database: 393 unit types, of which 310 unchanged and the rest mapped to the closest 4.38 type.
- Objective changes (moved bases, removed bases, junctions) applied to the campaign files.
- Stations and ILS table (stations+ils.dat) updated.

### Theater art and files
- Theater UI art updated for 4.38: menus, campaign and TE screens, patches and the campaign map.
- New theater definition (`Mideast128_NT.tdf`) for the New Terrain. The theater appears as **Mideast4_38** in the theater list.
