(define-fun
  h3
  () Int (+ 1 2))
(define-fun
  h2
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int) (y Int)) Int y)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int) (y Int)) Int (+ (div (+ (* 2 (+ (+ x x) x)) x) y) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 y 1))
(define-fun
  f3
  ((x Int) (y Int)) Int (* (+ (v4 x y) x) 2))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x h3))
(define-fun
  fast
  ((x Int)) Int (div (+ (v3 x) 1) 2))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ 2 (+ x y)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 2 y))
(define-fun
  f1
  ((x Int) (y Int)) Int (div (* (v2 x y) x) y))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* (+ (v1 x y) x) 2) 1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 2))
(define-fun
  small
  ((x Int)) Int (+ (div (v0 x) 2) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
