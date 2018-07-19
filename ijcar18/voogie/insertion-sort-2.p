% Status   : Unsatisfiable
thf(a, type, (a:$array($int, $int))).
thf(bad, type, (bad:$o)).
thf(n, type, (n:$int)).
thf(sortedFrom, type, (sortedFrom:$int)).
thf(sortedUntil, type, (sortedUntil:$int)).
thf(t, type, (t:$int)).
thf(voogie_precondition_1, axiom, 
    $greater(n, 0)).
thf(voogie_precondition_2, axiom, 
    ($less(0, sortedUntil) & 
       $lesseq(sortedUntil, n))).
thf(voogie_precondition_3, axiom, 
    (! [K:$int, M:$int] : (((($lesseq(0, K) & 
                              $less(K, M)) & 
                              $less(M, sortedUntil)) => 
                              $lesseq($select(a, K), $select(a, M)))))).
thf(voogie_precondition_4, axiom, 
    (! [K:$int] : ((($lesseq(0, K) & 
                      $less(K, $difference(sortedUntil, 1))) => 
                      $lesseq($select(a, K), $select(a, $difference(sortedUntil, 1))))))).
thf(voogie_precondition_5, axiom, 
    ($less(0, sortedUntil) & 
       $lesseq(sortedUntil, n))).
thf(voogie_precondition_6, axiom, 
    ($lesseq($uminus(1), sortedFrom) & 
       $lesseq(sortedFrom, $difference(sortedUntil, 1)))).
thf(voogie_precondition_7, axiom, 
    (! [K:$int, M:$int] : ((((($lesseq(0, K) & 
                              $less(K, $sum(sortedFrom, 1))) & 
                              $less($sum(sortedFrom, 1), M)) & 
                              $lesseq(M, sortedUntil)) => 
                              $lesseq($select(a, K), $select(a, M)))))).
thf(voogie_precondition_8, axiom, 
    (! [K:$int, M:$int] : (((($lesseq(0, K) & 
                              $less(K, M)) & 
                              $less(M, $sum(sortedFrom, 1))) => 
                              $lesseq($select(a, K), $select(a, M)))))).
thf(voogie_precondition_9, axiom, 
    (! [K:$int, M:$int] : (((($lesseq($sum(sortedFrom, 1), K) & 
                              $less(K, M)) & 
                              $lesseq(M, sortedUntil)) => 
                              $lesseq($select(a, K), $select(a, M)))))).
thf(voogie_conjecture, conjecture, 
    $let(bad := $ite(~$greatereq(sortedFrom, 0), 
                     $true, 
                     bad), 
    $let([t, a] := $ite($greater($select(a, sortedFrom), $select(a, $sum(sortedFrom, 1))), 
                        $let(t := $select(a, sortedFrom), 
                        $let(a := $store(a, sortedFrom, $select(a, $sum(sortedFrom, 1))), 
                        $let(a := $store(a, $sum(sortedFrom, 1), t), 
                             [t, a]))), 
                        [t, a]), 
    $let(sortedFrom := $difference(sortedFrom, 1), 
    $let(bad := $ite(~$greatereq(sortedFrom, 0), 
                     $true, 
                     bad), 
    $let([t, a] := $ite($greater($select(a, sortedFrom), $select(a, $sum(sortedFrom, 1))), 
                        $let(t := $select(a, sortedFrom), 
                        $let(a := $store(a, sortedFrom, $select(a, $sum(sortedFrom, 1))), 
                        $let(a := $store(a, $sum(sortedFrom, 1), t), 
                             [t, a]))), 
                        [t, a]), 
    $let(sortedFrom := $difference(sortedFrom, 1), 
         ((bad | 
            ($less(0, sortedUntil) & 
               $lesseq(sortedUntil, n))) & 
            ((bad | 
               ($lesseq($uminus(1), sortedFrom) & 
                  $lesseq(sortedFrom, $difference(sortedUntil, 1)))) & 
               ((bad | 
                  (! [K:$int, M:$int] : ((((($lesseq(0, K) & 
                                            $less(K, $sum(sortedFrom, 1))) & 
                                            $less($sum(sortedFrom, 1), M)) & 
                                            $lesseq(M, sortedUntil)) => 
                                            $lesseq($select(a, K), $select(a, M)))))) & 
                  ((bad | 
                     (! [K:$int, M:$int] : (((($lesseq(0, K) & 
                                               $less(K, M)) & 
                                               $less(M, $sum(sortedFrom, 1))) => 
                                               $lesseq($select(a, K), $select(a, M)))))) & 
                     (bad | 
                        (! [K:$int, M:$int] : (((($lesseq($sum(sortedFrom, 1), K) & 
                                                  $less(K, M)) & 
                                                  $lesseq(M, sortedUntil)) => 
                                                  $lesseq($select(a, K), $select(a, M))))))))))))))))).

