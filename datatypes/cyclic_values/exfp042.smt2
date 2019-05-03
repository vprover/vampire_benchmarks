(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T)))))
(assert (forall ((x4470 T) (x4471 T) (x4469 T) (x4468 T)) 
  (or (distinct x4468 (f2 x4469 PLACEHOLDER)) (distinct x4469 (f2 x4470 (f2 PLACEHOLDER (f1 PLACEHOLDER)))) (distinct x4470 (f1 x4471)) (distinct x4471 (f2 x4468 PLACEHOLDER)))))
(check-sat)
