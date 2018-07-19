% Status   : Unsatisfiable
thf(a, type, (a:$array($int, $o))).
thf(bad, type, (bad:$o)).
thf(i, type, (i:$int)).
thf(j, type, (j:$int)).
thf(n, type, (n:$int)).
thf(t, type, (t:$o)).
thf(voogie_precondition_1, axiom, 
    $greater(n, 0)).
thf(voogie_precondition_2, axiom, 
    (($lesseq(0, i) & 
       $lesseq(i, $sum(j, 1))) & 
       $lesseq($sum(j, 1), n))).
thf(voogie_precondition_3, axiom, 
    (! [M:$int] : ((($lesseq(0, M) & 
                      $less(M, i)) => 
                      ~$select(a, M))))).
thf(voogie_precondition_4, axiom, 
    (! [K:$int] : ((($less(j, K) & 
                      $less(K, n)) => 
                      $select(a, K))))).
thf(voogie_conjecture, conjecture, 
    $let(bad := $ite(~$lesseq(i, j), 
                     $true, 
                     bad), 
    $let([j, i, a, t] := $ite(~$select(a, i), 
                              $let(i := $sum(i, 1), 
                                   [j, i, a, t]), 
                              $ite($select(a, j), 
                                   $let(j := $difference(j, 1), 
                                        [j, i, a, t]), 
                                   $let(t := $select(a, i), 
                                   $let(a := $store(a, i, $select(a, j)), 
                                   $let(a := $store(a, j, t), 
                                   $let(i := $sum(i, 1), 
                                   $let(j := $difference(j, 1), 
                                        [j, i, a, t]))))))), 
         ((bad | 
            (($lesseq(0, i) & 
               $lesseq(i, $sum(j, 1))) & 
               $lesseq($sum(j, 1), n))) & 
            ((bad | 
               (! [M:$int] : ((($lesseq(0, M) & 
                                 $less(M, i)) => 
                                 ~$select(a, M))))) & 
               (bad | 
                  (! [K:$int] : ((($less(j, K) & 
                                    $less(K, n)) => 
                                    $select(a, K)))))))))).

