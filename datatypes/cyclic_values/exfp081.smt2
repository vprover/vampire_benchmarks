(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T)))))
(assert (forall ((x8692 T)) (distinct x8692 (f2 x8692 PLACEHOLDER PLACEHOLDER PLACEHOLDER))))
(check-sat)
