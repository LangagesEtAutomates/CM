# Languages and Automata

This repository contains modular and reusable teaching materials used to build the slides for the Languages and Automata course at Nantes University. 
See the [main organization](https://github.com/LangagesEtAutomates/) for more information on the course and additional resources.

## Structure

```
├── LICENSE.txt           # CC BY-SA 4.0 license (full legal text)  
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
```

## Compilation

To build the course PDF:

```bash
make
```

This creates `docs/LEA.pdf` and `docs/LEA-handout.pdf`.

Build individually:

```bash
make slides     # Builds docs/LEA.pdf
make handout    # Builds docs/LEA-handout.pdf

make clean      # Remove temporary files in build/
make cleanall   # Also remove PDFs in docs/
```

---

## Customization

You can create your own course variant while reusing the provided slides.

- Create a new main file in `src/main/`, for example:
   ```bash
   cp src/main/LEA.tex src/main/mycourse.tex
   ```
- Edit `src/main/mycourse.tex` to change the course metadata and the slides you want to include.
- Then configure the Makefile to compile your own course `docs/mycourse.pdf` and `docs/mycourse-handout.pdf`
   ```bash
   make configure COURSE=mycourse
   ```

---

## Dependencies

These slides rely on styles from the [latex-libs](https://github.com/MatthieuPerrin/latex-libs) project.
- On the first build, the Makefile automatically clones the library into `./latex-libs` (internet required).
- Subsequent builds work offline.
- Update both this repo and the library with:

```bash
make update
```

---

## License

All **LaTeX sources, slides, and related teaching materials** in this repository
are distributed under the **Creative Commons Attribution–ShareAlike 4.0 International** (CC BY-SA 4.0) license.  

- The full legal text of this license is available in [`LICENSE.txt`](LICENSE.txt).  
- Detailed attributions, image credits, and cross-repository licensing notes
  are provided in the [organization-wide license file](https://github.com/LangagesEtAutomates/.github/blob/main/LICENSE.md).

This license applies only to **original educational materials** created for the course.
Code snippets and external resources may have their own specific licenses
as indicated in the global attribution file.

### Suggested attribution

> *"Slides and materials from the course **Langages Et Automates** —  
> © 2025 Matthieu Perrin, licensed under CC BY-SA 4.0."*

---

## Contributions

Contributions are welcome!

Each slide is defined in [`src/frame/`](src/frame/) as a separate `.tex` file,
making it easy to reuse or improve specific parts. You can:
- Propose new slides
- Improve existing content or visuals
- Translate to other languages

Use pull requests to suggest changes.
For major changes, please open an issue first to discuss your ideas.
