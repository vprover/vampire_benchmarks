(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int (div (+ (* x x) x) 2))
(define-fun
  h0
  ((x Int)) Int (+ (* x x) x))
(define-fun
  g2
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  f2
  ((x Int)) Int (div x 2))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(define-fun
  f0
  ((x Int)) Int (div x (- 2 (mod x 2))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v1 c)))))
