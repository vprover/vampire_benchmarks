(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T)))))
(assert (exists ((y1269 T)) (= y1269 (f3 y1269 y1269 PLACEHOLDER))))
(check-sat)
