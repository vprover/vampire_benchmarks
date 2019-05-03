(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T))
  (f3 (proj0f3 T))
  (f4 (proj0f4 T)))))
(assert (forall ((x7176 T)) (distinct x7176 (f4 (f3 (f2 (f2 (f3 x7176) (f4 PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER)) (f4 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f4 x7176) (f1 (f3 PLACEHOLDER) (f3 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER))))))))
(check-sat)
