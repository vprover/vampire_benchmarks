(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (exists ((y6547 T) (y6546 T) (y6549 T) (y6548 T) (y6550 T)) 
  (or (= y6546 (f1 y6546)) 
    (and (= y6547 (f1 y6548)) (= y6548 (f1 y6547))) (= y6549 (f1 y6549)) (= y6550 (f1 y6550)))))
(check-sat)
