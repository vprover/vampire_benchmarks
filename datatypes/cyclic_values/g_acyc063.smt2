(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T)))))
(assert (exists ((y6625 T)) (= y6625 (f1 y6625 PLACEHOLDER PLACEHOLDER))))
(check-sat)
