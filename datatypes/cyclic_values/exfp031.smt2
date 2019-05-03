(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (forall ((x3433 T) (x3435 T) (x3434 T) (x3436 T)) 
  (or (distinct x3433 (f1 x3434)) (distinct x3434 (f1 x3435)) (distinct x3435 (f1 x3436)) (distinct x3436 (f1 x3433)))))
(check-sat)
