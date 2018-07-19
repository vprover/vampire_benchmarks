% Status   : Unsatisfiable
%%-- main
thf(var_3, type, a: $array($int, $int)).
thf(var_4, type, n: $int).
thf(var_5, type, pivot: $int).
thf(var_7, type, low: $int).
thf(var_7, type, high: $int).
thf(var_8, type, i: $int).
thf(var_8, type, t: $int).
thf(var_9, type, bad: $o).
thf(require_axiom1, axiom, $greatereq(n, 0)).
thf(require_axiom1, axiom, ((($lesseq(0, low) & $lesseq(low, i)) & $lesseq(i, $sum(high, 1))) & $less(high, n))).
thf(require_axiom1, axiom, ![K: $int]: (($lesseq(0, K) & $less(K, low)) => $less($select(a, K), pivot))).
thf(require_axiom1, axiom, ![K: $int]: (($lesseq(low, K) & $less(K, i)) => ($select(a, K) = pivot))).
thf(require_axiom1, axiom, ![K: $int]: (($less(high, K) & $less(K, n)) => $greater($select(a, K), pivot))).
thf(main, conjecture, $ite(~($lesseq(i, high)),
                           $let(bad := $true, 
                           $ite($less($select(a, i), pivot),
                                $let(t := $select(a, low), 
                                $let(a := $store(a, low, $select(a, i)), 
                                $let(a := $store(a, i, t), 
                                $let(low := $sum(low, 1), 
                                $let(i := $sum(i, 1), 
                                ((bad | ((($lesseq(0, low) & $lesseq(low, i)) & $lesseq(i, $sum(high, 1))) & $less(high, n))) & ((bad | ![K: $int]: (($lesseq(0, K) & $less(K, low)) => $less($select(a, K), pivot))) & ((bad | ![K: $int]: (($lesseq(low, K) & $less(K, i)) => ($select(a, K) = pivot))) & (bad | ![K: $int]: (($less(high, K) & $less(K, n)) => $greater($select(a, K), pivot))))))))))),
                                $ite($greater($select(a, i), pivot),
                                     $let(t := $select(a, i), 
                                     $let(a := $store(a, i, $select(a, high)), 
                                     $let(a := $store(a, high, t), 
                                     $let(high := $difference(high, 1), 
                                     ((bad | ((($lesseq(0, low) & $lesseq(low, i)) & $lesseq(i, $sum(high, 1))) & $less(high, n))) & ((bad | ![K: $int]: (($lesseq(0, K) & $less(K, low)) => $less($select(a, K), pivot))) & ((bad | ![K: $int]: (($lesseq(low, K) & $less(K, i)) => ($select(a, K) = pivot))) & (bad | ![K: $int]: (($less(high, K) & $less(K, n)) => $greater($select(a, K), pivot)))))))))),
                                     $let(i := $sum(i, 1), 
                                     ((bad | ((($lesseq(0, low) & $lesseq(low, i)) & $lesseq(i, $sum(high, 1))) & $less(high, n))) & ((bad | ![K: $int]: (($lesseq(0, K) & $less(K, low)) => $less($select(a, K), pivot))) & ((bad | ![K: $int]: (($lesseq(low, K) & $less(K, i)) => ($select(a, K) = pivot))) & (bad | ![K: $int]: (($less(high, K) & $less(K, n)) => $greater($select(a, K), pivot)))))))))),
                           $ite($less($select(a, i), pivot),
                                $let(t := $select(a, low), 
                                $let(a := $store(a, low, $select(a, i)), 
                                $let(a := $store(a, i, t), 
                                $let(low := $sum(low, 1), 
                                $let(i := $sum(i, 1), 
                                ((bad | ((($lesseq(0, low) & $lesseq(low, i)) & $lesseq(i, $sum(high, 1))) & $less(high, n))) & ((bad | ![K: $int]: (($lesseq(0, K) & $less(K, low)) => $less($select(a, K), pivot))) & ((bad | ![K: $int]: (($lesseq(low, K) & $less(K, i)) => ($select(a, K) = pivot))) & (bad | ![K: $int]: (($less(high, K) & $less(K, n)) => $greater($select(a, K), pivot))))))))))),
                                $ite($greater($select(a, i), pivot),
                                     $let(t := $select(a, i), 
                                     $let(a := $store(a, i, $select(a, high)), 
                                     $let(a := $store(a, high, t), 
                                     $let(high := $difference(high, 1), 
                                     ((bad | ((($lesseq(0, low) & $lesseq(low, i)) & $lesseq(i, $sum(high, 1))) & $less(high, n))) & ((bad | ![K: $int]: (($lesseq(0, K) & $less(K, low)) => $less($select(a, K), pivot))) & ((bad | ![K: $int]: (($lesseq(low, K) & $less(K, i)) => ($select(a, K) = pivot))) & (bad | ![K: $int]: (($less(high, K) & $less(K, n)) => $greater($select(a, K), pivot)))))))))),
                                     $let(i := $sum(i, 1), 
                                     ((bad | ((($lesseq(0, low) & $lesseq(low, i)) & $lesseq(i, $sum(high, 1))) & $less(high, n))) & ((bad | ![K: $int]: (($lesseq(0, K) & $less(K, low)) => $less($select(a, K), pivot))) & ((bad | ![K: $int]: (($lesseq(low, K) & $less(K, i)) => ($select(a, K) = pivot))) & (bad | ![K: $int]: (($less(high, K) & $less(K, n)) => $greater($select(a, K), pivot))))))))))).
%%-- end
