/ ngn/k
\d http
s:{$[`C=@x;x;$x]}               / string
qs:{"'",(s x),"'"}              / quote string
cp:{$[1~#p:$x;"-",p;"--",p]}    / command param
c:{" "," "/(cp'!x),'" ",'qs'.x} / cp list
q:{"?","&"/($!x),'"=",'s'.x}    / dict -> qstring

gr:{."\\curl -Gs ",qs x}      / GET raw
g:{gr x,(q y)}                / GET[url;qs]
pr:{."\\curl -s -X POST ",(qs x),c y}                  / POST[url;args], e.g. pr["a.com";`user`T!("u:pass";"d.txt")]
p:{pr[x;`H`d!("Content-Type: application/json";`j@y)]} / json POST[url;data]
\d .
