```
      #
# ##  ###  #   #
#   # #  #  # #
#   # ###    #
```

An implementation of the Jupyter Notebook in reactive vector
graphics. This document is [literate CofeeScript][litcoffee].

When it is compiled, it is loaded into the [nbv SVG](./index.svg).

> TODO: use in-browser Coffee for REPL
  http://coffeescript.org/extras/coffee-script.js

# The Notebook Class

    class Notebook
      constructor: (nb)->

        @initData nb
          .initSvg()
          .initCursors()
          .onCells()

        @log "Notebook initialized"


## [Inkscape][] Layers
The layer is a powerful concept provided by Inkscape.

      layer: (label) ->
        @$svg.selectAll "g"
          .filter ->
            label is (d3.select(@).attr ":inkscape:label")

## It makes [SVG][]...

      initSvg: ->
        @$svg = d3.select "svg"
        @$base = @$svg.select "#base"
        @$cells = @layer "cells"
        @$cell = @$cells.selectAll ".cell"

        @$view = @$svg.insert "g"
          .classed nbv_base: true
          .call (base) =>
            base.append "rect"
              .attr
                width: @$base.attr ":inkscape:window-width"
                height: @$base.attr ":inkscape:window-height"
              .style
                fill: @$base.attr "pagecolor"
        @

## Data
We use the [Baobab][] evented model as a data store.

      initData: (nb)->
        @data = new Baobab nb
        @

## Cursors
Cursors provide the means of reacting to data changes.

      initCursors: ->
        @cells = @data.select "cells"
        @cells.on "update", => onCells()
        @

## Cursor Events

### When Cells change

      onCells: ->
        @$cell.data @cells.get()
          .call (cell) ->
            cell.enter()
              .append "g"
                .classed nbv_cell: true
        @

      log: (args...) ->
        console.log args...


# Namespaces

Several namespaces are used at the global level, generally from
the XML world, but also relevant to [JSON-LD][].

    ns = (prefix, iri) ->

### Namespace user: [`d3`][d3]
[d3][] uses namespaces to manipulate different kinds of [DOM][].

      d3.ns[prefix] = iri

### Namespace: [`inkscape`][inkscape]
Inkscape is the spiritual predecessor of [nbv][].

    ns "inkscape", "http://www.inkscape.org/namespaces/inkscape"


# Load the Notebook

The [Jupyter Notebook][notebook] is the data model for `nbv`.

> This should likely move to the calling SVG.

    d3.json "index.ipynb", (nb) ->
      @nbv = new Notebook nb

# References
[nbv]: http://bollwyvl.github.io/nbv
[d3]: http://d3js.org
[Baobab]: http://github.com/Yomguithereal/baobab
[Inkscape]: https://inkscape.org
[litcoffee]: http://coffescript.org/#literate
[notebook]: http://github.com/jupyter/jupyter_notebook
[SVG]: https://github.com/mbostock/d3/wiki/SVG-Shapes
