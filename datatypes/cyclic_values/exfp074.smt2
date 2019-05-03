(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T)))))
(assert (forall ((x7970 T) (x7969 T) (x7968 T) (x7967 T)) 
  (or (distinct x7967 (f1 x7968 x7967 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (distinct x7968 (f3 x7969)) (distinct x7969 (f3 x7970)) (distinct x7970 (f2 x7967 PLACEHOLDER PLACEHOLDER)))))
(check-sat)
