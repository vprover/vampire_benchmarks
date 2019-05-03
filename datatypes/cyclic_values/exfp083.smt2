(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T)))))
(assert (forall ((x8941 T)) (distinct x8941 (f2 (f3 (f2 x8941))))))
(check-sat)
