(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T)))))
(assert (forall ((x1260 T) (x1259 T)) 
  (or (distinct x1259 (f1 (f1 x1259 PLACEHOLDER PLACEHOLDER) x1260 PLACEHOLDER)) (distinct x1260 (f1 x1259 PLACEHOLDER PLACEHOLDER)))))
(check-sat)
