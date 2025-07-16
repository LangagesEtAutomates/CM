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

# par défaut, tout compiler
all: $(addprefix $(DOCSDIR)/,$(PDFS))

# cible pour chaque PDF
$(DOCSDIR)/%.pdf: $(SRCDIR)/%.tex | $(BUILDDIR) $(DOCSDIR)
	@echo ">>> Compilation de $<"
	$(PDFLATEX) $<
	$(PDFLATEX) $<     # on lance deux fois pour résoudre les références
	mv $(BUILDDIR)/$*.pdf $@

# alias pour un seul PDF
slides:   $(DOCSDIR)/slides.pdf
handout:  $(DOCSDIR)/handout.pdf

# -------------------------------
# Création des répertoires
# -------------------------------

$(BUILDDIR) :
	mkdir -p $@

$(DOCSDIR)  :
	mkdir -p $@

# -------------------------------
# Nettoyage
# -------------------------------

clean:
	rm -rf $(BUILDDIR)/*

cleanall: clean
	rm -f $(DOCSDIR)/*.pdf

# -------------------------------
# Aide
# -------------------------------

help:
	@echo "Commandes disponibles :"
	@echo "  make           – Compile slides et handout vers $(DOCSDIR)/"
	@echo "  make slides    – Compile uniquement slides.pdf"
	@echo "  make handout   – Compile uniquement handout.pdf"
	@echo "  make clean     – Supprime les fichiers temporaires ($(BUILDDIR)/)"
	@echo "  make cleanall  – Supprime aussi les PDF finaux ($(DOCSDIR)/)"
