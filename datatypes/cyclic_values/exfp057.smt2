(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T)))))
(assert (forall ((x6013 T)) (distinct x6013 (f1 x6013 x6013 PLACEHOLDER PLACEHOLDER))))
(check-sat)
