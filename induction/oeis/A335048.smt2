(define-fun
  h0
  ((x Int)) Int (mod x 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (+ (+ (- 2 (ite (<= x 0) 2 (mod x 2))) (* x x)) x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (+ y (ite (<= x 0) 2 x)) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
