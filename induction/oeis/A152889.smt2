(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (- (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (mod (* (+ 1 x) (v0 x)) (+ 1 (+ 2 2))))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (mod (* (+ (- x 1) x) (- (* x x) 1)) (+ 1 (+ 2 2))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
