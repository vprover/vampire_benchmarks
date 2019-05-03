(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T)))))
(assert (exists ((y6095 T) (y6094 T)) 
    (and (= y6094 (f1 y6094)) (= y6095 (f1 y6095)) (distinct y6094 y6095))))
(check-sat)
