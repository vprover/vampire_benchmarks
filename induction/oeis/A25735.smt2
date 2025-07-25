(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (div
    (+
      (+
        (+
          (div (* (+ 1 (+ 2 (+ x x))) (+ 1 (* 2 (+ 2 x))))
            (+ 1 (+ 2 (* 2 (+ 2 2)))))
          1)
        (* x x))
      x)
    2))
(define-fun
  f2
  ((x Int)) Int (+ 1 (+ x x)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  () Int (u2 2 2))
(define-fun
  f1
  ((x Int)) Int (+ (div (* 2 (+ x x)) v2) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
