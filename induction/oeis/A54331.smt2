(define-fun
  h1
  ((x Int)) Int (+ x x))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (+ x x))
(define-fun
  f2
  ((x Int) (y Int)) Int (* 2 (+ (* 2 (* 2 (* 2 (div x y)))) x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  f1
  ((x Int)) Int (div (v2 x) (+ 1 x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int
  (div (* 2 (* (+ (* 2 (+ 2 2)) y) x)) (+ 1 y)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v1 c)))))
