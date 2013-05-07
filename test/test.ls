
{tmpl} = require("../lib/tmpl")

demo = "demo 1"

tree =
  html:
    head:
      title: "title"
      "meta charset='utf-8'"
    body:
      * p: "nothing"
      * p: "somthing"
      * p:
          * "div.demo/demo": ""
          * "div.demo/think": ""

console.log tmpl tree