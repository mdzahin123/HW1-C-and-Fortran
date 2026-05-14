# Perfect / Abundant / Deficient Number Tester (Fortran & C)

Two programs — one in **Fortran 90**, one in **C** — that test whether a positive integer is **perfect**, **abundant**, or **deficient** based on the sum of its proper factors.

Originally written for **CMPSC 460 — Principles of Programming Languages** (Penn State Harrisburg, Spring 2026). Both programs implement the same logic in their respective languages.

## What the program does

For a user-entered positive integer, the program:

1. Finds and prints all factors of the number.
2. Computes the sum of the proper factors.
3. Reports whether the number is:
   - **Perfect** — sum of proper factors equals the number (e.g. `28`, `496`).
   - **Abundant** — sum of proper factors is greater than the number; prints the **abundance** (sum − number).
   - **Deficient** — sum of proper factors is less than the number; prints the **deficiency** (number − sum).
4. Loops until the user declines to test another integer.

Non-positive input is rejected with an error message, and the user is re-prompted.

## Example output

```
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Please enter a positive integer to test.
28

Integer entered: 28

Factors:
  1, 2, 4, 7, 14, 28

The sum of the proper factors is 28

28 is a perfect number
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Do you want to test another integer?
Type Y or y to run again, any other character to quit.
Your choice? y
```

## Requirements

You need a compiler for whichever version you want to run:

- **Fortran:** `gfortran` (part of GCC). Developed with TDM-GCC 10.3.0.
- **C:** `gcc`. Any modern version works.

### Install on Windows

The easiest path is [MSYS2](https://www.msys2.org/) or [TDM-GCC](https://jmeubank.github.io/tdm-gcc/). After install, make sure `gfortran` and `gcc` are on your PATH:

```powershell
gfortran --version
gcc --version
```

### Install on macOS

```bash
brew install gcc
```

### Install on Linux (Debian/Ubuntu)

```bash
sudo apt install gcc gfortran
```

## How to run

### 1. Clone this repo

```bash
git clone https://github.com/<your-username>/<your-repo>.git
cd <your-repo>
```

Make sure your terminal is in the folder that contains `Assignment.f90` and `Assignment.c`. If `dir` (Windows) or `ls` (macOS/Linux) doesn't show those files, `cd` one level deeper until they appear.

> **Folder names with spaces:** wrap the name in quotes, otherwise PowerShell will treat each word as a separate argument.
>
> ```powershell
> cd "Fortran and C file"
> ```
>
> Or just type the start of the name and press **Tab** — PowerShell will auto-complete and add the quotes for you.

### 2. Fortran version

Compile, then run:

```powershell
gfortran Assignment.f90 -o number
./number.exe          # Windows
./number              # macOS / Linux
```

### 3. C version

Compile, then run:

```powershell
gcc Assignment.c -o numbers
./numbers.exe         # Windows
./numbers             # macOS / Linux
```

> The output names (`number`, `numbers`) are arbitrary — change them to whatever you like. On macOS/Linux, omit the `.exe` extension.

## How to stop the program

At the `Your choice?` prompt, type anything other than `Y` / `y` (for example `n`, `q`, or just press Enter on most input). The program will print a thank-you message and exit.

If something hangs, press **Ctrl+C** to force-quit.

## Program structure

Both programs implement the same four required routines:

| Routine            | Purpose                                                  |
| ------------------ | -------------------------------------------------------- |
| `getInteger`       | Prompts for and validates the integer (rejects ≤ 0).     |
| `computeFactors`   | Computes the factors and stores them in a size-30 array. |
| `printFactors`     | Prints the array of factors.                             |
| `sumFactors`       | Returns the sum of the proper factors.                   |

The factor array is **static** with a fixed size of 30, per the assignment spec. The Fortran version uses `IMPLICIT NONE` throughout. Neither version uses any object-oriented features.

## Files

- `Assignment.f90` — Fortran 90 source
- `Assignment.c` — C source
- `ffile.exe`, `cfile.exe` — pre-built Windows executables (optional; you can rebuild from source)
- `report.docx` — sample runs from both programs

## Author

Muhammad Danish Zahin Bin Rafizal — `mjr7066@psu.edu`

## Notes

GitHub Copilot (VS Code extension) was used during development; see the header comments in `Assignment.f90` and `Assignment.c`.
