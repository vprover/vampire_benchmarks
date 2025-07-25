(define-fun-rec
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z (v0 (- x 1) y z)))
(define-fun
  j0
  ((x Int)) Int x)
(define-fun
  h0
  () Int (+ 2 2))
(define-fun
  g0
  ((x Int) (y Int)) Int y)
(define-fun
  fast
  ((x Int)) Int
  (div
    (+
      (+
        (div (+ (div (+ 1 (+ (div (- 2 x) (* 2 (+ 2 2))) x)) (+ 2 2)) 1) 2)
        1)
      x)
    (+ 2 2)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ (div (+ x y) (+ 2 2)) 2) y))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (f0 (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  w0
  ((x Int)) Int (u0 h0 1 x))
(define-fun
  small
  ((x Int)) Int (div (div (w0 x) 2) (+ 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
