(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T))
  (f4 (proj0f4 T) (proj1f4 T)))))
(assert (forall ((x4793 T) (x4792 T)) 
  (or (distinct x4792 (f3 x4793 PLACEHOLDER PLACEHOLDER)) (distinct x4793 (f4 x4792 PLACEHOLDER)))))
(check-sat)
