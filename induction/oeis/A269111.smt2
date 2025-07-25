(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u2 (- x 1) y) x)))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (- (* 2 (+ 2 2)) x))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 0))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  () Int (+ 1 2))
(define-fun
  fast
  ((x Int)) Int (+ (mod (v2 x) (+ 1 2)) 2))
(define-fun
  f1
  ((x Int) (y Int)) Int (- y x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 g0 x))
(define-fun
  small
  ((x Int)) Int (+ (ite (<= (v0 x) 0) 1 0) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
