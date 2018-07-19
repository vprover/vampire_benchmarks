% Status   : Unsatisfiable
thf(a, type, (a:$array($int, $int))).
thf(bad, type, (bad:$o)).
thf(m, type, (m:$int)).
thf(n, type, (n:$int)).
thf(x, type, (x:$int)).
thf(y, type, (y:$int)).
thf(voogie_precondition_1, axiom, 
    $greater(n, 0)).
thf(voogie_precondition_2, axiom, 
    (($lesseq(0, x) & 
       $lesseq(x, y)) & 
       $less(y, n))).
thf(voogie_precondition_3, axiom, 
    ((m = x) | 
       (m = y))).
thf(voogie_precondition_4, axiom, 
    (! [I:$int] : ((($lesseq(0, I) & 
                      $less(I, x)) => 
                      $lesseq($select(a, I), $select(a, m)))))).
thf(voogie_precondition_5, axiom, 
    (! [I:$int] : ((($less(y, I) & 
                      $less(I, n)) => 
                      $lesseq($select(a, I), $select(a, m)))))).
thf(voogie_conjecture, conjecture, 
    $let(bad := $ite(~(x != y), 
                     $true, 
                     bad), 
    $let([m, y, x] := $ite($lesseq($select(a, x), $select(a, y)), 
                           $let(x := $sum(x, 1), 
                           $let(m := y, 
                                [m, y, x])), 
                           $let(y := $difference(y, 1), 
                           $let(m := x, 
                                [m, y, x]))), 
    $let(bad := $ite(~(x != y), 
                     $true, 
                     bad), 
    $let([m, y, x] := $ite($lesseq($select(a, x), $select(a, y)), 
                           $let(x := $sum(x, 1), 
                           $let(m := y, 
                                [m, y, x])), 
                           $let(y := $difference(y, 1), 
                           $let(m := x, 
                                [m, y, x]))), 
    $let(bad := $ite(~(x != y), 
                     $true, 
                     bad), 
    $let([m, y, x] := $ite($lesseq($select(a, x), $select(a, y)), 
                           $let(x := $sum(x, 1), 
                           $let(m := y, 
                                [m, y, x])), 
                           $let(y := $difference(y, 1), 
                           $let(m := x, 
                                [m, y, x]))), 
         ((bad | 
            (($lesseq(0, x) & 
               $lesseq(x, y)) & 
               $less(y, n))) & 
            ((bad | 
               ((m = x) | 
                  (m = y))) & 
               ((bad | 
                  (! [I:$int] : ((($lesseq(0, I) & 
                                    $less(I, x)) => 
                                    $lesseq($select(a, I), $select(a, m)))))) & 
                  (bad | 
                     (! [I:$int] : ((($less(y, I) & 
                                       $less(I, n)) => 
                                       $lesseq($select(a, I), $select(a, m)))))))))))))))).

