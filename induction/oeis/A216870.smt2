(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y 2))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  () Int (+ 1 2))
(define-fun
  fast
  ((x Int)) Int
  (+ 1 (* 2 (* 2 (* 2 (* (+ 1 2) (+ 2 (+ (* 2 (+ x x)) x))))))))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ 1 (* (v1 x y) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 g0 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
