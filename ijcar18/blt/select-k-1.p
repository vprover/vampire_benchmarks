% Status   : Unsatisfiable
%%-- main
thf(var_1, type, a: $array($int, $int)).
thf(var_2, type, n: $int).
thf(var_3, type, k: $int).
thf(var_5, type, t: $int).
thf(var_6, type, i: $int).
thf(var_6, type, j: $int).
thf(var_7, type, minValue: $int).
thf(var_8, type, bad: $o).
thf(require_axiom1, axiom, $greater(n, 0)).
thf(require_axiom1, axiom, ($lesseq(0, k) & $less(k, n))).
thf(require_axiom1, axiom, ($lesseq(0, i) & $lesseq(i, $sum(k, 1)))).
thf(require_axiom1, axiom, ($greater(i, 0) => ![V: $int]: (($lesseq(0, V) & $less(V, $difference(i, 1))) => $lesseq($select(a, V), $select(a, $difference(i, 1)))))).
thf(require_axiom1, axiom, ($greater(i, 0) => ![W: $int]: (($less($difference(i, 1), W) & $less(W, n)) => $lesseq($select(a, $difference(i, 1)), $select(a, W))))).
thf(require_axiom1, axiom, ($lesseq($sum(i, 1), j) & $lesseq(j, n))).
thf(require_axiom1, axiom, ($select(a, i) = minValue)).
thf(require_axiom1, axiom, ![W: $int]: (($less(i, W) & $less(W, j)) => $lesseq($select(a, i), $select(a, W)))).
thf(require_axiom1, axiom, ![V: $int, W: $int]: (((($lesseq(0, V) & $less(V, i)) & $lesseq(i, W)) & $less(W, n)) => $lesseq($select(a, V), $select(a, W)))).
thf(main, conjecture, $ite(~($less(j, n)),
                           $let(bad := $true, 
                           $ite($less($select(a, j), minValue),
                                $let(minValue := $select(a, j), 
                                $let(t := $select(a, i), 
                                $let(a := $store(a, i, $select(a, j)), 
                                $let(a := $store(a, j, t), 
                                $let(j := $sum(j, 1), 
                                ((bad | ($lesseq($sum(i, 1), j) & $lesseq(j, n))) & ((bad | ($select(a, i) = minValue)) & ((bad | ![W: $int]: (($less(i, W) & $less(W, j)) => $lesseq($select(a, i), $select(a, W)))) & (bad | ![V: $int, W: $int]: (((($lesseq(0, V) & $less(V, i)) & $lesseq(i, W)) & $less(W, n)) => $lesseq($select(a, V), $select(a, W)))))))))))),
                                $let(j := $sum(j, 1), 
                                ((bad | ($lesseq($sum(i, 1), j) & $lesseq(j, n))) & ((bad | ($select(a, i) = minValue)) & ((bad | ![W: $int]: (($less(i, W) & $less(W, j)) => $lesseq($select(a, i), $select(a, W)))) & (bad | ![V: $int, W: $int]: (((($lesseq(0, V) & $less(V, i)) & $lesseq(i, W)) & $less(W, n)) => $lesseq($select(a, V), $select(a, W)))))))))),
                           $ite($less($select(a, j), minValue),
                                $let(minValue := $select(a, j), 
                                $let(t := $select(a, i), 
                                $let(a := $store(a, i, $select(a, j)), 
                                $let(a := $store(a, j, t), 
                                $let(j := $sum(j, 1), 
                                ((bad | ($lesseq($sum(i, 1), j) & $lesseq(j, n))) & ((bad | ($select(a, i) = minValue)) & ((bad | ![W: $int]: (($less(i, W) & $less(W, j)) => $lesseq($select(a, i), $select(a, W)))) & (bad | ![V: $int, W: $int]: (((($lesseq(0, V) & $less(V, i)) & $lesseq(i, W)) & $less(W, n)) => $lesseq($select(a, V), $select(a, W)))))))))))),
                                $let(j := $sum(j, 1), 
                                ((bad | ($lesseq($sum(i, 1), j) & $lesseq(j, n))) & ((bad | ($select(a, i) = minValue)) & ((bad | ![W: $int]: (($less(i, W) & $less(W, j)) => $lesseq($select(a, i), $select(a, W)))) & (bad | ![V: $int, W: $int]: (((($lesseq(0, V) & $less(V, i)) & $lesseq(i, W)) & $less(W, n)) => $lesseq($select(a, V), $select(a, W))))))))))).
%%-- end
