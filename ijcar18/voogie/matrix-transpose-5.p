% Status   : Unsatisfiable
thf(bad, type, (bad:$o)).
thf(col, type, (col:$int)).
thf(matrix, type, (matrix:$array($int, $array($int, $int)))).
thf(row, type, (row:$int)).
thf(size, type, (size:$int)).
thf(transposed, type, (transposed:$array($int, $array($int, $int)))).
thf(voogie_precondition_1, axiom, 
    $greater(size, 0)).
thf(voogie_precondition_2, axiom, 
    ($lesseq(0, row) & 
       $lesseq(row, col))).
thf(voogie_precondition_3, axiom, 
    (! [I:$int, J:$int] : (((((($lesseq(0, I) & 
                              $lesseq(I, J)) & 
                              $less(J, size)) & 
                              (((I = row) & 
                                 $less(J, col)) | 
                                 $less(I, row))) => 
                              ($select($select(transposed, I), J) = $select($select(matrix, J), I))) & 
                              ($select($select(transposed, J), I) = $select($select(matrix, I), J)))))).
thf(voogie_conjecture, conjecture, 
    $let(bad := $ite(~(row != size), 
                     $true, 
                     bad), 
    $let([transposed, col, row] := $ite($less(col, size), 
                                        $let(transposed := $store(transposed, row, $store($select(transposed, row), col, $select($select(matrix, col), row))), 
                                        $let(transposed := $store(transposed, col, $store($select(transposed, col), row, $select($select(matrix, row), col))), 
                                        $let(col := $sum(col, 1), 
                                             [transposed, col, row]))), 
                                        $let(row := $sum(row, 1), 
                                        $let(col := $sum(row, 1), 
                                        $let(transposed := $store(transposed, row, $store($select(transposed, row), row, $select($select(matrix, row), row))), 
                                             [transposed, col, row])))), 
    $let(bad := $ite(~(row != size), 
                     $true, 
                     bad), 
    $let([transposed, col, row] := $ite($less(col, size), 
                                        $let(transposed := $store(transposed, row, $store($select(transposed, row), col, $select($select(matrix, col), row))), 
                                        $let(transposed := $store(transposed, col, $store($select(transposed, col), row, $select($select(matrix, row), col))), 
                                        $let(col := $sum(col, 1), 
                                             [transposed, col, row]))), 
                                        $let(row := $sum(row, 1), 
                                        $let(col := $sum(row, 1), 
                                        $let(transposed := $store(transposed, row, $store($select(transposed, row), row, $select($select(matrix, row), row))), 
                                             [transposed, col, row])))), 
    $let(bad := $ite(~(row != size), 
                     $true, 
                     bad), 
    $let([transposed, col, row] := $ite($less(col, size), 
                                        $let(transposed := $store(transposed, row, $store($select(transposed, row), col, $select($select(matrix, col), row))), 
                                        $let(transposed := $store(transposed, col, $store($select(transposed, col), row, $select($select(matrix, row), col))), 
                                        $let(col := $sum(col, 1), 
                                             [transposed, col, row]))), 
                                        $let(row := $sum(row, 1), 
                                        $let(col := $sum(row, 1), 
                                        $let(transposed := $store(transposed, row, $store($select(transposed, row), row, $select($select(matrix, row), row))), 
                                             [transposed, col, row])))), 
    $let(bad := $ite(~(row != size), 
                     $true, 
                     bad), 
    $let([transposed, col, row] := $ite($less(col, size), 
                                        $let(transposed := $store(transposed, row, $store($select(transposed, row), col, $select($select(matrix, col), row))), 
                                        $let(transposed := $store(transposed, col, $store($select(transposed, col), row, $select($select(matrix, row), col))), 
                                        $let(col := $sum(col, 1), 
                                             [transposed, col, row]))), 
                                        $let(row := $sum(row, 1), 
                                        $let(col := $sum(row, 1), 
                                        $let(transposed := $store(transposed, row, $store($select(transposed, row), row, $select($select(matrix, row), row))), 
                                             [transposed, col, row])))), 
    $let(bad := $ite(~(row != size), 
                     $true, 
                     bad), 
    $let([transposed, col, row] := $ite($less(col, size), 
                                        $let(transposed := $store(transposed, row, $store($select(transposed, row), col, $select($select(matrix, col), row))), 
                                        $let(transposed := $store(transposed, col, $store($select(transposed, col), row, $select($select(matrix, row), col))), 
                                        $let(col := $sum(col, 1), 
                                             [transposed, col, row]))), 
                                        $let(row := $sum(row, 1), 
                                        $let(col := $sum(row, 1), 
                                        $let(transposed := $store(transposed, row, $store($select(transposed, row), row, $select($select(matrix, row), row))), 
                                             [transposed, col, row])))), 
         ((bad | 
            ($lesseq(0, row) & 
               $lesseq(row, col))) & 
            (bad | 
               (! [I:$int, J:$int] : (((((($lesseq(0, I) & 
                                         $lesseq(I, J)) & 
                                         $less(J, size)) & 
                                         (((I = row) & 
                                            $less(J, col)) | 
                                            $less(I, row))) => 
                                         ($select($select(transposed, I), J) = $select($select(matrix, J), I))) & 
                                         ($select($select(transposed, J), I) = $select($select(matrix, I), J)))))))))))))))))).

