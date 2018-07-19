% Status   : Unsatisfiable
thf(a, type, (a:$array($int, $int))).
thf(bad, type, (bad:$o)).
thf(d, type, (d:$int)).
thf(i, type, (i:$int)).
thf(n, type, (n:$int)).
thf(occs, type, (occs:$array($int, $o))).
thf(voogie_precondition_1, axiom, 
    $greater(n, 0)).
thf(voogie_precondition_2, axiom, 
    (! [I:$int] : ((($lesseq(0, I) & 
                      $less(I, n)) => 
                      $greatereq($select(a, I), 0))))).
thf(voogie_precondition_3, axiom, 
    ($lesseq(0, i) & 
       $lesseq(i, n))).
thf(voogie_precondition_4, axiom, 
    ($greatereq(d, 0) => 
       $select(occs, $select(a, i)))).
thf(voogie_precondition_5, axiom, 
    (! [K:$int] : ((($lesseq(0, K) & 
                      $less(K, i)) => 
                      $select(occs, $select(a, K)))))).
thf(voogie_precondition_6, axiom, 
    (! [J:$int, K:$int] : (((($lesseq(0, J) & 
                              $less(J, K)) & 
                              $less(K, i)) => 
                              ($select(a, J) != $select(a, K)))))).
thf(voogie_conjecture, conjecture, 
    $let(bad := $ite(~($less(i, n) & 
    $less(d, 0)), 
                     $true, 
                     bad), 
    $let([d, occs, i] := $ite(~$select(occs, $select(a, i)), 
                              $let(occs := $store(occs, $select(a, i), $true), 
                              $let(i := $sum(i, 1), 
                                   [d, occs, i])), 
                              $let(d := $select(a, i), 
                                   [d, occs, i])), 
    $let(bad := $ite(~($less(i, n) & 
    $less(d, 0)), 
                     $true, 
                     bad), 
    $let([d, occs, i] := $ite(~$select(occs, $select(a, i)), 
                              $let(occs := $store(occs, $select(a, i), $true), 
                              $let(i := $sum(i, 1), 
                                   [d, occs, i])), 
                              $let(d := $select(a, i), 
                                   [d, occs, i])), 
         ((bad | 
            ($lesseq(0, i) & 
               $lesseq(i, n))) & 
            ((bad | 
               ($greatereq(d, 0) => 
                  $select(occs, $select(a, i)))) & 
               ((bad | 
                  (! [K:$int] : ((($lesseq(0, K) & 
                                    $less(K, i)) => 
                                    $select(occs, $select(a, K)))))) & 
                  (bad | 
                     (! [J:$int, K:$int] : (((($lesseq(0, J) & 
                                               $less(J, K)) & 
                                               $less(K, i)) => 
                                               ($select(a, J) != $select(a, K)))))))))))))).

