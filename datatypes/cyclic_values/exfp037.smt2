(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (forall ((x3974 T)) (distinct x3974 (f1 x3974))))
(check-sat)
