
show = -> console.log.apply console, arguments

window.onload = ->
  data =
    div:
      "div.head":
        "p":
          "span": "paragraph line"
          "span.2": " new content later afare the words"
          "span.3/mark": "with mark in it"
          "span.4": "w"
      "div.ok": ''
    "/block": "block"
  
  document.body.innerHTML = tmpl data