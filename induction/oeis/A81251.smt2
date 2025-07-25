(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  j2
  () Int (+ 1 (* 2 (+ 2 2))))
(define-fun
  h2
  ((x Int)) Int (div x 2))
(define-fun
  g3
  ((x Int)) Int (mod x 2))
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int (+ 2 x))
(define-fun
  f3
  () Int (+ 1 2))
(define-fun
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y f3))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 1))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) (v3 x) j2))
(define-fun
  f1
  ((x Int)) Int (+ (+ (div x (+ 2 2)) x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (w2 x)))
(define-fun
  f0
  ((x Int)) Int (+ (+ x x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  small
  ((x Int)) Int (div (div (v0 x) 2) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (v1 c)))))
