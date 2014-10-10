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

## Usage

*Basic*

~~~{.sh}
$ pandoc slides.md # outputs HTML
~~~

*Advanced*

~~~{.sh}
$ pandoc -t revealjs -c extra.css -c reveal.js/css/theme/sky.css --mathjax \
  --section-divs --bibliography=slides.bibtex --slide-level=2 \
  --csl=plos.csl -s slides.md -o slides.html
~~~

<!-- ## Markdown ## -->

<!-- Supports all your basic markdown features: -->

<!-- - *emphasis* (`*emphasis*`) -->
<!-- - `monospace` (`` `monospace` ``) -->
<!-- - ~~strikeout~~ (`~~strikeout~~`) -->
<!-- - s~ub~ and s^uper^script (`s~ub~ and s^uper^script`) -->
<!-- - lists -->

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

## Internals

Pandoc uses an internal tree structure which different readers and
writers either generate or write from

## Readers

~~~{.html}
<p><i>hello world</i></p>
~~~

or

~~~{.md}
*hello world*
~~~

or

~~~{.latex}
\emph{hello world}
~~~

or `docx`, `docbook`, … becomes:

~~~
[Para
  [Emph
    [Str "hello", Space, Str "world"]]]
~~~

## Writers

~~~
[Para
  [Emph
    [Str "hello", Space, Str "world"]]]
~~~

becomes:

~~~
.PP
\f[I]hello world\f[]
~~~

(man) or

~~~
{\pard \ql \f0 \sa180 \li0 \fi0 {\i hello world}\par}
~~~

(rtf) or

~~~
<para><emphasis>hello world</emphasis></para>
~~~

(docbook) or markdown, html, …

## JSON

pandoc has a JSON reader/writer that encodes the native format:

~~~{.json}
[
  { "unMeta": null },
  [ { "t": "Para",
      "c": [ { "t": "Emph",
               "c": [ { "t": "Str",
                        "c": "hello"
                      },
                      { "t": "Space",
                        "c": []
                      },
                      { "t": "Str",
                        "c": "world"
                        } ] } ] } ] ]
~~~

## Filters

This functionality allows you to write filters that input one JSON
tree and output another JSON tree.

Citations support is written as a filter.

## Filter example

~~~{.python include=filter.py}
~~~

## The markdown

~~~{include=eval.md}
~~~

## The output

<iframe width="600px" height="600px" src="eval.html"></iframe>

## Custom writers

You can write custom outputs writers in Lua. This is a snippet from
Martin Fenner’s test JATS writer:

~~~{.lua}
…
function Para(s)
  return "<p>" .. s .. "</p>"
end

function RawBlock(s)
  return "<preformat>" .. s .. "</preformat>"
end
…
~~~

Since Lua is an interpreted language, these can be loaded into a
running pandoc process.

## End ##

