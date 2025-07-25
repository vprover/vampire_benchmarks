(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h0
  () Int (+ 2 2))
(define-fun
  g0
  ((x Int) (y Int)) Int (+ y y))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (+
        (+
          (+
            (+ (div (+ 1 (* 2 (- 2 x))) (+ 1 (+ 2 (* 2 (+ 2 2)))))
              (ite (<= x 0) 1 x))
            x)
          x)
        x)
      x)
    x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (div (* y y) (+ x y)) 2))
(define-funs-rec
  ((u0
    ((x Int) (y Int) (z Int)) Int)
   (v0
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z)))
   (ite (<= x 0) z (g0 (u0 (- x 1) y z) (v0 (- x 1) y z)))))
(define-fun
  w0
  ((x Int)) Int (u0 h0 1 x))
(define-fun
  small
  ((x Int)) Int (- (w0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
