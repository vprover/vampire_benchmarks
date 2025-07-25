(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 y x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y) x)))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int) (y Int)) Int (+ y y))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) 0))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+ (* 2 (- (div (* (+ 1 x) (* (+ 2 x) x)) (+ 1 2)) (mod x 2))) 1))
(define-fun
  f0
  ((x Int) (y Int)) Int (- (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
