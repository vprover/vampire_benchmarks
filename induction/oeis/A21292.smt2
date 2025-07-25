(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  j0
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 j0))
(define-fun
  small
  ((x Int)) Int
  (mod (div (+ (div (w0 x) (* 2 (* 2 (+ 2 2)))) 1) 2)
    (+ 1 (* 2 (+ 2 2)))))
(define-fun
  h1
  () Int (+ 2 (+ 2 2)))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  f2
  ((x Int) (y Int)) Int (* 2 y))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  f1
  ((x Int)) Int (* x x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  () Int (u1 1 h1))
(define-fun
  fast
  ((x Int)) Int
  (mod (* (+ (div (+ (div (+ v1 x) (+ 1 x)) x) (+ 1 x)) 1) (+ x 1))
    (v2 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
