(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T)))))
(assert (forall ((x2429 T) (x2428 T) (x2430 T)) 
  (or (distinct x2428 (f2 x2429 PLACEHOLDER)) (distinct x2429 (f1 x2430 PLACEHOLDER)) (distinct x2430 (f2 x2428 PLACEHOLDER)))))
(check-sat)
