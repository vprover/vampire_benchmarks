(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u1 (- x 1) y) x)))
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int)) Int (+ (ite (<= (- x (* 2 (* 2 (+ 2 2)))) 0) 1 0) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (-
        (+
          (+
            (+
              (div
                (div
                  (+
                    (+
                      (div
                        (+
                          (div
                            (+
                              (div (+ (+ (div (+ (+ (mod (v2 x) 2) (div x 2)) 2) (+ 2 2)) 2) x)
                                2)
                              x)
                            (+ 1 2))
                          x)
                        2)
                      x)
                    2)
                  2)
                2)
              2)
            x)
          2)
        x)
      x)
    2))
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
  ((x Int)) Int
  (+
    (-
      (+
        (+
          (+
            (+
              (div
                (div (+ (+ (div (+ (div (+ (div (v0 x) (+ 1 2)) x) 2) x) 2) x) 2)
                  2)
                2)
              x)
            2)
          x)
        2)
      x)
    2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
