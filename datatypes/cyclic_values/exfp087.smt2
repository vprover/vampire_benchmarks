(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T)))))
(assert (forall ((x9334 T) (x9335 T) (x9331 T) (x9332 T) (x9333 T)) 
  (or (distinct x9331 (f1 x9332)) (distinct x9332 (f2 x9333)) (distinct x9333 (f1 x9334)) (distinct x9334 (f1 x9335)) (distinct x9335 (f3 x9331)))))
(check-sat)
