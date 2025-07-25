(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (- (u1 (- x 1) y) x)))
(define-fun
  g1
  ((x Int) (y Int)) Int (+ 2 y))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) (- x y)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 2))
(define-fun
  small
  ((x Int)) Int (- 1 (v0 x)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+
    (+ (- (* 2 (* (+ 2 x) x)) 1)
      (div (- (* (* x x) x) x) (+ 2 (+ 2 2))))
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
