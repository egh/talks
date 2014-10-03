#!/usr/bin/env python
from pandocfilters import toJSONFilter, CodeBlock, Image, Para, Str
from matplotlib.pyplot import savefig
import uuid
from pylab import rcParams
rcParams['figure.figsize'] = 2, 2

def evalR(key, value, fmt, meta):
    if key == 'CodeBlock' and value[0][1][0] == "python":
        figfile = "%s.png" % (uuid.uuid4())
        exec(value[1])
        savefig(figfile)
        return Para([Image([{"t": "Str", "c": "Output"}], [figfile, "fig:"])])

if __name__ == "__main__":
    toJSONFilter(evalR)
