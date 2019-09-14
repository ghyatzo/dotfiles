
#!/bin/bash

file="$1"
line="$2"

"${file:0:1}" == "/" ] || file="${PWD}/$file"

nvr --servername vim.sock --remote-silent +${line} ${file}
