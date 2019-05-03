(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T)))))
(assert (forall ((x2 T) (x0 T) (x1 T)) 
  (or (distinct x0 (f2 x1 (f3 x0) PLACEHOLDER)) (distinct x1 (f1 x2 PLACEHOLDER PLACEHOLDER)) (distinct x2 (f1 x0 PLACEHOLDER PLACEHOLDER)))))
(check-sat)
