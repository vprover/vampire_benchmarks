% Status   : Unsatisfiable
thf(a, type, (a:$array($int, $int))).
thf(bad, type, (bad:$o)).
thf(i, type, (i:$int)).
thf(max, type, (max:$int)).
thf(n, type, (n:$int)).
thf(voogie_precondition_1, axiom, 
    $greater(n, 0)).
thf(voogie_precondition_2, axiom, 
    (! [J:$int] : ((($greatereq(J, 0) & 
                      $less(J, i)) => 
                      $greatereq(max, $select(a, J)))))).
thf(voogie_conjecture, conjecture, 
    $let(bad := $ite(~$less(i, n), 
                     $true, 
                     bad), 
    $let(max := $ite($less(max, $select(a, i)), 
                     $select(a, i), 
                     max), 
    $let(i := $sum(i, 1), 
    $let(bad := $ite(~$less(i, n), 
                     $true, 
                     bad), 
    $let(max := $ite($less(max, $select(a, i)), 
                     $select(a, i), 
                     max), 
    $let(i := $sum(i, 1), 
    $let(bad := $ite(~$less(i, n), 
                     $true, 
                     bad), 
    $let(max := $ite($less(max, $select(a, i)), 
                     $select(a, i), 
                     max), 
    $let(i := $sum(i, 1), 
    $let(bad := $ite(~$less(i, n), 
                     $true, 
                     bad), 
    $let(max := $ite($less(max, $select(a, i)), 
                     $select(a, i), 
                     max), 
    $let(i := $sum(i, 1), 
         (bad | 
            (! [J:$int] : ((($greatereq(J, 0) & 
                              $less(J, i)) => 
                              $greatereq(max, $select(a, J))))))))))))))))))).

