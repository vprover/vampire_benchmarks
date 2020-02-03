(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T))
  (f4 (proj0f4 T) (proj1f4 T) (proj2f4 T) (proj3f4 T)))))
(assert (forall ((x10399 T) (x10400 T)) 
  (or (distinct x10399 (f3 x10400 PLACEHOLDER (f2 PLACEHOLDER))) (distinct x10400 (f1 x10399 PLACEHOLDER PLACEHOLDER PLACEHOLDER)))))
(check-sat)