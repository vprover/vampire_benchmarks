(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T)))))
(assert (forall ((x3603 T)) (distinct x3603 (f1 x3603 x3603 PLACEHOLDER))))
(check-sat)
