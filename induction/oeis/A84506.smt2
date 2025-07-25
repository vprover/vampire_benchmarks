(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+
    (div
      (+
        (+
          (-
            (+
              (+
                (* (+ (+ (* (div (div (- (ite (<= x 0) 1 x) 1) 2) (+ 2 2)) 2) 1) x)
                  2)
                x)
              1)
            x)
          x)
        x)
      (+ (+ 2 x) 2))
    1))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (div x (+ 2 y)) y))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (u1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
