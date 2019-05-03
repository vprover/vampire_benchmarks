(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T)))))
(assert (forall ((x9980 T) (x9978 T) (x9979 T)) 
  (or (distinct x9978 (f2 (f1 x9979 (f2 (f2 PLACEHOLDER)) PLACEHOLDER))) (distinct x9979 (f2 x9980)) (distinct x9980 (f1 x9978 PLACEHOLDER PLACEHOLDER)))))
(check-sat)
