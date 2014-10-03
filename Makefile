slides.html: citations.html figures.html footnotes.html highlighting.html math.html table.html slides.md
	pandoc -t revealjs -c extra.css -c reveal.js/css/theme/sky.css --mathjax --section-divs --bibliography=slides.bibtex --slide-level=2 --csl=plos.csl --filter ./includes.hs -s slides.md -o slides.html

%.html: %.md
	pandoc -t html5 --mathjax -s --bibliography=slides.bibtex --csl=plos.csl $< -o $@

clean:
	rm *.html 
