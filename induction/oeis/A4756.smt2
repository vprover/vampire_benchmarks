(define-fun
  h2
  ((x Int)) Int (- x (div x 2)))
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
(define-fun
  g3
  ((x Int)) Int (div x (+ 2 2)))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (mod x y) y))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) 0))
(define-fun
  f2
  ((x Int)) Int
  (+
    (-
      (- (* (* (+ 1 (v3 x)) (ite (<= (- x 1) 0) 1 2)) (ite (<= x 0) 1 2))
        x)
      1)
    x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  fast
  ((x Int)) Int (+ (+ (* (+ (v2 x) 1) (+ 1 2)) 1) x))
(define-fun
  f1
  ((x Int) (y Int)) Int (- y (mod y x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  f0
  ((x Int)) Int (+ (v1 x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
