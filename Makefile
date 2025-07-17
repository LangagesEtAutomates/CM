# -------------------------------
# Configuration
# -------------------------------

SRCDIR   := src/drivers
BUILDDIR := build
DOCSDIR  := docs

PDFLATEX := pdflatex -output-directory=$(BUILDDIR)

# Les deux drivers présents dans $(SRCDIR)
TEXS    := slides handout
PDFS    := $(addsuffix .pdf,$(TEXS))

# -------------------------------
# Cibles principales
# -------------------------------

.PHONY: all slides handout init-sty update-sty clean cleanall help

# Par défaut : tout compiler
all: slides handout

# Alias pour compiler chaque PDF
slides: $(DOCSDIR)/slides.pdf
handout: $(DOCSDIR)/handout.pdf

# Règle générique pour sortir docs/%.pdf à partir de src/drivers/%.tex
$(DOCSDIR)/%.pdf: $(SRCDIR)/%.tex | $(BUILDDIR) $(DOCSDIR)
	@echo ">>> Compiling $<"
	$(PDFLATEX) $<
	$(PDFLATEX) $<     # deux passes pour références
	mv $(BUILDDIR)/$*.pdf $@

# -------------------------------
# Submodule styles
# -------------------------------

init-sty:
	@git submodule update --init src/sty

update-sty:
	@cd src/sty && git pull origin main
	@git add src/sty
	@git commit -m "Update styles from latex-libs"

push-sty:
	@if [ -z "$(m)" ]; then \
	  echo "Error: You must provide a commit message. e.g."; \
	  echo "  make push-sty m=\"Update header style\""; \
	  exit 1; \
	fi
	@cd src/sty && git add . && git commit -m "$(m)" && git push origin main
	@git add src/sty
	@git commit -m "Update styles: $(m)"
	@git push

# -------------------------------
# Création des répertoires
# -------------------------------

$(BUILDDIR) :
	@mkdir -p $@

$(DOCSDIR) :
	@mkdir -p $@

# -------------------------------
# Nettoyage
# -------------------------------

clean:
	@rm -rf $(BUILDDIR)/*

cleanall: clean
	@rm -f $(DOCSDIR)/*.pdf

# -------------------------------
# Aide
# -------------------------------

help:
	@echo "Usage:"
	@echo "  make            – Build both slides and handout"
	@echo "  make slides     – Build docs/slides.pdf"
	@echo "  make handout    – Build docs/handout.pdf"
	@echo "  make init-sty   – Initialize LaTeX styles submodule"
	@echo "  make update-sty – Pull latest styles and commit update"
	@echo "  make clean      – Remove build artifacts"
	@echo "  make cleanall   – Also remove generated PDFs"
