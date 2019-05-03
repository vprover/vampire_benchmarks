(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T)))))
(assert (forall ((x2521 T) (x2522 T) (x2523 T)) 
  (or (distinct x2521 (f1 x2522 (f1 PLACEHOLDER PLACEHOLDER))) (distinct x2522 (f1 x2523 PLACEHOLDER)) (distinct x2523 (f1 x2521 PLACEHOLDER)))))
(check-sat)
