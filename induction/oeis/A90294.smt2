(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int (+ 2 y))
(define-fun
  g0
  ((x Int)) Int (+ x x))
(define-fun
  fast
  ((x Int)) Int
  (-
    (div (* (+ 1 (+ x x)) (+ (* (+ 1 (+ 2 (+ 2 x))) (* (+ 2 x) 2)) 1))
      (+ 1 2))
    2))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ 2 (+ x y)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(define-fun
  small
  ((x Int)) Int (+ (+ 1 2) (v0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
