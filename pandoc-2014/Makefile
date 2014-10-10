index.html: citations.html eval.html figures.html footnotes.html highlighting.html links.html math.html table.html reveal.js index.md
	pandoc -t revealjs -c extra.css -c reveal.js/css/theme/sky.css --mathjax --section-divs --bibliography=index.bibtex --slide-level=2 --csl=plos.csl --filter ./includes.hs -s index.md -o index.html

reveal.js:
	git clone https://github.com/hakimel/reveal.js.git

%.html: %.md
	pandoc -t html5 --mathjax -s --bibliography=index.bibtex --csl=plos.csl -F ./filter.py $< -o $@

clean:
	rm -f *.html 
	rm -f *.png

push: index.html
	s3cmd put -Pf --exclude=.git --recursive reveal.js/ s3://www.e6h.org/tmp/pandoc-techtalk/reveal.js/
	s3cmd put -Pf *.html *.png *.jpeg *.css s3://www.e6h.org/tmp/pandoc-techtalk/

