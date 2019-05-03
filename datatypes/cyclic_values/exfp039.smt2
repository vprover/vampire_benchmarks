(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T))
  (f4 (proj0f4 T) (proj1f4 T)))))
(assert (forall ((x4184 T)) (distinct x4184 (f1 (f1 (f3 x4184 PLACEHOLDER PLACEHOLDER PLACEHOLDER))))))
(check-sat)
