# Languages and Automata

This repository contains modular and reusable teaching materials for a university-level course on formal languages and automata.

## Structure

├── LICENSE.md            # License CC-BY-SA 4.0  
├── Makefile              # Automatic compilation  
├── README.md             # This file  
├── build/                # Temporary files used during compilation  
├── docs/                 # Final PDF files (i.e. compiled course)  
├── src/                  # LaTeX source files  
│   ├── drivers/          # Main document files for the course  
│   ├── sty/              # LaTeX style files and custom macros  
│   ├── frame/            # Individual slides organized by topic (one file per slide)  
│   └── img/              # (shareable) images used in the slides

> **Note:** `src/sty/` is managed via a Git subtree from the [latex-libs](https://github.com/MathieuPerrin/latex-libs) repository.  
> Update your styles with:
> ```bash
> make update-sty
> ```

## Compilation

To build the course PDF:

```bash
make
```

This creates `docs/slides.pdf` and `docs/handout.pdf`.

You can also build a single deck:

```bash
make slides     # Builds docs/slides.pdf
make handout    # Builds docs/handout.pdf

make clean      # Remove temporary files in build/
make cleanall   # Also remove PDFs in docs/
```

## Licensing

Content is available under the **Creative Commons Attribution-ShareAlike 4.0 International License** (CC BY-SA 4.0).

This means:
- You are free to reuse, modify, and redistribute the material.
- You must give appropriate credit.
- You must distribute derivatives under the same license.

See [`LICENSE.txt`](LICENSE.txt) for full terms.

## Contributions

Contributions are welcome!

Each slide is in a separate file, making it easy to reuse or improve specific parts. You can:
- Propose new slides
- Improve existing content or visuals
- Translate to other languages

Use pull requests to suggest changes.
