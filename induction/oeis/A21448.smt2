(define-fun
  g1
  ((x Int)) Int (mod (- (- x 1) 1) (+ 1 2)))
(define-fun
  g0
  ((x Int)) Int (- x 1))
(define-fun
  f1
  ((x Int) (y Int)) Int (* y y))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  fast
  ((x Int)) Int (mod (- 1 x) (+ (v1 x) x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* (ite (<= (mod y (+ 1 2)) 0) x 1) 2) 2))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(define-fun
  small
  ((x Int)) Int (div (v0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
