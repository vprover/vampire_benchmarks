(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T))
  (f4 (proj0f4 T) (proj1f4 T) (proj2f4 T)))))
(assert (forall ((x5262 T) (x5260 T) (x5261 T)) 
  (or (distinct x5260 (f4 x5261 (f4 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (distinct x5261 (f3 x5262 PLACEHOLDER)) (distinct x5262 (f2 x5260)))))
(check-sat)
