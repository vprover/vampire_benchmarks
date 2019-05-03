(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T)))))
(assert (exists ((y7180 T) (y7181 T) (y7182 T) (y7179 T) (y7178 T) (y7177 T)) 
  (or 
    (and (= y7177 (f1 y7179)) (= y7179 (f1 y7177)) (= y7178 (f1 y7180)) (= y7180 (f1 y7178)) (distinct y7177 y7178)) 
    (and (= y7181 (f1 y7181)) (= y7182 (f1 y7182)) (distinct y7181 y7182)))))
(check-sat)
