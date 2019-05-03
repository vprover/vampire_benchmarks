(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T)))))
(assert (forall ((x5940 T)) (distinct x5940 (f1 x5940 PLACEHOLDER PLACEHOLDER))))
(check-sat)
