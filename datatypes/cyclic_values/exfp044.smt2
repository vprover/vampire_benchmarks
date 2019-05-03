(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T)))))
(assert (forall ((x4665 T) (x4664 T) (x4663 T)) 
  (or (distinct x4663 (f1 x4664 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER)) (distinct x4664 (f1 x4665 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (distinct x4665 (f1 x4663 x4663 PLACEHOLDER PLACEHOLDER)))))
(check-sat)
