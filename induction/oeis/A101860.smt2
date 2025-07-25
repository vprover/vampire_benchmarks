(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u2 (- x 1) y) x)))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g2
  () Int (+ 2 2))
(define-fun
  v2
  ((x Int)) Int (u2 g2 x))
(define-fun
  g1
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (-
    (+ (+ 1 (* (+ (* (+ 2 x) x) x) (+ 2 (+ 2 2))))
      (div (- (* (* x x) x) x) (+ 2 (+ 2 2))))
    x))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (v2 x) y))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
