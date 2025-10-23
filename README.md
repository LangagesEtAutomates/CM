# Languages and Automata

This repository contains modular and reusable teaching materials for a university-level course on formal languages and automata.


## Latest PDFs:
- [Slides](https://LangagesEtAutomates.github.io/CM/LEA.pdf): full animated version
- [Handout](https://LangagesEtAutomates.github.io/CM/LEA-handout.pdf): printable version


## Structure

├── LICENSE.md            # License CC-BY-SA 4.0  
├── Makefile              # Automatic compilation  
├── README.md             # This file  
├── build/                # Temporary files used during compilation  
├── latex-libs/           # Dependency from [latex-libs](https://github.com/MatthieuPerrin/latex-libs)
├── docs/                 # Final PDF files (i.e. compiled course)  
├── src/                  # LaTeX source files  
│   ├── main/             # Main document files for the course  
│   ├── frame/            # Individual slides organized by topic (one file per slide)  
│   ├── img/              # (shareable) images used in the slides
│   └── sty/              # Style files


## Compilation

To build the course PDF:

```bash
make
```

This creates `docs/slides.pdf` and `docs/handout.pdf`.

Build individually:

```bash
make slides     # Builds docs/LEA.pdf
make handout    # Builds docs/LEA-handout.pdf

make clean      # Remove temporary files in build/
make cleanall   # Also remove PDFs in docs/
```


## Dependencies

These slides rely on styles from the [latex-libs](https://github.com/MatthieuPerrin/latex-libs) project.
- On the first build, the Makefile automatically clones the library into `./latex-libs` (internet required).
- Subsequent builds work offline.
- Update both this repo and the library with:

```bash
make update
```


## Licensing

Content is available under the **Creative Commons Attribution-ShareAlike 4.0 International License** (CC BY-SA 4.0).

This means:
- You are free to reuse, modify, and redistribute the material.
- You must give appropriate credit.
- You must distribute derivatives under the same license.

See [`LICENSE.md`](LICENSE.md) for full terms.
   
## Contributions

Contributions are welcome!

Each slide is defined in [`src/frame/`](src/frame/) as a separate `.tex` file,
making it easy to reuse or improve specific parts. You can:
- Propose new slides
- Improve existing content or visuals
- Translate to other languages

Use pull requests to suggest changes.
For major changes, please open an issue first to discuss your ideas.

## Related projects

You may also be interested in:
- [latex-libs](https://github.com/MatthieuPerrin/latex-libs): the graphical/style library used here
- [Main organization](https://github.com/LangagesEtAutomates/): additional resources for exercises and labs 
- [Calculabilité et Complexité](https://github.com/CalculabiliteEtComplexite): a course on Turing machines, computability, and complexity

