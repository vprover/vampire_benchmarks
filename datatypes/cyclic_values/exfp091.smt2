(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T)))))
(assert (forall ((x9718 T)) (distinct x9718 (f1 x9718 x9718 PLACEHOLDER))))
(check-sat)
