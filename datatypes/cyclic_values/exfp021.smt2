(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T)))))
(assert (forall ((x2257 T)) (distinct x2257 (f1 x2257 PLACEHOLDER PLACEHOLDER PLACEHOLDER))))
(check-sat)
