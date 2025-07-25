(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  () Int (+ 2 2))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 g1 y))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+ 1 (* (- (* 2 (* 2 (+ 2 (+ 2 2)))) 1) (div (+ (* x x) x) 2))))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (- (v1 x y) y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
