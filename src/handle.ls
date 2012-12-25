
log = -> console?.log?.apply? console, arguments
delay = (f, t) -> setTimeout t, f
q = (query) -> document.querySelector query

window.onload = ->
  dowload-link = "https://github.com/jiyinyiyong/live-tmpl/raw/master/page/tmpl.js"
  page-link = "http://jiyinyiyong.github.com/live-tmpl/page/"
  repo-link = "https://github.com/jiyinyiyong/live-tmpl/"

  hope-words = '''
    JSON is a build-in type in JavaScript. Hope everyone enjoys it.
    More often, we need to deal with HTML in browsers.
    For Example, the client templating in single-page apps.
    So, why is it ugly and awful to generate HTML with JS?
    Now I'm writting live-tmpl, trying to make it easy in LiveScript.
    '''

  hope-html = hope-words.split "\n" .map -> p: it.trim!

  demo =
    "/root.main name='top'":
      * "h3": "Home page of Live-tmpl"
      * ".list"
          * ".line":
              * "span.title": "Goal"
              * ".list": hope-html
          * ".line":
              * span: "by"
              * span: "Jiyin Yiyong"
          * ".line":
              * span: "in"
              * span: "LiveScript"
      * ".links":
          * p: "Some links here:"
          * ".line":
              * "a href='#dowload-link'": "Download"
              * "a href='#page-link'": "Demo Page"
              * "a href='#repo-link'": "Github Repo"

  body = q "body"
  tmp = tmpl demo
  # log body, tmp
  body.innerHTML = tmp