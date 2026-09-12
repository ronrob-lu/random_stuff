# Random Stuff

**Note: This mod is just in development and nobody knows if it is needed.**

A Luanti (Minetest) mod adding interactive Chaos Chests and physically simulated falling structural blocks.

## Installation

1. Clone or place this mod's folder (`random_stuff`) into your Minetest `mods/` directory.
2. Enable `random_stuff` in your world configuration.

## Features

- **Falling Blocks**: Adds physical structural blocks (Barrels, Chairs, Tables, Wood Structures) that behave like sand and will fall if unsupported. They can be broken by hand and are colorable.
- **Chaos Chest**: An animated storage chest with a 0.05s buffered continuous timeline animation, capable of storing items including the falling blocks.

## Usage Guide

- **Chaos Chest**: Right-click the chest to open its inventory. This will trigger its open animation. When the formspec is closed, the chest will play its close animation. It functions identically to a default chest.
- **Falling Blocks**: Place the new blocks (Barrels, Chairs, Tables, Wood Structures) anywhere. If the node beneath them is removed, they will fall.

## Licensing & Attribution

This mod uses two distinct licenses for the source code and assets to ensure open-source compliance.

- **Code**: All Lua code is licensed under the **MIT License**. Copyright (c) 2026 ronrob-lu. (See `LICENSE` file for details).
- **Assets (3D Models & Textures)**: All `.obj` and `.glb` models, as well as the texture palettes, were created by and obtained from **Kenney.nl**. They are licensed under **CC0 1.0 Universal (Public Domain Dedication)**. We extend our thanks and credit to Kenney.nl for these fantastic assets!
