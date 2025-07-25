(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u2 (- x 1) y) x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (mod (v0 x) (+ 1 (v1 x))))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (- x 1))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 1))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (mod (* (v2 x) x) (div (* (+ 1 x) (+ 2 x)) 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
