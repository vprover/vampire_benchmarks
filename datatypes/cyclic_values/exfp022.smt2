(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T))
  (f4 (proj0f4 T)))))
(assert (forall ((x2342 T)) (distinct x2342 (f1 (f4 (f3 (f2 (f1 x2342)) (f1 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f4 PLACEHOLDER)))))))
(check-sat)
