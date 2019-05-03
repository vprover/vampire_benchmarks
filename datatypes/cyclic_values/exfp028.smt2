(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T)))))
(assert (forall ((x3078 T) (x3077 T)) 
  (or (distinct x3077 (f2 (f2 x3077 PLACEHOLDER PLACEHOLDER) x3078 (f1 PLACEHOLDER))) (distinct x3078 (f1 x3077)))))
(check-sat)
