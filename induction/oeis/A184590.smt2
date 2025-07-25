(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u0 (- x 1) y) x)))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (+ 2 x))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (div
        (+
          (div (+ (+ (div (+ 2 (+ (div x (+ 2 2)) x)) (+ 2 2)) x) 2)
            (* 2 (+ 2 2)))
          x)
        2)
      2)
    x))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ 1 (+ (* x y) x)))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  small
  ((x Int)) Int (+ (+ (div (- (v0 x) 1) (v1 x)) 1) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
