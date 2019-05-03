(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T)))))
(assert (forall ((x1783 T) (x1782 T) (x1784 T)) 
  (or (distinct x1782 (f1 x1783 (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (distinct x1783 (f1 x1782 x1784 PLACEHOLDER)) (distinct x1784 (f1 x1782 PLACEHOLDER PLACEHOLDER)))))
(check-sat)
