(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 2))
(define-fun
  g0
  ((x Int)) Int (- x 2))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (+
        (+ (div (+ (+ (div (+ (v1 x) x) 2) x) x) (+ 1 2))
          (ite (<= x 0) 1 x))
        x)
      x)
    x))
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(define-fun
  f0
  ((x Int)) Int (+ 1 (+ (mod (div x 2) 2) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) x))
(define-fun
  small
  ((x Int)) Int
  (+ (+ (+ (+ (+ (div (+ (v0 x) x) (+ 2 2)) 1) x) x) x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
