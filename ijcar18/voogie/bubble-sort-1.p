% Status   : Unsatisfiable
thf(a, type, (a:$array($int, $int))).
thf(bad, type, (bad:$o)).
thf(i, type, (i:$int)).
thf(n, type, (n:$int)).
thf(sortedUntil, type, (sortedUntil:$int)).
thf(t, type, (t:$int)).
thf(voogie_precondition_1, axiom, 
    $greatereq(n, 0)).
thf(voogie_precondition_2, axiom, 
    ($lesseq(0, sortedUntil) & 
       $lesseq(sortedUntil, n))).
thf(voogie_precondition_3, axiom, 
    (! [J:$int, K:$int] : ((((($lesseq(0, J) & 
                              $less(J, sortedUntil)) & 
                              $lesseq(sortedUntil, K)) & 
                              $less(K, n)) => 
                              $lesseq($select(a, J), $select(a, K)))))).
thf(voogie_precondition_4, axiom, 
    (! [J:$int, K:$int] : (((($lesseq(0, J) & 
                              $less(J, K)) & 
                              $less(K, sortedUntil)) => 
                              $lesseq($select(a, J), $select(a, K)))))).
thf(voogie_precondition_5, axiom, 
    ($lesseq(sortedUntil, i) & 
       $less(i, n))).
thf(voogie_precondition_6, axiom, 
    (! [J:$int, K:$int] : ((((($lesseq(0, J) & 
                              $less(J, sortedUntil)) & 
                              $lesseq(sortedUntil, K)) & 
                              $less(K, n)) => 
                              $lesseq($select(a, J), $select(a, K)))))).
thf(voogie_precondition_7, axiom, 
    (! [J:$int] : ((($lesseq(i, J) & 
                      $less(J, n)) => 
                      $lesseq($select(a, i), $select(a, J)))))).
thf(voogie_precondition_8, axiom, 
    (! [J:$int, K:$int] : (((($lesseq(0, J) & 
                              $less(J, K)) & 
                              $less(K, sortedUntil)) => 
                              $lesseq($select(a, J), $select(a, K)))))).
thf(voogie_conjecture, conjecture, 
    $let(bad := $ite(~$greater(i, sortedUntil), 
                     $true, 
                     bad), 
    $let([t, a] := $ite($lesseq($select(a, i), $select(a, $difference(i, 1))), 
                        $let(t := $select(a, i), 
                        $let(a := $store(a, i, $select(a, $difference(i, 1))), 
                        $let(a := $store(a, $difference(i, 1), t), 
                             [t, a]))), 
                        [t, a]), 
    $let(i := $difference(i, 1), 
         ((bad | 
            ($lesseq(sortedUntil, i) & 
               $less(i, n))) & 
            ((bad | 
               (! [J:$int, K:$int] : ((((($lesseq(0, J) & 
                                         $less(J, sortedUntil)) & 
                                         $lesseq(sortedUntil, K)) & 
                                         $less(K, n)) => 
                                         $lesseq($select(a, J), $select(a, K)))))) & 
               ((bad | 
                  (! [J:$int] : ((($lesseq(i, J) & 
                                    $less(J, n)) => 
                                    $lesseq($select(a, i), $select(a, J)))))) & 
                  (bad | 
                     (! [J:$int, K:$int] : (((($lesseq(0, J) & 
                                               $less(J, K)) & 
                                               $less(K, sortedUntil)) => 
                                               $lesseq($select(a, J), $select(a, K))))))))))))).

