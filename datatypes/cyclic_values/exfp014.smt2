(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T)))))
(assert (forall ((x1424 T) (x1425 T) (x1426 T)) 
  (or (distinct x1424 (f1 x1425 (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER) PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER (f3 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (distinct x1425 (f3 x1426)) (distinct x1426 (f1 x1424 x1424 PLACEHOLDER PLACEHOLDER)))))
(check-sat)
