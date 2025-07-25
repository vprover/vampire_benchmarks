(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int (+ (- y (- x (mod (mod y (+ 1 2)) 2))) y))
(define-funs-rec
  ((v0
    ((x Int) (y Int) (z Int)) Int)
   (u0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) y (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 2))
(define-fun
  small
  ((x Int)) Int (+ (w0 x) 2))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (div (+ 2 (* (+ 1 2) (+ 1 (div (+ (* x x) x) 2))))
        (+ 1 (+ 2 (+ 2 2))))
      1)
    2))
(define-fun
  f0
  ((x Int) (y Int)) Int y)
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
