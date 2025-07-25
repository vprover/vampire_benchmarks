(define-fun
  small
  ((x Int)) Int (+ (- (* 2 (* (+ 2 x) x)) (div x 2)) (mod x 2)))
(define-fun
  fast
  ((x Int)) Int (+ (* 2 (+ (* x x) x)) (* (+ 1 2) (div (+ 1 x) 2))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
