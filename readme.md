
## Cson Template: render JSON to HTML

#### State
 
Draft.

* CoffeeScript don't support string interpolation in keys.  
So it's not easy when someone wants to set different attributes.  

* CoffeeScript dont't have a concise array defination syntax.  
HTML is more like a mix of JSON not JSON without array.  

I'll wait if CoffeeScript begin to support those feature.  
Also I'm trying to use a dialect of it.  

### Usage

Read `page/handle.js` for more details.  

### Demo

```coffeescript
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
```

converts to:

```html
<h2>
    This is a Demo of Live Template
</h2>
<p>
    line one
</p>
<p>
    line two
</p>
<div class="block" id="intro">
    <p>
        the '#' sign means id
    </p>
    <p>
        the '.' sign means class
    </p>
    <p>
        the '/' has no meaning, just bypass duplicated keys
    </p>
    <p title="title">
        attributes follow after a space
    </p>
</div>
<div class="block" id="note">
    <p>
        note that this is JSON
    </p>
</div>
<div class="block" id="more">
    <p>
        <span>for details, visit</span> <a href="https://github.com/jiyinyiyong/live-tmpl">Github</a>
    </p>
</div>