(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (+ (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  small
  ((x Int)) Int
  (* (+ (div (div x 2) 2) 1) (+ (mod x 2) (mod (div x 2) 2))))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 1 x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (div (+ 2 (w0 x)) (+ 2 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
