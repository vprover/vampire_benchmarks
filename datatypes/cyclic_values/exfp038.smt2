(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T)))))
(assert (forall ((x4085 T) (x4084 T)) 
  (or (distinct x4084 (f1 x4085 (f2 PLACEHOLDER))) (distinct x4085 (f1 x4084 PLACEHOLDER)))))
(check-sat)
