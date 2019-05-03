(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T)))))
(assert (forall ((x10560 T) (x10561 T) (x10562 T) (x10563 T)) 
  (or (distinct x10560 (f3 x10561 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (distinct x10561 (f1 x10562 PLACEHOLDER)) (distinct x10562 (f2 x10563 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (distinct x10563 (f1 x10560 PLACEHOLDER)))))
(check-sat)
