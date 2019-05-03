(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T)))))
(assert (forall ((x9552 T)) (distinct x9552 (f2 x9552))))
(check-sat)
