(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (* (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  j2
  () Int (+ 1 (+ 2 2)))
(define-fun
  w2
  ((x Int)) Int (u2 x 1 j2))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int (+ 2 x))
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  f3
  ((x Int)) Int (+ 1 (* x x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  () Int (u3 2 2))
(define-fun
  f1
  ((x Int)) Int (div (- (* (+ 1 (+ 2 (* 2 (+ 2 2)))) (w2 x)) 1) v3))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(define-fun
  fast
  ((x Int)) Int (div (div (v1 x) 2) 2))
(define-fun
  f0
  ((x Int)) Int (+ (* 2 (+ (- x (mod x (+ 1 (+ 2 2)))) x)) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(define-fun
  small
  ((x Int)) Int (- (div (v0 x) 2) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
