(define-fun
  v2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 0))
(define-fun
  u2
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) y (v2 (- x 1) y z)))
(define-fun
  i2
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (- x 2))
(define-fun
  w2
  ((x Int)) Int (u2 (h2 x) x 2))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (+ (* (+ (- x (w2 x)) x) 2) 1))
(define-fun
  f2
  ((x Int) (y Int)) Int y)
(define-fun
  f1
  ((x Int) (y Int)) Int (mod (+ 1 (+ 2 x)) (- y x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 2))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (v1 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (u0 c) (fast c)))))
