(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T)))))
(assert (forall ((x6447 T) (x6446 T)) 
  (or (distinct x6446 (f1 x6447 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (distinct x6447 (f1 x6446 x6446 PLACEHOLDER)))))
(check-sat)
