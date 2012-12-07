
tmpl = (it) ->
  isArr = Array.isArray
  isObj = (it) ->
    rule1 = typeof it "object"
    rule2 = isArr it
    rule1 and (not rule2)
  isStr = (it) -> typeof it is "string"

  log = ->
    console?.log?.apply? console, arguments

  parse = (it) ->
    # log \parse, "....#it......"
    res = it.match(/(^\S+)(\s.*)?$/)[0..2]
    head = res[1]
    attr = res[2] or ''
    # log "head is ", head
    # log "attr is ", attr

    name = head.match /^\w[\w\d-_]*/
    if name? then name = name[0] else name = "div"
    # log "name is ", name

    id = head.match /#\w[\w\d-_]*/
    if id? then id = id[0][1..] else id = ''
    # log "id is ", id

    clas = head.match /\.\w[\w\d-_]*/g
    unless clas? then clas = []
    clas = clas.map((item) -> item[1..]).join " "
    # log "class is ", clas

    [name, id, clas, attr]

  wrap = (them, child) ->
    [name, id, clas, attr] = them
    # log \\nchild, typeof child, child.length
    unless isStr child then child = generate child
    clas_attr = if clas.length > 0 then "class='#{clas}'" else ''
    id_attr = if id.length > 0 then "id='#{id}'" else ''
    "<#{name} #{clas_attr} #{id_attr} #{attr}>#{child}</#{name}>"

  generate = (it) ->
    log "generate", it
    if isArr it then it.map generate
    else if typeof it is "object"
      html = ''
      for key, value of it
        # log "npair", key, value
        html += wrap (parse key), value
      # log "\nhtml", html
      html
    else if isStr it then wrap (parse it), ''

  generate it

if exports? then exports.tmpl = tmpl