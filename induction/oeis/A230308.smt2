(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (div (u1 (- x 1) y) x)))
(define-fun
  h1
  ((x Int)) Int (+ 1 x))
(define-fun
  g1
  () Int (+ 2 2))
(define-fun
  v1
  ((x Int)) Int (u1 g1 (h1 x)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+ 2 (+ (div (+ 1 x) (- (* 2 (* 2 (+ 2 (+ 2 2)))) 1)) x)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ (v1 x) 2) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
