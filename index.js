// Generated by CoffeeScript 1.8.0
(function() {
  var Notebook, svg,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  svg = d3.select("svg");

  Notebook = (function(_super) {
    __extends(Notebook, _super);

    function Notebook() {
      return Notebook.__super__.constructor.apply(this, arguments);
    }

    return Notebook;

  })(Baobab);

  d3.json("index.ipynb", function(nb) {
    return window.NB = new Notebook(nb);
  });

}).call(this);

//# sourceMappingURL=index.js.map
