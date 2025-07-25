(define-fun
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun
  i0
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int (mod x 2))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 2))
(define-fun
  g2
  ((x Int)) Int (div x 2))
(define-fun
  g0
  ((x Int) (y Int)) Int (+ (+ (mod x 2) y) y))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x x 1))
(define-fun
  f2
  ((x Int)) Int (+ x x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  f1
  ((x Int)) Int (* x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (v2 x)))
(define-fun
  fast
  ((x Int)) Int (div (- (* 2 (v1 x)) 1) (+ 1 (v3 x))))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
