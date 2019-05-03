(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T)))))
(assert (forall ((x2667 T) (x2666 T) (x2665 T) (x2668 T)) 
  (or (distinct x2665 (f1 x2666 (f1 (f1 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER)))) (distinct x2666 (f1 x2667 PLACEHOLDER)) (distinct x2667 (f1 x2668 PLACEHOLDER)) (distinct x2668 (f1 x2665 PLACEHOLDER)))))
(check-sat)
