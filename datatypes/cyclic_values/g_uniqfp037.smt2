(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T)))))
(assert (exists ((y3979 T) (y3978 T) (y3980 T) (y3975 T) (y3977 T) (y3976 T)) 
  (or 
    (and (= y3975 (f3 (f2 (f3 (f2 (f3 y3975 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER)) y3975 PLACEHOLDER) (f3 (f2 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER)) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 (f2 (f1 PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f1 (f1 PLACEHOLDER)))) (= y3976 (f3 (f2 (f3 (f2 (f3 y3976 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER)) y3976 PLACEHOLDER) (f3 (f2 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) PLACEHOLDER (f1 PLACEHOLDER)) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 (f2 (f1 PLACEHOLDER) PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (f1 (f1 PLACEHOLDER)))) (distinct y3975 y3976)) 
    (and (= y3977 (f3 y3979 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y3979 (f2 y3977 PLACEHOLDER PLACEHOLDER)) (= y3978 (f3 y3980 (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y3980 (f2 y3978 PLACEHOLDER PLACEHOLDER)) (distinct y3977 y3978)))))
(check-sat)
