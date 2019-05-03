(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T) (proj1f3 T)))))
(assert (forall ((x5385 T) (x5386 T)) 
  (or (distinct x5385 (f2 x5386 PLACEHOLDER PLACEHOLDER)) (distinct x5386 (f1 x5385 PLACEHOLDER)))))
(check-sat)
