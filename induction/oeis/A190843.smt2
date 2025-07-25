(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (mod
    (div
      (+
        (-
          (div (+ 1 (+ (div x (+ 1 (+ 2 (+ 2 2)))) x)) (+ 1 (* 2 (+ 2 2))))
          1)
        x)
      2)
    2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ 2 (+ (* x y) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  small
  ((x Int)) Int (mod (+ (div (v0 x) (v1 x)) (ite (<= x 0) 1 2)) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
