(define-fun
  small
  ((x Int)) Int
  (- (* (+ (div (- x (mod x (+ 2 (mod x 2)))) 2) 2) 2) x))
(define-fun
  fast
  ((x Int)) Int
  (+ (- (ite (<= (mod (+ 1 x) (+ 2 (+ 2 2))) 0) 0 2) (mod x 2)) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
