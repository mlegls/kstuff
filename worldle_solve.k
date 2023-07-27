vs:0:"valid_solutions.txt"
vg:0:"valid_guesses.txt"

ch:{e-^(,/(=x@>e)@'<'=y)?<>e:x=y} /check::guess->solution->list (-1 b, 0 y, 1 g)
en:{-+/`ln[d]*'d:f%+/f:#'=x} /entropy::list->number
bg:{x@*>en'x ch/:\:y} /best_guess::guesses->solutions->string
ma:{[g;s;r]s@&r~/:g ch/:s} /matches::guess->solutions->response->string list

pl0:{ /solver that always guesses valid solutions
 s:"raise"
 l:{r:y@1;g:bg[r;r];(rp;ma[g;r;rp:ch[g;x]];(y@2),,g)}
 :*|{~(5#1)~*x} l[x;]/(0;ma[s;vs;ch[s;x]];,s)
}

l1:{
 r:y@1 /remaining possibilities
 gs:(r;vg) bg\:r /(try-solve guess; reduce-options guess)
 rps:gs {x ch/:y}\:r /response per actual solution per guess
 g:$[0.2<(en@*|rps)-en@*rps;*|gs;*gs] /choose try-solve when entropy delta<0.2 (diff of 2 vs. 3 opts)
 :(rp;ma[g;r;rp:ch[g;x]];(y@2),,g) /acc is (color response; remaining possibilities; guess sequence)
}
pl1:{ /optimal solver
 s:"soare"
 :*|{~(5#1)~*x} l1[x;]/(0;ma[s;vs;ch[s;x]];,s)
}

