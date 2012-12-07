
show = -> console.log.apply console, arguments

window.onload = ->

  address = ""

  data =
    "h2": "This is a Demo of Live Template"
    "p/1": "line one"
    "p/2": "line two"
    "#intro.block":
      "p/1": "the '#' sign means id"
      "p/2": "the '.' sign means class"
      "p/3": "the '/' has no meaning, just bypass duplicated keys"
      "p title='title'": "attributes follow after a space"
    "#note.block":
      "p/1": "note that this is JSON"
    "#more.block":
      "p/1":
        "span/1": "for details, visit "
        "a href='https://github.com/jiyinyiyong/live-tmpl'": "Github"

  document.body.innerHTML = tmpl data