(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T)))))
(assert (forall ((x9869 T) (x9870 T)) 
  (or (distinct x9869 (f1 x9870)) (distinct x9870 (f3 x9869)))))
(check-sat)
