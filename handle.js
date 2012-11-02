var isArr, isObj, isStr, show, demo, parse, wrap, generate, str, fs, slice$ = [].slice;
isArr = Array.isArray;
isObj = function(it){
  var rule1, rule2;
  rule1 = typeof it('object');
  rule2 = isArr(it);
  return rule1 && !rul22;
};
isStr = function(it){
  return typeof it === 'string';
};
show = console.log;
show('\n\n\n\n\n');
demo = [
  "span.class-demo/id-demo", {
    ".class-demo": {
      "/id-qq": [
        {
          "div.1": 'sdfdf',
          "div.2": 'sdfdf',
          "div.3": 'sdfdf',
          "div": 'sdfdf'
        }, "string"
      ]
    },
    "span": 'demo'
  }
];
parse = function(it){
  var res, ref$, head, attr, name, id, clas;
  res = [(ref$ = it.match(/(^\S+)(\s.*)?$/))[0], ref$[1], ref$[2]];
  head = res[1];
  attr = res[2] || '';
  name = head.match(/^[\w\d-]+/);
  if (name != null) {
    name = name[0];
  } else {
    name = 'div';
  }
  id = head.match(/\/[\w\d-]+/);
  if (id != null) {
    id = slice$.call(id[0], 1).join('');
  } else {
    id = '';
  }
  clas = head.match(/\.[\w\d-]+/g);
  if (clas == null) {
    clas = [];
  }
  clas = clas.map(function(it){
    return slice$.call(it, 1).join('');
  });
  return [name, id, clas.join(' ')];
};
wrap = function(them, child){
  var name, id, clas, clasAttr, idAttr;
  name = them[0], id = them[1], clas = them[2];
  show('\nchild', typeof child, child.length);
  if (!isStr(child)) {
    child = generate(child);
  }
  clasAttr = clas.length > 0 ? "class='" + clas + "'" : '';
  idAttr = id.length > 0 ? "id='" + id + "'" : '';
  return "<" + name + " " + clasAttr + " " + idAttr + ">" + child + "</" + name + ">";
};
generate = function(it){
  var html, key, value;
  show('generate', it);
  if (isArr(it)) {
    return it.map(generate).join('');
  } else if (typeof it === 'object') {
    html = '';
    for (key in it) {
      value = it[key];
      show('\npair', key, value);
      html += wrap(parse(key), value);
    }
    show('\nhtml', html);
    return html;
  } else if (isStr(it)) {
    return wrap(parse(it), '');
  }
};
str = generate(demo);
fs = require('fs');
fs.writeFile('tp.html', str);