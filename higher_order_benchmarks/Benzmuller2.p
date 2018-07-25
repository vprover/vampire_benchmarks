%Status: Theorem
%Taken from Benzmuller's paper on higher-order resolution
%Problem claims that there are only four functions from booleans to booleans
%Requires boolean extensionality to prove

thf(a, type, f: $o > $o).
thf(a, conjecture, (  (f = ^[X: $o]:X) | (f = ^[X: $o]:(~X)) | (f = ^[X: $o]:$false) | (f = ^[X: $o]:$true)  )).
