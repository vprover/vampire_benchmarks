(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T))
  (f4 (proj0f4 T)))))
(assert (exists ((y3377 T) (y3376 T) (y3375 T) (y3374 T) (y3388 T) (y3389 T) (y3386 T) (y3387 T) (y3384 T) (y3385 T) (y3382 T) (y3383 T) (y3380 T) (y3381 T) (y3379 T) (y3378 T)) 
  (or 
    (and (= y3374 (f1 y3375 (f4 PLACEHOLDER) (f1 y3374 y3374 PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y3375 (f4 y3376)) (= y3376 (f1 y3374 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) 
    (and (= y3377 (f2 y3378 (f2 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER)))) (= y3378 (f4 y3379)) (= y3379 (f4 y3380)) (= y3380 (f2 y3377 PLACEHOLDER))) 
    (and (= y3381 (f3 y3382 (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y3382 (f3 y3383 (f2 PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y3383 (f2 y3381 PLACEHOLDER))) 
    (and (= y3384 (f3 y3385 (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y3385 (f4 y3384))) (= y3386 (f4 y3386)) 
    (and (= y3387 (f2 y3388 PLACEHOLDER)) (= y3388 (f3 y3389 (f4 PLACEHOLDER) (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y3389 (f4 y3387))))))
(check-sat)
