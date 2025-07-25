(define-fun
  i0
  ((x Int)) Int x)
(define-fun
  h0
  () Int (+ 2 (+ 2 2)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (+
        (+
          (+
            (+ (+ (div (+ (- 2 (div (- 0 (div x 2)) (+ 2 2))) x) (+ 2 2)) x) 2)
            x)
          x)
        x)
      x)
    x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ x x) y))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (u0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 h0 x 1))
(define-fun
  small
  ((x Int)) Int
  (+ (div (+ (div (div (div (div (w0 x) 2) 2) 2) 2) 1) 2) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
