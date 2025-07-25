(define-fun
  h3
  ((x Int)) Int (div x 2))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (div x 2))
(define-fun
  g2
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int)) Int
  (+
    (-
      (+
        (-
          (div (* (+ (* 2 (div (* (+ 2 x) x) (+ 2 2))) x) (+ 2 x)) (+ 1 2))
          x)
        1)
      x)
    x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 1 (h3 x)))
(define-fun
  fast
  ((x Int)) Int (+ (v3 x) x))
(define-fun
  f2
  ((x Int) (y Int)) Int (+ (* (mod y 2) y) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 (g2 x y) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 0))
(define-fun
  f0
  ((x Int)) Int (- (- (+ (* (v1 x) 2) 1) x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
