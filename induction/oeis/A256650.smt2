(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
(define-fun
  g0
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  fast
  ((x Int)) Int
  (+ (div (* (+ 1 x) (- (* 2 (* 2 (* x x))) x)) (+ 2 (+ 2 2)))
    (* 2 (* 2 (- (* (* x x) x) x)))))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ (* 2 (* (- y 2) y)) x) y))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) 0 x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
