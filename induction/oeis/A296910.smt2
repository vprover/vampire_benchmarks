(define-fun
  h0
  ((x Int)) Int (- x 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+
    (* (- (* 2 (+ (mod x 2) x)) (ite (<= x 0) 1 2))
      (ite (<= (- x 1) 0) 1 2))
    2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ 2 y))
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
  ((x Int)) Int (* (+ (w0 x) x) (ite (<= x 0) 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
