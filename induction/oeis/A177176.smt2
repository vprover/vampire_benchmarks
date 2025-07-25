(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 y x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int (+ x x))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  fast
  ((x Int)) Int
  (div
    (+
      (div (* (+ 1 (+ x x)) (+ (* x x) x))
        (- (* 2 (* 2 (+ 2 (* 2 (+ 2 2))))) 1))
      1)
    2))
(define-fun
  f2
  ((x Int)) Int (+ (* x x) 1))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  () Int (u2 2 2))
(define-fun
  small
  ((x Int)) Int (div (+ (div (v0 x) v2) 1) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
