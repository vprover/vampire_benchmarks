(define-fun-rec
  v3
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v3 (- x 1) y z)))
(define-fun
  j3
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  h4
  ((x Int)) Int (mod x 2))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int)) Int (mod x 2))
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int)) Int (mod x 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f4
  ((x Int)) Int (+ 1 (* x (+ 2 2))))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) (h4 x)))
(define-fun
  f3
  ((x Int) (y Int)) Int (+ 1 (* x y)))
(define-fun-rec
  u3
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f3 (u3 (- x 1) y z) (v3 (- x 1) y z))))
(define-fun
  w3
  ((x Int)) Int (u3 x 1 j3))
(define-fun
  fast
  ((x Int)) Int (- (w3 x) (* (v4 x) 2)))
(define-fun
  f2
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  () Int (u2 2 2))
(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y v2))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  f0
  ((x Int)) Int (+ 1 (* 2 (+ (* 2 (+ x x)) x))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (+ (- (v0 x) (v1 x)) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
