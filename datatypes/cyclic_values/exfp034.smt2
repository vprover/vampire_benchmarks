(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T)))))
(assert (forall ((x3681 T) (x3679 T) (x3678 T) (x3680 T)) 
  (or (distinct x3678 (f1 x3679 (f1 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (distinct x3679 (f1 x3680 PLACEHOLDER PLACEHOLDER)) (distinct x3680 (f1 x3681 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (distinct x3681 (f1 x3678 x3678 PLACEHOLDER)))))
(check-sat)
