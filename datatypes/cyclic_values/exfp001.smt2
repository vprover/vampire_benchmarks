(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (forall ((x130 T)) (distinct x130 (f1 x130))))
(check-sat)
