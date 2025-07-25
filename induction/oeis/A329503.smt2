(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int) (y Int)) Int (+ (div y x) y))
(define-fun
  fast
  ((x Int)) Int
  (*
    (div (* (+ 1 (+ (+ (+ (mod x 2) x) x) x)) (ite (<= (- x 1) 0) 1 2))
      (+ 1 x))
    (ite (<= x 0) 1 2)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ y y))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
