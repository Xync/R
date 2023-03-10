cat $1 | iconv --to-code UTF-16LE | base64 -w 0
echo ""
