(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int) (y Int)) Int (+ (* y 2) y))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int
  (div (+ (+ (div (* (+ (- (div (+ (v0 x) x) 2) 1) x) x) 2) 1) x)
    (+ 1 2)))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (div
    (+
      (div
        (*
          (+
            (+ (div (* (+ 1 (* (+ 1 2) (div (+ (* x x) x) 2))) (+ 1 x)) 2) 1)
            x)
          x)
        (+ 1 2))
      1)
    2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
