% Status   : Unsatisfiable
%%-- main
thf(var_1, type, a: $array($int, $int)).
thf(var_2, type, n: $int).
thf(var_3, type, occs: $array($int, $o)).
thf(var_4, type, i: $int).
thf(var_5, type, d: $int).
thf(var_6, type, bad: $o).
thf(require_axiom1, axiom, $greater(n, 0)).
thf(require_axiom1, axiom, ![I: $int]: (($lesseq(0, I) & $less(I, n)) => $greatereq($select(a, I), 0))).
thf(require_axiom1, axiom, ($lesseq(0, i) & $lesseq(i, n))).
thf(require_axiom1, axiom, ($greatereq(d, 0) => $select(occs, $select(a, i)))).
thf(require_axiom1, axiom, ![K: $int]: (($lesseq(0, K) & $less(K, i)) => $select(occs, $select(a, K)))).
thf(require_axiom1, axiom, ![J: $int, K: $int]: ((($lesseq(0, J) & $less(J, K)) & $less(K, i)) => ($select(a, J) != $select(a, K)))).
thf(main, conjecture, $ite(~(($less(i, n) & $less(d, 0))),
                           $let(bad := $true, 
                           $ite(~($select(occs, $select(a, i))),
                                $let(occs := $store(occs, $select(a, i), $true), 
                                $let(i := $sum(i, 1), 
                                ((bad | ($lesseq(0, i) & $lesseq(i, n))) & ((bad | ($greatereq(d, 0) => $select(occs, $select(a, i)))) & ((bad | ![K: $int]: (($lesseq(0, K) & $less(K, i)) => $select(occs, $select(a, K)))) & (bad | ![J: $int, K: $int]: ((($lesseq(0, J) & $less(J, K)) & $less(K, i)) => ($select(a, J) != $select(a, K))))))))),
                                $let(d := $select(a, i), 
                                ((bad | ($lesseq(0, i) & $lesseq(i, n))) & ((bad | ($greatereq(d, 0) => $select(occs, $select(a, i)))) & ((bad | ![K: $int]: (($lesseq(0, K) & $less(K, i)) => $select(occs, $select(a, K)))) & (bad | ![J: $int, K: $int]: ((($lesseq(0, J) & $less(J, K)) & $less(K, i)) => ($select(a, J) != $select(a, K)))))))))),
                           $ite(~($select(occs, $select(a, i))),
                                $let(occs := $store(occs, $select(a, i), $true), 
                                $let(i := $sum(i, 1), 
                                ((bad | ($lesseq(0, i) & $lesseq(i, n))) & ((bad | ($greatereq(d, 0) => $select(occs, $select(a, i)))) & ((bad | ![K: $int]: (($lesseq(0, K) & $less(K, i)) => $select(occs, $select(a, K)))) & (bad | ![J: $int, K: $int]: ((($lesseq(0, J) & $less(J, K)) & $less(K, i)) => ($select(a, J) != $select(a, K))))))))),
                                $let(d := $select(a, i), 
                                ((bad | ($lesseq(0, i) & $lesseq(i, n))) & ((bad | ($greatereq(d, 0) => $select(occs, $select(a, i)))) & ((bad | ![K: $int]: (($lesseq(0, K) & $less(K, i)) => $select(occs, $select(a, K)))) & (bad | ![J: $int, K: $int]: ((($lesseq(0, J) & $less(J, K)) & $less(K, i)) => ($select(a, J) != $select(a, K))))))))))).
%%-- end
