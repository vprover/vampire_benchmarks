(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (- 0 x))
(define-fun
  fast
  ((x Int)) Int
  (ite (<= (- (mod (* 2 (- x 2)) (+ 1 (+ 2 (+ 2 2)))) 1) 0) 1 2))
(define-fun
  f0
  ((x Int) (y Int)) Int (- y (div x 2)))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 x 1 1))
(define-fun
  small
  ((x Int)) Int (+ (div (w0 x) 2) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
