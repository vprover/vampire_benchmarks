% Status   : Unsatisfiable
%%-- main
thf(var_1, type, a: $array($int, $int)).
thf(var_2, type, n: $int).
thf(var_3, type, sortedUntil: $int).
thf(var_3, type, i: $int).
thf(var_3, type, t: $int).
thf(var_4, type, bad: $o).
thf(require_axiom1, axiom, $greatereq(n, 0)).
thf(require_axiom1, axiom, ($lesseq(0, sortedUntil) & $lesseq(sortedUntil, n))).
thf(require_axiom1, axiom, ![J: $int, K: $int]: (((($lesseq(0, J) & $less(J, sortedUntil)) & $lesseq(sortedUntil, K)) & $less(K, n)) => $lesseq($select(a, J), $select(a, K)))).
thf(require_axiom1, axiom, ![J: $int, K: $int]: ((($lesseq(0, J) & $less(J, K)) & $less(K, sortedUntil)) => $lesseq($select(a, J), $select(a, K)))).
thf(require_axiom1, axiom, ($lesseq(sortedUntil, i) & $less(i, n))).
thf(require_axiom1, axiom, ![J: $int, K: $int]: (((($lesseq(0, J) & $less(J, sortedUntil)) & $lesseq(sortedUntil, K)) & $less(K, n)) => $lesseq($select(a, J), $select(a, K)))).
thf(require_axiom1, axiom, ![J: $int]: (($lesseq(i, J) & $less(J, n)) => $lesseq($select(a, i), $select(a, J)))).
thf(require_axiom1, axiom, ![J: $int, K: $int]: ((($lesseq(0, J) & $less(J, K)) & $less(K, sortedUntil)) => $lesseq($select(a, J), $select(a, K)))).
thf(main, conjecture, $ite(~($greater(i, sortedUntil)),
                           $let(bad := $true, 
                           $ite($lesseq($select(a, i), $select(a, $difference(i, 1))),
                                $let(t := $select(a, i), 
                                $let(a := $store(a, i, $select(a, $difference(i, 1))), 
                                $let(a := $store(a, $difference(i, 1), t), 
                                $let(i := $difference(i, 1), 
                                ((bad | ($lesseq(sortedUntil, i) & $less(i, n))) & ((bad | ![J: $int, K: $int]: (((($lesseq(0, J) & $less(J, sortedUntil)) & $lesseq(sortedUntil, K)) & $less(K, n)) => $lesseq($select(a, J), $select(a, K)))) & ((bad | ![J: $int]: (($lesseq(i, J) & $less(J, n)) => $lesseq($select(a, i), $select(a, J)))) & (bad | ![J: $int, K: $int]: ((($lesseq(0, J) & $less(J, K)) & $less(K, sortedUntil)) => $lesseq($select(a, J), $select(a, K))))))))))),
                                $let(i := $difference(i, 1), 
                                ((bad | ($lesseq(sortedUntil, i) & $less(i, n))) & ((bad | ![J: $int, K: $int]: (((($lesseq(0, J) & $less(J, sortedUntil)) & $lesseq(sortedUntil, K)) & $less(K, n)) => $lesseq($select(a, J), $select(a, K)))) & ((bad | ![J: $int]: (($lesseq(i, J) & $less(J, n)) => $lesseq($select(a, i), $select(a, J)))) & (bad | ![J: $int, K: $int]: ((($lesseq(0, J) & $less(J, K)) & $less(K, sortedUntil)) => $lesseq($select(a, J), $select(a, K)))))))))),
                           $ite($lesseq($select(a, i), $select(a, $difference(i, 1))),
                                $let(t := $select(a, i), 
                                $let(a := $store(a, i, $select(a, $difference(i, 1))), 
                                $let(a := $store(a, $difference(i, 1), t), 
                                $let(i := $difference(i, 1), 
                                ((bad | ($lesseq(sortedUntil, i) & $less(i, n))) & ((bad | ![J: $int, K: $int]: (((($lesseq(0, J) & $less(J, sortedUntil)) & $lesseq(sortedUntil, K)) & $less(K, n)) => $lesseq($select(a, J), $select(a, K)))) & ((bad | ![J: $int]: (($lesseq(i, J) & $less(J, n)) => $lesseq($select(a, i), $select(a, J)))) & (bad | ![J: $int, K: $int]: ((($lesseq(0, J) & $less(J, K)) & $less(K, sortedUntil)) => $lesseq($select(a, J), $select(a, K))))))))))),
                                $let(i := $difference(i, 1), 
                                ((bad | ($lesseq(sortedUntil, i) & $less(i, n))) & ((bad | ![J: $int, K: $int]: (((($lesseq(0, J) & $less(J, sortedUntil)) & $lesseq(sortedUntil, K)) & $less(K, n)) => $lesseq($select(a, J), $select(a, K)))) & ((bad | ![J: $int]: (($lesseq(i, J) & $less(J, n)) => $lesseq($select(a, i), $select(a, J)))) & (bad | ![J: $int, K: $int]: ((($lesseq(0, J) & $less(J, K)) & $less(K, sortedUntil)) => $lesseq($select(a, J), $select(a, K))))))))))).
%%-- end
