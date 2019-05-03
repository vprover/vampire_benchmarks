(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T))
  (f3 (proj0f3 T)))))
(assert (forall ((x408 T)) (distinct x408 (f2 (f1 (f2 x408 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER) (f1 PLACEHOLDER) (f1 PLACEHOLDER)))))
(check-sat)
