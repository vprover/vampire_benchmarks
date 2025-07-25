(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  h1
  () Int (+ 1 2))
(define-fun
  v1
  ((x Int)) Int (u1 x h1))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (- 1
        (div (- x (div x (+ 1 (* 2 (* 2 (* 2 (+ 2 (+ 2 2)))))))) (+ 2 2)))
      x)
    x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (* (+ (mod y 2) x) y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 2))
(define-fun
  small
  ((x Int)) Int (div (* (v0 x) 2) (v1 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
