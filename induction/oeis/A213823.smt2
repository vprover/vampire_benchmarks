(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  fast
  ((x Int)) Int
  (div (* (+ 1 x) (+ (* 2 (* 2 (* (+ 2 (+ (+ x x) x)) (+ 1 x)))) x))
    2))
(define-fun
  f0
  ((x Int) (y Int)) Int (* (* 2 (+ x y)) x))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 2 1 x))
(define-fun
  small
  ((x Int)) Int (div (* (+ (w0 x) x) (+ 1 x)) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
