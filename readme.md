
### Live Template

It's great to be able to genetate HTML quickly.
Now with LiveScript, things look better

Look at my code in `tmpl.ls` and there's a piece of JSON:

```livescript
demo =
  "span.class-demo/id-demo"
  ".class-demo":
    "/id-qq":
      * "div": 'sdfdf'
      "div": 'sdfdf'
      "span": 'text'
      "p":
        "p.#value":
          ".cls.class.classs attr='qq.com'":
            "p":
              "q":
                "/id.class": value
  "span": 'demo'
```

The compiled result of that JSON it this:

```html
<span class='class-demo' id='id-demo'>
</span>
<div class='class-demo'>
    <div id='id-qq'>
        <div>
            sdfdf
        </div>
        <div>
            sdfdf
        </div>
        <span>
            text
        </span>
        <p>
            <p class='demo-value'>
                <div class='cls class classs' attr='qq.com'>
                    <p>
                        <q>
                            <div class='class' id='id'>
                                demo-value
                            </div>
                        </q>
                    </p>
                </div>
            </p>
        </p>
    </div>
</div>
<span>
    demo
</span>
```

You may have noticed that, `.clas` means `class`, `/id` means `id`,
for some reason, attributes just follows after a white space.
If you write LiveScript, you may like it.

### Notice

Need some tricks since dulicated keys are not allowed in JSON,
so, add `*` at head to make it convert to a list.

Strings like `span` can not be recognized to be string or tag,
so, make sure you write contents in the value of JSON.