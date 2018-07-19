% Status   : Unsatisfiable
thf(a, type, (a:$array($int, $int))).
thf(bad, type, (bad:$o)).
thf(i, type, (i:$int)).
thf(j, type, (j:$int)).
thf(k, type, (k:$int)).
thf(minValue, type, (minValue:$int)).
thf(n, type, (n:$int)).
thf(t, type, (t:$int)).
thf(voogie_precondition_1, axiom, 
    $greater(n, 0)).
thf(voogie_precondition_2, axiom, 
    ($lesseq(0, k) & 
       $less(k, n))).
thf(voogie_precondition_3, axiom, 
    ($lesseq(0, i) & 
       $lesseq(i, $sum(k, 1)))).
thf(voogie_precondition_4, axiom, 
    ($greater(i, 0) => 
       (! [V:$int] : ((($lesseq(0, V) & 
                         $less(V, $difference(i, 1))) => 
                         $lesseq($select(a, V), $select(a, $difference(i, 1)))))))).
thf(voogie_precondition_5, axiom, 
    ($greater(i, 0) => 
       (! [W:$int] : ((($less($difference(i, 1), W) & 
                         $less(W, n)) => 
                         $lesseq($select(a, $difference(i, 1)), $select(a, W))))))).
thf(voogie_precondition_6, axiom, 
    ($lesseq($sum(i, 1), j) & 
       $lesseq(j, n))).
thf(voogie_precondition_7, axiom, 
    ($select(a, i) = minValue)).
thf(voogie_precondition_8, axiom, 
    (! [W:$int] : ((($less(i, W) & 
                      $less(W, j)) => 
                      $lesseq($select(a, i), $select(a, W)))))).
thf(voogie_precondition_9, axiom, 
    (! [V:$int, W:$int] : ((((($lesseq(0, V) & 
                              $less(V, i)) & 
                              $lesseq(i, W)) & 
                              $less(W, n)) => 
                              $lesseq($select(a, V), $select(a, W)))))).
thf(voogie_conjecture, conjecture, 
    $let(bad := $ite(~$less(j, n), 
                     $true, 
                     bad), 
    $let([minValue, t, a] := $ite($less($select(a, j), minValue), 
                                  $let(minValue := $select(a, j), 
                                  $let(t := $select(a, i), 
                                  $let(a := $store(a, i, $select(a, j)), 
                                  $let(a := $store(a, j, t), 
                                       [minValue, t, a])))), 
                                  [minValue, t, a]), 
    $let(j := $sum(j, 1), 
    $let(bad := $ite(~$less(j, n), 
                     $true, 
                     bad), 
    $let([minValue, t, a] := $ite($less($select(a, j), minValue), 
                                  $let(minValue := $select(a, j), 
                                  $let(t := $select(a, i), 
                                  $let(a := $store(a, i, $select(a, j)), 
                                  $let(a := $store(a, j, t), 
                                       [minValue, t, a])))), 
                                  [minValue, t, a]), 
    $let(j := $sum(j, 1), 
    $let(bad := $ite(~$less(j, n), 
                     $true, 
                     bad), 
    $let([minValue, t, a] := $ite($less($select(a, j), minValue), 
                                  $let(minValue := $select(a, j), 
                                  $let(t := $select(a, i), 
                                  $let(a := $store(a, i, $select(a, j)), 
                                  $let(a := $store(a, j, t), 
                                       [minValue, t, a])))), 
                                  [minValue, t, a]), 
    $let(j := $sum(j, 1), 
    $let(bad := $ite(~$less(j, n), 
                     $true, 
                     bad), 
    $let([minValue, t, a] := $ite($less($select(a, j), minValue), 
                                  $let(minValue := $select(a, j), 
                                  $let(t := $select(a, i), 
                                  $let(a := $store(a, i, $select(a, j)), 
                                  $let(a := $store(a, j, t), 
                                       [minValue, t, a])))), 
                                  [minValue, t, a]), 
    $let(j := $sum(j, 1), 
    $let(bad := $ite(~$less(j, n), 
                     $true, 
                     bad), 
    $let([minValue, t, a] := $ite($less($select(a, j), minValue), 
                                  $let(minValue := $select(a, j), 
                                  $let(t := $select(a, i), 
                                  $let(a := $store(a, i, $select(a, j)), 
                                  $let(a := $store(a, j, t), 
                                       [minValue, t, a])))), 
                                  [minValue, t, a]), 
    $let(j := $sum(j, 1), 
         ((bad | 
            ($lesseq($sum(i, 1), j) & 
               $lesseq(j, n))) & 
            ((bad | 
               ($select(a, i) = minValue)) & 
               ((bad | 
                  (! [W:$int] : ((($less(i, W) & 
                                    $less(W, j)) => 
                                    $lesseq($select(a, i), $select(a, W)))))) & 
                  (bad | 
                     (! [V:$int, W:$int] : ((((($lesseq(0, V) & 
                                               $less(V, i)) & 
                                               $lesseq(i, W)) & 
                                               $less(W, n)) => 
                                               $lesseq($select(a, V), $select(a, W))))))))))))))))))))))))).

