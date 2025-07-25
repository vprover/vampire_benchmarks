(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (mod x 2))
(define-fun
  g1
  ((x Int) (y Int)) Int (div (div y 2) 2))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) 0))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int)) Int
  (mod (div (- (* 2 (+ 2 (+ 2 2))) x) (* 2 (+ 2 2))) 2))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) x))
(define-fun
  fast
  ((x Int)) Int (ite (<= (v2 x) 0) 1 0))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (v1 x y) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (mod (v0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
