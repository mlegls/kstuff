#!/usr/bin/env k

\l /Users/mlegls/deps/k/l/csv.k
csv.ROW:"\r"

bare: {|/(`$x)=`event`"dress_state"}
num: {|/(`$x)=`people`horniness`"cum_level"`"sweat_level"}
conv: {$[bare x;y; num x;`F$y; ", "\y]} / default is ", " seperated list

ctj: {:`j@({x@"file"}'x) !{(1_!x)! conv'[1_!x;1_.x]}'x}

`1:$[0=#x;"usage: csv_to_json <input.csv> [output.json]";ctj@csv.dict@""/0:*x]