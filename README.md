# Mideast for Falcon BMS 4.38

The **Mideast128** theater, brought to **Falcon BMS 4.38** and the **New Terrain**: a 2048 × 2048 km theater over Kuwait, Iraq, Iran, the Persian Gulf, Saudi Arabia and the Gulf states, with photoreal satellite terrain, airbases on their real runways and corrected air defences.

Converted and built with the **[BMS Suite](https://github.com/Danguard63/BMS-suite)**, starting from the work of the original Mideast128 author, SpbGoro (see [CREDITS.md](CREDITS.md)).

## Highlights
- **New Terrain:** real elevation (Copernicus DEM) and Sentinel-2 photoreal imagery over the whole theater, with real land cover, forests and coastline.
- **Airbases:** 141 airbases checked, 117 moved onto their real runways, 51 rebuilt as complete BMS 4.38 bases, with correct runway numbers.
- **Objectives:** hundreds of objectives, bridges and coastal sites fixed by hand to fit the new terrain.
- **Air defences:** SAMs, AAA and radars corrected to their real-world ranges and behaviour.
- **Campaigns and TEs** of the original theater, updated to the new map.

Full list: [CHANGELOG.md](CHANGELOG.md)

## Download
Get the latest version from **[Releases](https://github.com/Danguard63/Mideast-Theater-BMS/releases/latest)**.

The installer comes in several parts (`Mideast-4.38-Setup.exe` plus `.bin` files), because GitHub accepts files up to 2 GB:
1. download **all the files** of the release into the **same folder**;
2. run `Mideast-4.38-Setup.exe`.

## Requirements
- **Falcon BMS 4.38**, with the latest update.
- About **20 GB** of free disk space during installation (about 16 GB once installed).

## Install
1. **Back up** your Falcon BMS installation, or at least the `Data\Add-On Mideast128` folder if you already have an older Mideast128.
2. Run `Mideast-4.38-Setup.exe` and choose your Falcon BMS 4.38 folder (normally found automatically).
3. The installer copies the theater into `Data\Add-On Mideast128` and adds it to `Data\TerrData\TheaterDefinition\theater.lst`. If an older Mideast128 (4.36/4.37) is in that folder, the installer asks and then deletes it, since it does not work with 4.38: copy elsewhere anything you want to keep from it first.
4. Start BMS, choose **Mideast4_38** in the theater list and **restart BMS**, as for any theater change.

To uninstall, use *Apps & features* in Windows (or the uninstaller in the theater folder): it removes the theater files and its line in `theater.lst`.

## Terms
Free, non-commercial community content: see [LICENSE.md](LICENSE.md). Not affiliated with Benchmark Sims.
