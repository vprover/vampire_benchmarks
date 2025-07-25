(define-fun
  h1
  ((x Int)) Int (+ x x))
(define-fun
  g0
  ((x Int)) Int (* 2 (+ x x)))
(define-fun
  f1
  ((x Int)) Int
  (+
    (+ (div (* (+ 1 2) (+ 1 (+ x x))) (+ 1 (+ 2 (+ 2 2))))
      (ite (<= x 0) 1 x))
    x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 1 (h1 x)))
(define-fun
  f0
  ((x Int) (y Int)) Int
  (+ (div (- y (div (div x 2) (+ 1 (+ 2 2)))) 2) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v1 c)))))
