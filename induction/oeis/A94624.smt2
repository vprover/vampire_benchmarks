(define-fun-rec
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v2 (- x 1) y z)))
(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  j2
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  h2
  ((x Int)) Int (div x 2))
(define-fun
  h1
  () Int (+ 2 (* 2 (+ 2 2))))
(define-fun
  h0
  () Int (div 1 2))
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int) (y Int)) Int (mod y 2))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) h1))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int) (y Int)) Int (+ 2 (* x y)))
(define-fun-rec
  u2
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f2 (u2 (- x 1) y z) (v2 (- x 1) y z))))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) 1 j2))
(define-fun
  fast
  ((x Int)) Int (+ (- (w2 x) 1) (mod x 2)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* (v1 x y) x) 1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x h0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
