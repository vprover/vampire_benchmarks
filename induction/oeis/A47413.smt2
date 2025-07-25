(define-fun
  h0
  ((x Int)) Int (+ x x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+ (+ 1 (* 2 (+ (div x (+ 1 2)) x)))
    (ite (<= (mod x (+ 1 2)) 0) 2 1)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ x (mod (- y 1) (+ 2 2))))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 2))
(define-fun
  small
  ((x Int)) Int (+ 2 (w0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
