(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T) (proj3f3 T))
  (f4 (proj0f4 T)))))
(assert (exists ((y378 T) (y365 T) (y368 T) (y369 T) (y371 T) (y367 T) (y373 T) (y372 T) (y375 T) (y363 T) (y374 T) (y366 T) (y370 T) (y376 T) (y364 T)) (forall ((x390 T) (x389 T) (x388 T) (x386 T) (x383 T) (x382 T) (x381 T)) 
  (or 
    (and (= y363 (f4 y365)) (= y365 (f2 y366 PLACEHOLDER PLACEHOLDER)) (= y366 (f3 y363 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (= y364 (f4 y367)) (= y367 (f2 y368 PLACEHOLDER PLACEHOLDER)) (= y368 (f3 y364 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (distinct y363 y364)) 
    (and (= y369 (f1 y371 (f1 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y371 (f4 y372)) (= y372 x381) (= y373 (f1 y374 (f4 PLACEHOLDER))) (= y374 (f4 y369)) (= y370 (f1 y375 (f1 PLACEHOLDER (f2 PLACEHOLDER PLACEHOLDER PLACEHOLDER)))) (= y375 (f4 y376)) (= y376 (f2 x383 (f1 (f1 PLACEHOLDER PLACEHOLDER) PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= x383 x389) (= y378 (f4 y370)) (distinct y369 y370)) 
    (and (= x388 x382) (= x386 x390) (distinct x388 x386))))))
(check-sat)
