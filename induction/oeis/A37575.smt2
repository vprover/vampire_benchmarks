(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  g2
  ((x Int) (y Int)) Int (mod y (+ 1 2)))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 (g2 x y) 2))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int) (y Int)) Int y)
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (* 2 (+ (* 2 (+ x x)) x)) (v2 x y)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 2))
(define-fun
  f0
  ((x Int)) Int
  (+ 2 (- (* 2 (+ (* 2 (+ x x)) x)) (mod (div x 2) 2))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v1 c)))))
