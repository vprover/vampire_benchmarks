(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  j2
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  w2
  ((x Int)) Int (u2 x 1 j2))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int)) Int (+ (div x (+ 1 (* 2 (+ 2 2)))) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (w2 x)))
(define-fun
  fast
  ((x Int)) Int (+ (+ (v1 x) 1) x))
(define-fun
  f0
  ((x Int)) Int (* 2 (+ (* 2 (+ (- x 2) x)) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 2))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
