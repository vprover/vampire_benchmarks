(define-funs-rec
  ((u3
    ((x Int) (y Int) (z Int)) Int)
   (v3
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) y (v3 (- x 1) y z))
   (ite (<= x 0) z (+ (u3 (- x 1) y z) (v3 (- x 1) y z)))))
(define-fun
  i3
  () Int (+ 1 2))
(define-fun
  w3
  ((x Int)) Int (u3 x i3 1))
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int (div x 2))
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (- x 1))
(define-fun
  f5
  ((x Int)) Int (+ (div (+ 1 x) (+ 1 2)) x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 2 x))
(define-fun
  f4
  ((x Int)) Int (+ (+ (mod (+ (v5 x) x) 2) 1) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 x 1))
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
                (+
                  (+
                    (+
                      (div
                        (+ (+ (* (- (* (+ (v4 x) x) 2) (ite (<= x 0) 1 2)) (+ 2 2)) 1) x)
                        (+ 1 2))
                      x)
                    x)
                  x)
                x)
              x)
            (ite (<= x 0) 1 2))
          x)
        x)
      (+ 1 2))
    1))
(define-fun
  f3
  ((x Int) (y Int)) Int y)
(define-fun
  f2
  ((x Int)) Int (mod (div (w3 x) 2) 2))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  f1
  ((x Int)) Int (mod (+ (- (mod (+ (v2 x) x) 2) (mod x 2)) 1) 2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 1))
(define-fun
  small
  ((x Int)) Int
  (+
    (+ (div (+ (+ (- (* (+ (v0 x) x) 2) 1) x) x) (ite (<= x 0) 1 2)) x)
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
