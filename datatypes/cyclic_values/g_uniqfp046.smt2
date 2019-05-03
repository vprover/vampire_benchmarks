(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T)))))
(assert (exists ((y4877 T) (y4876 T)) 
    (and (= y4876 (f3 y4876)) (= y4877 (f3 y4877)) (distinct y4876 y4877))))
(check-sat)
