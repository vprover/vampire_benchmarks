(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T)))))
(assert (forall ((x550 T) (x549 T)) 
  (or (distinct x549 (f1 x550 (f1 PLACEHOLDER PLACEHOLDER))) (distinct x550 (f2 x549 PLACEHOLDER)))))
(check-sat)
