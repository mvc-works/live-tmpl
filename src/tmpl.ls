
# log = -> console?.log?.apply console, arguments
log = ->

is-arr = Array.is-array
is-str = -> (typeof it) is "string"
is-obj = ->
  rule1 = (typeof it) is "object"
  rule2 = isArr it
  rule1 and (not rule2)

exports.tmpl = ->

  parse = ->
    # log "parse", "....#it......"
    res = it.match(/(^\S+)(\s.*)?$/)[0 to 2]
    head = res.1
    attr = res.2 or ''

    name = head.match /^[\w\d-]+/
    if name? then name = name.0 else name = "div"

    id = head.match /\/[\w\d-]+/
    if id? then id = id.0[1 to].join('') else id = ''

    clas = head.match /\.[\w\d-]+/g
    unless clas? then clas = []
    clas = clas.map -> it[1 to].join ''

    [name, id, clas.join(' '), attr]

  wrap = (them, child) ->
    [name, id, clas, attr] = them
    # log "\nchild", typeof child, child.length
    unless isStr child then child = generate child
    clas-attr = if clas.length > 0 then "class='#clas'" else ''
    id-attr = if id.length > 0 then "id='#id'" else ''
    attrs = "#clas-attr #id-attr #attr".trim()
    if attrs.length > 0 then attrs = " " + attrs
    "<#{name}#{attrs}>#child</#name>"

  generate = ->
    # log "generate", it
    if (is-arr it) then it.map generate .join ''
    else if (is-obj it)
      html = ''
      for key, value of it
        html += wrap (parse key), value
      html
    else if isStr it then wrap (parse it), ''

  generate it