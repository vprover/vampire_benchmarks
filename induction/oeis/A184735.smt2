(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (+
        (div
          (div
            (+
              (+ (div (+ (div (+ 1 (div (- 2 x) (+ (* 2 (+ 2 2)) 1))) 2) x) 2) x)
              x)
            2)
          2)
        x)
      2)
    x))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (div (* y y) (+ 2 x)) (* y (+ 2 2))))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  small
  ((x Int)) Int (+ (div (+ (v0 x) x) 2) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
