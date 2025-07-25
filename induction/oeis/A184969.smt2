(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (div (- (* (+ 1 x) (* (+ 1 (+ 2 (* 2 (+ 2 2)))) (+ 1 x))) 1)
        (+ 1 (+ 2 (+ 2 2))))
      x)
    2))
(define-fun
  f1
  ((x Int)) Int (+ (+ (+ (div (- x 1) (+ 1 (+ 2 (+ 2 2)))) x) x) x))
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
  ((x Int)) Int (u0 (g0 x) 0))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
