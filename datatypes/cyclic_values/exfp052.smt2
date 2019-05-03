(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T))
  (f3 (proj0f3 T))
  (f4 (proj0f4 T)))))
(assert (forall ((x5526 T)) (distinct x5526 (f2 x5526 PLACEHOLDER PLACEHOLDER PLACEHOLDER))))
(check-sat)
