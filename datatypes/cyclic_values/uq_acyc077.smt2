(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T) (proj1f3 T))
  (f4 (proj0f4 T)))))
(assert (exists ((y8369 T) (y8368 T) (y8365 T) (y8364 T) (y8366 T) (y8361 T) (y8363 T) (y8362 T) (y8354 T) (y8356 T) (y8357 T) (y8370 T) (y8371 T) (y8358 T) (y8359 T)) (forall ((x8382 T) (x8380 T) (x8379 T) (x8381 T) (x8377 T) (x8374 T) (x8378 T) (x8383 T)) 
  (or 
    (and (= y8354 (f1 x8374)) (= x8374 (f3 y8356 (f4 (f4 (f4 PLACEHOLDER))))) (= y8356 x8378) (= y8357 x8379) (= y8358 (f1 y8354))) 
    (and (= y8359 (f4 x8381)) (= x8381 (f4 y8361)) (= y8361 (f4 y8362)) (= y8362 (f1 y8359))) 
    (and (= y8363 (f2 y8364 (f3 (f1 PLACEHOLDER) (f4 PLACEHOLDER)))) (= y8364 (f1 y8365)) (= y8365 (f2 y8363 PLACEHOLDER))) 
    (and (= y8366 (f3 x8377 (f3 (f1 (f3 PLACEHOLDER PLACEHOLDER)) (f3 PLACEHOLDER PLACEHOLDER)))) (= x8377 (f1 y8368)) (= y8368 (f4 y8369)) (= y8369 x8382)) 
    (and (= y8370 (f1 y8371)) (= y8371 (f1 x8380)) (= x8380 (f2 x8383 PLACEHOLDER)) (= x8383 (f3 y8370 PLACEHOLDER)))))))
(check-sat)