(function(){
  var log, delay, q;
  log = function(){
    var ref$;
    return typeof console != 'undefined' && console !== null ? (ref$ = console.log) != null ? typeof ref$.apply === 'function' ? ref$.apply(console, arguments) : void 8 : void 8 : void 8;
  };
  delay = function(f, t){
    return setTimeout(t, f);
  };
  q = function(query){
    return document.querySelector(query);
  };
  window.onload = function(){
    var dowloadLink, pageLink, repoLink, hopeWords, hopeHtml, demo, ref$, body, tmp;
    dowloadLink = "https://github.com/jiyinyiyong/live-tmpl/raw/master/page/tmpl.js";
    pageLink = "http://jiyinyiyong.github.com/live-tmpl/page/";
    repoLink = "https://github.com/jiyinyiyong/live-tmpl/";
    hopeWords = 'JSON is a build-in type in JavaScript. Hope everyone enjoys it.\nMore often, we need to deal with HTML in browsers.\nFor Example, the client templating in single-page apps.\nSo, why is it ugly and awful to generate HTML with JS?\nNow I\'m writting live-tmpl, trying to make it easy in LiveScript.';
    hopeHtml = hopeWords.split("\n").map(function(it){
      return {
        p: it.trim()
      };
    });
    demo = {
      "/root.main name='top'": [
        {
          "h3": "Home page of Live-tmpl"
        }, [
          ".list", {
            ".line": [
              {
                "span.title": "Goal"
              }, {
                ".list": hopeHtml
              }
            ]
          }, {
            ".line": [
              {
                span: "by"
              }, {
                span: "Jiyin Yiyong"
              }
            ]
          }, {
            ".line": [
              {
                span: "in"
              }, {
                span: "LiveScript"
              }
            ]
          }
        ], {
          ".links": [
            {
              p: "Some links here:"
            }, {
              ".line": [(ref$ = {}, ref$["a href='" + dowloadLink + "'"] = "Download", ref$), (ref$ = {}, ref$["a href='" + pageLink + "'"] = "Demo Page", ref$), (ref$ = {}, ref$["a href='" + repoLink + "'"] = "Github Repo", ref$)]
            }
          ]
        }
      ]
    };
    body = q("body");
    tmp = tmpl(demo);
    return body.innerHTML = tmp;
  };
}).call(this);
