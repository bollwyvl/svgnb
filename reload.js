  // Code injected by live-server
  (function() {
    function refreshCSS() {
      var sheets = document.getElementsByTagName("link");
      for (var i = 0; i < sheets.length; ++i) {
        var elem = sheets[i];
        var rel = elem.rel;
        if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
          var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
          elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
        }
      }
    }
    var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
    var address = protocol + window.location.host + window.location.pathname + '/ws';
    var socket = new WebSocket(address);
    socket.onmessage = function(msg) {
      if (msg.data == 'reload') window.location.reload()
      else if (msg.data == 'refreshcss') refreshCSS();
    };
    console.log('Live reload enabled.');
  })();
