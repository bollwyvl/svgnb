svg = d3.select "svg"

class Notebook extends Baobab

d3.json "index.ipynb", (nb) ->
  window.NB = new Notebook nb
