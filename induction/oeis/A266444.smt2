(define-fun
  h1
  () Int (+ 1 (+ 2 2)))
(define-fun
  g1
  ((x Int)) Int (div x 2))
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  fast
  ((x Int)) Int
  (mod
    (+
      (div
        (+ (* (- (* (ite (<= (mod (+ 1 x) (+ 2 2)) 0) 2 1) 2) x) (+ 1 2))
          x)
        (+ 2 x))
      x)
    2))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ 2 y))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) h1))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (div (+ x y) (v1 x)) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 0))
(define-fun
  small
  ((x Int)) Int (mod (v0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
