(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T)))))
(assert (forall ((x6093 T)) (distinct x6093 (f1 x6093 PLACEHOLDER PLACEHOLDER))))
(check-sat)
