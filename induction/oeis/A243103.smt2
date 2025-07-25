(define-fun
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 (mod x y) y))
(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (mod x y) y))
(define-fun
  h3
  ((x Int) (y Int)) Int y)
(define-fun
  h2
  ((x Int)) Int (+ 1 x))
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
(define-fun
  g2
  ((x Int)) Int (- x 1))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int) (y Int)) Int (* (v3 x y) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) (h2 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v2 c)))))
