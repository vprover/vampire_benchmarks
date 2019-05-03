(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T)))))
(assert (forall ((x6951 T)) (distinct x6951 (f1 (f1 x6951 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))))
(check-sat)
