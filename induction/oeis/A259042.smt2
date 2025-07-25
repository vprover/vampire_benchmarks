(define-fun
  i0
  ((x Int)) Int (mod x 2))
(define-fun
  h0
  ((x Int)) Int (div x 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (ite
    (<= (mod x (+ 2 2)) 0) (ite (<= (mod x (* 2 (+ 2 2))) 0) 0 2) 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (- 2 y))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) (i0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (w0 c) (fast c)))))
