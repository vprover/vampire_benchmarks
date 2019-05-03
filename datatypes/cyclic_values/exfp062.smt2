(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T)))))
(assert (forall ((x6548 T)) (distinct x6548 (f2 x6548 PLACEHOLDER PLACEHOLDER))))
(check-sat)
