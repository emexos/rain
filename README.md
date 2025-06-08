# rain

version 2:
There are many new commands, but also quite a few bugs,
i uploaded it here anywa< because the bugs aren't too big..

i will upload the source code soon for v2, but only once there are no more bugs...

## Installation

No need to compile anything, just install it with:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/emexos/rain/main/install.sh)
```

This will install `rain` on your system.

## Usage

```bash
rain
```

###   Options & Controls

  * `-C<color>`             – Set a specific color (0 to 7), example: `rain -C2`
  * `-h`, `--help`, `help`  – Show help message

  - Press `q` to quit

## Program Structure

  ### Drop

  Each drop has:

  * a position (`w`, `h`)
  * a speed (how fast it falls)
  * a color
  * a character shape like `|`, `.`, `:`

### d\_Vector

 A dynamic array that holds all the drops
 If the window is resized, the drop list resizes too

### Behavior

  * Uses `ncurses` for drawing and input
  * Listens to resize events (SIGWINCH)
  * Calculate the drop count on how big the terminal is
  * Random speed and symbols for variety

## Requirements

  * Linux terminal which supports ncurses
i don't really know if it works on other devices or os' but it works on macOS 15 with iterm2...
