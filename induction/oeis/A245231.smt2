(define-fun
  g1
  ((x Int) (y Int)) Int (- y x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+
    (- (ite (<= (mod (+ 1 x) (* 2 (+ 2 2))) 0) 1 0)
      (div (- 0 x) (+ 2 2)))
    x))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (mod x 2) y))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) 1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  small
  ((x Int)) Int (+ (div (+ (v0 x) 1) 2) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
