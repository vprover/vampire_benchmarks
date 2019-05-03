(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T)))))
(assert (forall ((x8034 T)) (distinct x8034 (f1 (f2 x8034 PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER)))))
(check-sat)
