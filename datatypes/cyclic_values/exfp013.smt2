(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T)))))
(assert (forall ((x1341 T) (x1340 T) (x1338 T) (x1339 T)) 
  (or (distinct x1338 (f1 x1339 (f1 (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)) (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER))))) (distinct x1339 (f1 x1340 PLACEHOLDER)) (distinct x1340 (f1 x1341 PLACEHOLDER)) (distinct x1341 (f1 x1338 PLACEHOLDER)))))
(check-sat)
