(define-fun
  small
  ((x Int)) Int (+ (* (+ 2 x) x) (mod (- x 2) (+ (+ 1 2) x))))
(define-fun
  fast
  ((x Int)) Int
  (- (* (+ 1 (+ 2 x)) (+ (ite (<= (- 2 x) 0) 0 1) x)) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
