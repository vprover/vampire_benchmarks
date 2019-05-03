(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T)))))
(assert (forall ((x5153 T) (x5154 T) (x5155 T) (x5156 T)) 
  (or (distinct x5153 (f1 x5154)) (distinct x5154 (f1 x5155)) (distinct x5155 (f1 x5156)) (distinct x5156 (f1 x5153)))))
(check-sat)
