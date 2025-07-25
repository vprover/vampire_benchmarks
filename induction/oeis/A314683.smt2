(define-fun
  h0
  () Int (+ 2 1))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (+
        (+ (div (+ (mod (+ 1 (* (* x x) x)) (+ 2 2)) x) (+ 1 2))
          (ite (<= x 0) 1 x))
        x)
      x)
    x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (mod x 2) y))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x h0))
(define-fun
  small
  ((x Int)) Int
  (+ (+ (+ (+ (div (+ (* (div (v0 x) 2) 2) 1) (+ 1 2)) x) x) x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
