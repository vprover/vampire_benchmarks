(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T)))))
(assert (forall ((x4552 T)) (distinct x4552 (f1 x4552 PLACEHOLDER PLACEHOLDER))))
(check-sat)
