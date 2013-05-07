
require("calabash").do "watch",
  "livescript -o lib -wc src"
  "node-dev test/test.ls"