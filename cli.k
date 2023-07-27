\d cli
(あ):{$[1~x;`$'x_y;`$x_y]}
p1:{                    /parse 1
 ta:"-"~*t:*|x; ha:"-"~*h:*x
 d:{[x;h;t;ta]$[ta;(xあh)!1;(xあh)!`$t]}[;h;t;ta]
 :$["--"~2#h;d 2;ha;d 1;ha|ta;`!`;(`$t)!`]
}
p:{x,y}/2p1':           /parse all
a:{(^:)_(!l)[&^.l:p x]} /args
f:{(p x)_/`,a x}        /flags
\d .
