
### Live Template

It's great if one can genetate HTML quickly as normal data types.  
Now with LiveScript, I find the pretty way to generate HTML.  

### Usage

Install the module from NPM by:

```
npm install -g live-templ
```

And require the module in your code with:  

```livescript
{tmpl} = require("../lib/tmpl")
```

### Demo

The online verison is placed at: http://jiyinyiyong.github.com/live-tmpl/page/  
Read my code in `src/` or `page` for details, here's also one:  

```livescript
dowload-link = "http://jiyinyiyong.github.com/live-tmpl/page/tmpl.js"
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
```

Compiles to(after beautify):

```html
<div class="main" id="root" name="top">
    <h3>
        Home page of Live-tmpl
    </h3>
    <div class="list">
    </div>
    <div class="line">
        <span class="title">
            Goal
        </span>
        <div class="list">
            <p>
                JSON is a build-in type in JavaScript. Hope everyone enjoys it.
            </p>
            <p>
                More often, we need to deal with HTML in browsers.
            </p>
            <p>
                For Example, the client templating in single-page apps.
            </p>
            <p>
                So, why is it ugly and awful to generate HTML with JS?
            </p>
            <p>
                Now I'm writting live-tmpl, trying to make it easy in LiveScript.
            </p>
        </div>
    </div>
    <div class="line">
        <span>
            by
        </span>
        <span>
            Jiyin Yiyong
        </span>
    </div>
    <div class="line">
        <span>
            in
        </span>
        <span>
            LiveScript
        </span>
    </div>
    <div class="links">
        <p>
            Some links here:
        </p>
        <div class="line">
            <a href="http://jiyinyiyong.github.com/live-tmpl/page/tmpl.js">Download</a>
            <a href="http://jiyinyiyong.github.com/live-tmpl/page/">Demo Page</a>
            <a href="https://github.com/jiyinyiyong/live-tmpl/">Github Repo</a>
        </div>
    </div>
</div>
```

I didn't beautify that in code, so the result returns in a line.

### Syntax

You may have noticed that, `.clas` means `class`, `/id` means `id`,  
In LiveScript, `#key` means interpolation in strings, just use it.  
For some reason, attributes just follows after a white space.  
If you write LiveScript, you may like it.

### Future

If there's a better way found, I'd like to change the design.  
I hate brackets, but this version indents too much...  