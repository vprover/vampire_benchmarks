(define-fun
  small
  ((x Int)) Int (+ (div (+ (- x (div (* x x) 2)) x) (+ 2 x)) x))
(define-fun
  fast
  ((x Int)) Int (+ (+ (div (- (* (- 2 x) x) 2) (* 2 (+ 2 x))) 1) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
