(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T) (proj1f3 T))
  (f4 (proj0f4 T) (proj1f4 T)))))
(assert (exists ((y6370 T) (y6371 T) (y6372 T) (y6373 T) (y6368 T) (y6369 T) (y6357 T) (y6358 T) (y6359 T) (y6363 T) (y6362 T) (y6361 T) (y6360 T) (y6367 T) (y6366 T) (y6365 T) (y6364 T)) 
  (or (= y6357 (f1 (f3 (f1 y6357 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f1 PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER) PLACEHOLDER (f2 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER)))) (= y6358 (f4 y6358 PLACEHOLDER)) 
    (and (= y6359 (f4 (f2 (f3 (f4 y6360 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f3 PLACEHOLDER (f4 PLACEHOLDER PLACEHOLDER))) (f1 (f4 PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER)) PLACEHOLDER (f4 (f4 PLACEHOLDER PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER)) (f2 (f4 PLACEHOLDER PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (f4 PLACEHOLDER PLACEHOLDER))) (= y6360 (f1 y6359 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y6361 (f1 (f3 y6361 PLACEHOLDER) PLACEHOLDER PLACEHOLDER PLACEHOLDER)) 
    (and (= y6362 (f2 (f1 (f1 y6362 PLACEHOLDER PLACEHOLDER PLACEHOLDER) y6363 PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y6363 (f1 y6362 y6362 PLACEHOLDER PLACEHOLDER))) 
    (and (= y6364 (f1 y6365 (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER PLACEHOLDER)) (= y6365 (f3 y6364 PLACEHOLDER))) 
    (and (= y6366 (f2 y6367 (f2 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER)))) (= y6367 (f4 y6368 PLACEHOLDER)) (= y6368 (f3 y6366 PLACEHOLDER))) 
    (and (= y6369 (f1 y6370 (f4 (f3 y6369 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f3 PLACEHOLDER (f3 (f4 PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (f4 (f1 (f4 PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER (f3 PLACEHOLDER PLACEHOLDER)) (f3 PLACEHOLDER PLACEHOLDER)))) (= y6370 (f3 y6371 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y6371 (f3 y6372 PLACEHOLDER)) (= y6372 (f3 y6369 PLACEHOLDER))) (= y6373 (f1 y6373 PLACEHOLDER y6373 PLACEHOLDER)))))
(check-sat)
