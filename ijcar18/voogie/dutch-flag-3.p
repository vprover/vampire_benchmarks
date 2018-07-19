% Status   : Unsatisfiable
thf(a, type, (a:$array($int, $int))).
thf(bad, type, (bad:$o)).
thf(high, type, (high:$int)).
thf(i, type, (i:$int)).
thf(low, type, (low:$int)).
thf(n, type, (n:$int)).
thf(pivot, type, (pivot:$int)).
thf(t, type, (t:$int)).
thf(voogie_precondition_1, axiom, 
    $greatereq(n, 0)).
thf(voogie_precondition_2, axiom, 
    ((($lesseq(0, low) & 
       $lesseq(low, i)) & 
       $lesseq(i, $sum(high, 1))) & 
       $less(high, n))).
thf(voogie_precondition_3, axiom, 
    (! [K:$int] : ((($lesseq(0, K) & 
                      $less(K, low)) => 
                      $less($select(a, K), pivot))))).
thf(voogie_precondition_4, axiom, 
    (! [K:$int] : ((($lesseq(low, K) & 
                      $less(K, i)) => 
                      ($select(a, K) = pivot))))).
thf(voogie_precondition_5, axiom, 
    (! [K:$int] : ((($less(high, K) & 
                      $less(K, n)) => 
                      $greater($select(a, K), pivot))))).
thf(voogie_conjecture, conjecture, 
    $let(bad := $ite(~$lesseq(i, high), 
                     $true, 
                     bad), 
    $let([i, t, a, high, low] := $ite($less($select(a, i), pivot), 
                                      $let(t := $select(a, low), 
                                      $let(a := $store(a, low, $select(a, i)), 
                                      $let(a := $store(a, i, t), 
                                      $let(low := $sum(low, 1), 
                                      $let(i := $sum(i, 1), 
                                           [i, t, a, high, low]))))), 
                                      $let([i, t, a, high] := $ite($greater($select(a, i), pivot), 
                                                                   $let(t := $select(a, i), 
                                                                   $let(a := $store(a, i, $select(a, high)), 
                                                                   $let(a := $store(a, high, t), 
                                                                   $let(high := $difference(high, 1), 
                                                                        [i, t, a, high])))), 
                                                                   $let(i := $sum(i, 1), 
                                                                        [i, t, a, high])), 
                                           [i, t, a, high, low])), 
    $let(bad := $ite(~$lesseq(i, high), 
                     $true, 
                     bad), 
    $let([i, t, a, high, low] := $ite($less($select(a, i), pivot), 
                                      $let(t := $select(a, low), 
                                      $let(a := $store(a, low, $select(a, i)), 
                                      $let(a := $store(a, i, t), 
                                      $let(low := $sum(low, 1), 
                                      $let(i := $sum(i, 1), 
                                           [i, t, a, high, low]))))), 
                                      $let([i, t, a, high] := $ite($greater($select(a, i), pivot), 
                                                                   $let(t := $select(a, i), 
                                                                   $let(a := $store(a, i, $select(a, high)), 
                                                                   $let(a := $store(a, high, t), 
                                                                   $let(high := $difference(high, 1), 
                                                                        [i, t, a, high])))), 
                                                                   $let(i := $sum(i, 1), 
                                                                        [i, t, a, high])), 
                                           [i, t, a, high, low])), 
    $let(bad := $ite(~$lesseq(i, high), 
                     $true, 
                     bad), 
    $let([i, t, a, high, low] := $ite($less($select(a, i), pivot), 
                                      $let(t := $select(a, low), 
                                      $let(a := $store(a, low, $select(a, i)), 
                                      $let(a := $store(a, i, t), 
                                      $let(low := $sum(low, 1), 
                                      $let(i := $sum(i, 1), 
                                           [i, t, a, high, low]))))), 
                                      $let([i, t, a, high] := $ite($greater($select(a, i), pivot), 
                                                                   $let(t := $select(a, i), 
                                                                   $let(a := $store(a, i, $select(a, high)), 
                                                                   $let(a := $store(a, high, t), 
                                                                   $let(high := $difference(high, 1), 
                                                                        [i, t, a, high])))), 
                                                                   $let(i := $sum(i, 1), 
                                                                        [i, t, a, high])), 
                                           [i, t, a, high, low])), 
         ((bad | 
            ((($lesseq(0, low) & 
               $lesseq(low, i)) & 
               $lesseq(i, $sum(high, 1))) & 
               $less(high, n))) & 
            ((bad | 
               (! [K:$int] : ((($lesseq(0, K) & 
                                 $less(K, low)) => 
                                 $less($select(a, K), pivot))))) & 
               ((bad | 
                  (! [K:$int] : ((($lesseq(low, K) & 
                                    $less(K, i)) => 
                                    ($select(a, K) = pivot))))) & 
                  (bad | 
                     (! [K:$int] : ((($less(high, K) & 
                                       $less(K, n)) => 
                                       $greater($select(a, K), pivot))))))))))))))).

