(define-fun
  small
  ((x Int)) Int (mod (+ (mod (- 1 x) (+ 2 (div x 2))) x) 2))
(define-fun
  h0
  ((x Int)) Int (- (* 2 (+ 2 2)) x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (div (+ (+ x x) x) y) y))
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
  fast
  ((x Int)) Int (mod (w0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
