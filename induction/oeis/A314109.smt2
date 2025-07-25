(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int (mod x 2))
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (mod x 2))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f5
  ((x Int)) Int (div (+ 1 (+ 2 x)) (+ 1 (+ 2 (+ 2 2)))))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) x))
(define-fun
  f4
  ((x Int)) Int (+ (+ (mod (v5 x) 2) 1) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
(define-fun
  f3
  ((x Int)) Int (- (- (v4 x) x) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 2 x))
(define-fun
  fast
  ((x Int)) Int
  (+
    (div
      (+
        (+
          (*
            (+
              (+ (+ (div (+ (+ (* (+ (+ (+ (v3 x) 1) x) x) 2) 1) x) (+ 1 2)) x)
                x)
              x)
            2)
          1)
        x)
      (+ 1 2))
    x))
(define-fun
  f2
  ((x Int)) Int (- (mod (+ 1 (+ 2 x)) (+ 1 (+ 2 (+ 2 2)))) 2))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) x))
(define-fun
  f1
  ((x Int)) Int (+ (+ (mod (v2 x) 2) 1) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  f0
  ((x Int)) Int (- (- (v1 x) x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int
  (+
    (+
      (+
        (div
          (+
            (+ (* (div (+ (+ (* (+ (+ (+ (v0 x) 1) x) x) 2) 1) x) (+ 1 2)) 2)
              1)
            x)
          (+ 1 2))
        x)
      x)
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
