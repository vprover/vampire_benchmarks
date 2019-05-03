(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T)))))
(assert (exists ((y7974 T) (y7971 T) (y7973 T) (y7972 T)) 
    (and (= y7971 (f1 y7973)) (= y7973 (f1 y7971)) (= y7972 (f1 y7974)) (= y7974 (f1 y7972)) (distinct y7971 y7972))))
(check-sat)
