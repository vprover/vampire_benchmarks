(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T)))))
(assert (forall ((x6301 T) (x6302 T) (x6303 T)) 
  (or (distinct x6301 (f3 x6302 (f2 (f2 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f3 (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER))) (distinct x6302 (f1 x6303 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (distinct x6303 (f1 x6301 PLACEHOLDER PLACEHOLDER PLACEHOLDER)))))
(check-sat)
