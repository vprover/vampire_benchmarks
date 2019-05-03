(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T) (proj1f3 T)))))
(assert (forall ((x5634 T) (x5633 T)) 
  (or (distinct x5633 (f2 x5634 PLACEHOLDER)) (distinct x5634 (f3 x5633 PLACEHOLDER)))))
(check-sat)
