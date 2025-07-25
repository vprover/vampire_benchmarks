(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (div (div x 2) 2))
(define-fun
  g0
  ((x Int) (y Int)) Int (- y 1))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (+ (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 x))
(define-fun
  small
  ((x Int)) Int (+ (w0 x) x))
(define-fun
  fast
  ((x Int)) Int
  (div (* (+ 2 (+ (- x (div x (+ 2 2))) x)) (+ 1 (div x (+ 2 2))))
    2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
