slides.html: citations.html eval.html figures.html footnotes.html highlighting.html math.html table.html reveal.js slides.md
	pandoc -t revealjs -c extra.css -c reveal.js/css/theme/sky.css --mathjax --section-divs --bibliography=slides.bibtex --slide-level=2 --csl=plos.csl --filter ./includes.hs -s slides.md -o slides.html

reveal.js:
	git clone https://github.com/hakimel/reveal.js.git

%.html: %.md
	pandoc -t html5 --mathjax -s --bibliography=slides.bibtex --csl=plos.csl -F ./filter.py $< -o $@

clean:
	rm -f *.html 
	rm -f *.png
