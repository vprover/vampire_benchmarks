(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T)))))
(assert (forall ((x5842 T)) (distinct x5842 (f2 (f2 (f1 x5842))))))
(check-sat)
