% Status   : Unsatisfiable
thf(a, type, (a:$array($int, $int))).
thf(bad, type, (bad:$o)).
thf(e, type, (e:$int)).
thf(high, type, (high:$int)).
thf(i, type, (i:$int)).
thf(low, type, (low:$int)).
thf(mid, type, (mid:$int)).
thf(n, type, (n:$int)).
thf(voogie_precondition_1, axiom, 
    $greater(n, 0)).
thf(voogie_precondition_2, axiom, 
    (! [J:$int, K:$int] : (((($lesseq(0, J) & 
                              $lesseq(J, K)) & 
                              $less(K, n)) => 
                              $lesseq($select(a, J), $select(a, K)))))).
thf(voogie_precondition_3, axiom, 
    (($lesseq(0, low) & 
       $lesseq(low, $sum(high, 1))) & 
       $less(high, n))).
thf(voogie_precondition_4, axiom, 
    ($greatereq(i, 0) => 
       ($select(a, i) = e))).
thf(voogie_precondition_5, axiom, 
    (! [K:$int] : ((($greatereq(K, 0) & 
                      $less(K, low)) => 
                      $less($select(a, K), e))))).
thf(voogie_precondition_6, axiom, 
    (! [K:$int] : ((($greater(K, high) & 
                      $less(K, n)) => 
                      $greater($select(a, K), e))))).
thf(voogie_conjecture, conjecture, 
    $let(bad := $ite(~($lesseq(low, high) & 
    $less(i, 0)), 
                     $true, 
                     bad), 
    $let(mid := $quotient_e($sum(low, high), 2), 
    $let([high, low, i] := $ite(($select(a, mid) = e), 
                                $let(i := mid, 
                                     [high, low, i]), 
                                $let([high, low] := $ite($less($select(a, mid), e), 
                                                         $let(low := $sum(mid, 1), 
                                                              [high, low]), 
                                                         $let(high := $difference(mid, 1), 
                                                              [high, low])), 
                                     [high, low, i])), 
    $let(bad := $ite(~($lesseq(low, high) & 
    $less(i, 0)), 
                     $true, 
                     bad), 
    $let(mid := $quotient_e($sum(low, high), 2), 
    $let([high, low, i] := $ite(($select(a, mid) = e), 
                                $let(i := mid, 
                                     [high, low, i]), 
                                $let([high, low] := $ite($less($select(a, mid), e), 
                                                         $let(low := $sum(mid, 1), 
                                                              [high, low]), 
                                                         $let(high := $difference(mid, 1), 
                                                              [high, low])), 
                                     [high, low, i])), 
    $let(bad := $ite(~($lesseq(low, high) & 
    $less(i, 0)), 
                     $true, 
                     bad), 
    $let(mid := $quotient_e($sum(low, high), 2), 
    $let([high, low, i] := $ite(($select(a, mid) = e), 
                                $let(i := mid, 
                                     [high, low, i]), 
                                $let([high, low] := $ite($less($select(a, mid), e), 
                                                         $let(low := $sum(mid, 1), 
                                                              [high, low]), 
                                                         $let(high := $difference(mid, 1), 
                                                              [high, low])), 
                                     [high, low, i])), 
         ((bad | 
            (($lesseq(0, low) & 
               $lesseq(low, $sum(high, 1))) & 
               $less(high, n))) & 
            ((bad | 
               ($greatereq(i, 0) => 
                  ($select(a, i) = e))) & 
               ((bad | 
                  (! [K:$int] : ((($greatereq(K, 0) & 
                                    $less(K, low)) => 
                                    $less($select(a, K), e))))) & 
                  (bad | 
                     (! [K:$int] : ((($greater(K, high) & 
                                       $less(K, n)) => 
                                       $greater($select(a, K), e)))))))))))))))))).

