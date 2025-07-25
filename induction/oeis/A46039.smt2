(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+ 2 (+ (ite (<= (+ 2 (- (* 2 (+ 2 (+ 2 2))) x)) 0) 2 0) x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (- (div x 2) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int (+ (+ (ite (<= (v0 x) 0) 0 2) 2) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
