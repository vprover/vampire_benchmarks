(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T))
  (f4 (proj0f4 T)))))
(assert (exists ((y3218 T) (y3219 T) (y3223 T) (y3222 T) (y3225 T) (y3224 T) (y3220 T) (y3226 T) (y3215 T) (y3216 T) (y3217 T) (y3221 T)) 
  (or 
    (and (= y3215 (f4 (f2 y3217))) (= y3217 (f1 y3215)) (= y3216 (f4 y3218)) (= y3218 (f2 y3219)) (= y3219 (f1 y3216)) (distinct y3215 y3216)) 
    (and (= y3220 (f1 (f3 y3220 PLACEHOLDER y3220 PLACEHOLDER))) (= y3221 (f1 y3222)) (= y3222 (f3 y3221 PLACEHOLDER y3221 PLACEHOLDER)) (distinct y3220 y3221)) 
    (and (= y3223 (f1 y3223)) (= y3224 (f1 y3224)) (distinct y3223 y3224)) 
    (and (= y3225 (f1 y3225)) (= y3226 (f1 y3226)) (distinct y3225 y3226)))))
(check-sat)
