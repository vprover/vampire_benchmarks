(define-fun
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h3
  () Int (* 2 (+ 2 2)))
(define-fun
  h2
  ((x Int)) Int (+ 1 x))
(define-fun
  h1
  () Int (* 2 (+ 2 2)))
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
(define-fun
  g3
  ((x Int)) Int (mod x (* 2 (+ 2 2))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) h3))
(define-fun
  g2
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  g1
  ((x Int)) Int (mod x (* 2 (+ 2 2))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) h1))
(define-fun
  f2
  ((x Int)) Int (div x (v3 x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) (h2 x)))
(define-fun
  fast
  ((x Int)) Int (mod (v2 x) (* 2 (+ 2 2))))
(define-fun
  f0
  ((x Int)) Int (div x (v1 x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 (h0 x)))
(define-fun
  small
  ((x Int)) Int (mod (v0 x) (* 2 (+ 2 2))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
