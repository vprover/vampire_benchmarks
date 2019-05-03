(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T)))))
(assert (forall ((x3214 T) (x3213 T) (x3212 T)) 
  (or (distinct x3212 (f2 x3212 x3213 PLACEHOLDER)) (distinct x3213 (f2 x3214 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (distinct x3214 (f2 x3212 PLACEHOLDER PLACEHOLDER)))))
(check-sat)
