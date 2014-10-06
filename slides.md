---
title: pandoc
author: Erik Hetzner
---

## What is pandoc?

- “a universal document converter”
- at its core, a tool to turn transform documents *to* and *from*
    pandoc enhanced markdown
- so many useful features
    - math
    - complex citations
    - tables
    - templates

*Try it now!*

<http://johnmacfarlane.net/pandoc/try/>

## Input formats

- docbook
- docx
- epub
- html
- latex
- markdown
- mediawiki
- reStructuredText
- … and more

## Output formats ##

- docbook
- docx
- epub, epub3
- many html formats & templates
- latex
- man
- markdown
- mediawiki
- odt
- opendocument
- … and much more

## What can I do? ##

- turn markdown into `.docx`, HTML, $\LaTeX$, PDF, …
- turn `.docx` files into markdown
- make slides (like these)

## Markdown ##

Supports all your basic markdown features:

- *emphasis* (`*emphasis*`)
- `monospace` (`` `monospace` ``)
- ~~strikeout~~ (`~~strikeout~~`)
- s~ub~ and s^uper^script (`s~ub~ and s^uper^script`)
- lists

## Links

*Input*

~~~~ {include="links.md"}
~~~~

*Output*

<iframe width="600px" height="600px" src="links.html"></iframe>

## Figures ##

*Input*

~~~~ {include="figures.md"}
~~~~

*Output*

<iframe width="600px" height="600px" src="figures.html"></iframe>

## Footnotes ##

*Input*

~~~~ {include="footnotes.md"}
~~~~

*Output*

<iframe width="600px" src="footnotes.html"></iframe>

## Code highlighting ##

*Input*

~~~ {include=highlighting.md}
~~~

*Output*

<iframe width="600px" src="highlighting.html"></iframe>

Supports many languages, from Ada to zsh.

## $M^{a}_{(th)}$ ##

- pandoc uses $\TeX$-math as input
- outputs to:
    - MathJAX
    - MathML
    - Native formulas in `docx`

## Example ##

*Input*

~~~{include=math.md}
~~~

*Output*

<iframe width="600px" src="math.html"></iframe>

## Citations

BibTeX file:

~~~
@article{moran:2014eyeless,
  title = {Eyeless Mexican Cavefish Save Energy
    by Eliminating the Circadian Rhythm in Metabolism},
  volume = {9},
  url = {http://dx.doi.org/10.1371%2Fjournal.pone.0107877},
  …
}
~~~

*Input*

~~~{include=citations.md}
~~~

*Output*

<iframe width="600px" src="citations.html"></iframe>

## Tables ##

*Input*

~~~{include=table.md}
~~~

*Output*

<iframe width="600px" src="table.html"></iframe>

# Advanced: filter

## The filter

~~~{.python include=filter.py}
~~~

## The markdown

~~~{include=eval.md}
~~~

## The output

<iframe width="600px" height="600px" src="eval.html"></iframe>

## End ##

