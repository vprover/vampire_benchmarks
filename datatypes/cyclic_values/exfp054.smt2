(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T)))))
(assert (forall ((x5741 T) (x5740 T)) 
  (or (distinct x5740 (f2 x5741)) (distinct x5741 (f3 x5740 PLACEHOLDER PLACEHOLDER PLACEHOLDER)))))
(check-sat)
