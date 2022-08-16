# Odin For Beginners

A note I made for myself to learn the Odin Programming Language as well as the included `vendor` libraries. The purpose isn't to teach people, rather to teach myself. But feel free to follow along since I made this available for public.

#### Why I write this

I'm not familiar with most popular C libraries, and I want to explore it more. I couldn't specific informations regarding to the bindings available for most of the vendor libraries from Odin. Consider this as an extension from Odin documentation for absolute beginners. I chose Odin as an excuse because it comes with all those libraries I should checkout but haven't been able to do that since I hate starting project using a complex language like C and also to play around with this language that marketed themself as a better replacement for C.

#### Who's this is for

This tutorial is meant to be as self-contained as possible, but not too self-contained that I have cover every single basic things. These are things to be expected from the reader:

- Someone who experienced in Unix, meaning know how to use command line apps, understand how to use the OS specific package manager, and basic development command line apps such as `git` and `make`. I mostly wrote my tutorials for Arch Linux only, so avoid the Arch Linux specific command if you're not using Arch Linux.
- Someone who understand the shell program they use, whether it is `bash`, `zsh`, `fish` or something else. I wouldn't cover how to do basic stuff using any shell.
- Someone who have basic understanding how a programming language work, meaning you already know and using one of many programming languages available and know how to navigate a documentation site.
- A low level programming skill is not required, although I personally have some experience using Rust that could influenced my writing. So keep in mind if you find it confusing.
- Some of my personal setup:
  - Operating system: Arch Linux
  - Shell: ZSH
  - Editor: Neovim
  - Vim plugin manager: vim-plug
  - LSP Plugin: coc.nvim

#### Why Odin?

Odin is a general purpose programming language with distinct typing built for high performance, modern systems and data-oriented programming[[\*](https://odin-lang.org/)]. Odin is batteries included, it comes with officially maintained binding for popular libraries such as OpenGL, Vulkan, Direct3D, Metal, WebGL, SDL2, GLFW, raylib, and much more.

⚠ As the time of this writing, Odin is still in heavy development, anything could change anytime. This tutorial is effective to be use for the `dev-2022-08` release.

#### Further Odin support

FAQ: https://odin-lang.org/docs/faq/ \
Wiki: https://github.com/odin-lang/Odin/wiki \
Discord: https://discord.gg/sVBPHEv

## Getting Started

### Install Odin

To install the `odin` command to your PC:

1. Clone the Odin repo to your PC

```bash
git clone https://github.com/odin-lang/Odin
```

2. Build Odin, this should be quick (only took 11s on my machine)

```bash
cd Odin
./build_odin.sh
```

3. Add `odin` to your path

A good idea might to put the build artifacts on a new folder.

```bash
export PATH=$PATH:/your/directory/to/odin/executables/folder
```

4. Voila!

```bash
odin version
# this should print out something like `odin version dev-2022-08:e128ed7d`
```

### Install OLS

OLS is a language server for Odin. This enables code formatting, autocomplete, snippets, and syntax highlighting\*. Further information and setup guide: https://github.com/DanielGavin/ols.

1. Clone OLS repo to your PC

```bash
git clone https://github.com/DanielGavin/ols
```

2. Build OLS

```bash
cd ols
./build.sh
```

3. Configure OLS to your editor

```json
{
  "languageserver": {
    "odin": {
      "command": "ols",
      "filetypes": ["odin"],
      "rootPatterns": ["ols.json"]
    }
  }
  "coc.preferences.formatOnSaveFiletypes": [
    "odin"
  ]
}
```

4. In every Odin project, put these files on the root of your project:

`ols.json`

```json
{
  "collections": [
    { "name": "core", "path": "c:/path/to/Odin/core" },
    { "name": "shared", "path": "c:/path/to/MyProject/src" }
  ],
  "enable_semantic_tokens": false,
  "enable_document_symbols": true,
  "enable_hover": true,
  "enable_snippets": true
}
```

`odinfmt.json`

```json
{
  "character_width": 80,
  "tabs": false,
  "tabs_width": 2
}
```

5. Your project must look like this:

```
|- project-name
   |- odinfmt.json
   |- ols.json
   |- ... (other files)
```

### Editor setup (Neovim)

1. Install Odin Plugin

```vim
Plug  'Tetralux/odin.vim'
```

2. Configure Odin spacing

By default, tab is 8 space width which I personally like to have it more compact

```vim
autocmd Filetype odin set shiftwidth=4
```

### Starting a new project

1. Make a new folder for your project

```bash
mkdir hellope
cd hellope
```

2. Put your `odinfmt.json` and `ols.json` to the folder
3. Initialize git repo

```bash
git init
```

4. Make a `.gitignore` file

```r
# This ignore the build artifacts produced from running/building the Odin source code
*.bin
*.o
```

5. Make a `main.odin` file in `src` folder

This helps to structure your project better

```bash
mkdir src
touch src/main.odin

```

6. Edit the `main.odin` file

```odin
package main

import "core:fmt"

main :: proc() {
  fmt.println("Hellope, 世界！")
}
```

7. Run the project

```bash
odin run src/
```

### Resources to keep

[Odin Overview](https://odin-lang.org/docs/overview/): Starting place if you are not familiar with the Odin's syntax\
[Odin Package Documentation](https://pkg.odin-lang.org/): Everything else you need beside learning the syntax

## Cool project to checkout

#### [EmberGen](https://jangafx.com/software/embergen/)

A real-time volumetric fluid simulator to create a stunning fire, smoke, and explosions. Used by Bethesda, CAPCOM, Codemasters, THQNordic, Warner Bros, Weta Digital, and many others. Written _fully_ in Odin.

#### [WASM4](https://wasm4.org/)

A language-agnostic fantasy console using WASM. It has an out-of-box support for Odin.

## Odin Vendor Library Collection

These are the currently available vendor libraries from Odin: `raylib`, `glfw`, `sdl2`, `OpenEXRCore`, `OpenGL`, `ggpo`, `directx`, `miniaudio`, `wasm`, `botan`, `ENet`, `microui`, `vulkan`, `darwin`, `portmidi`, `stb`.

### Raylib

https://www.raylib.com/

TODO.

### GLFW

TODO.

### SDL2

TODO.

### OpenEXRCore

TODO.

### OpenGL

TODO.

### GGPO

TODO.

### DirectX

TODO.

### Miniaudio

TODO.

### WASM

TODO.

### Botan

C++ cryptography library released under BSD License. TODO.

### ENet

Higher level networking such as authentication, lobbying, server discovery, encryption, and other similar task.
TODO.

### MicroUI

A tiny, portable, immediate-mode UI library written in ANSI C. TODO.

### Vulkan

TODO.

### Darwin

TODO.

### PortMidi

Cross-Platform MIDI IO. TODO.

### STB

Single-file public domain libraries.

TODO.

## License

[CC-BY-SA-4.0](./LICENSE)
