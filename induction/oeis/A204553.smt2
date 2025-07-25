(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
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
              (div
                (+
                  (+
                    (-
                      (+
                        (div
                          (+ (+ (div (div (* (+ (div x 2) x) (div x (+ 2 2))) 2) 2) 1) x)
                          2)
                        1)
                      x)
                    x)
                  x)
                2)
              1)
            x)
          x)
        x)
      (+ (* (+ 2 1) 2) x))
    1))
(define-fun
  f0
  ((x Int) (y Int)) Int (div (u1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(define-fun
  small
  ((x Int)) Int (+ 1 (div (v0 x) (+ 2 2))))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
