(define-fun
  j1
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  () Int (+ 1 (+ 2 2)))
(define-fun
  g1
  ((x Int) (y Int)) Int (div y 2))
(define-funs-rec
  ((v1
    ((x Int) (y Int) (z Int)) Int)
   (u1
    ((x Int) (y Int) (z Int)) Int))
  ((ite (<= x 0) z (g1 (u1 (- x 1) y z) (v1 (- x 1) y z)))
   (ite (<= x 0) y (+ (u1 (- x 1) y z) (v1 (- x 1) y z)))))
(define-fun
  w1
  ((x Int)) Int (u1 h1 2 x))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int) (y Int)) Int
  (+ (+ (mod (- y (div (div x 2) (+ 1 2))) 2) x) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 2 x))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (div
        (+
          (+
            (+
              (+
                (+
                  (div
                    (+
                      (+
                        (- (+ (+ (+ (+ (+ (v2 x) (ite (<= x 0) 1 x)) x) x) x) x)
                          (ite (<= x 0) 1 2))
                        x)
                      x)
                    (+ 1 2))
                  1)
                x)
              x)
            x)
          x)
        (ite (<= x 0) 1 2))
      x)
    x))
(define-fun
  f0
  ((x Int)) Int (+ (+ (mod (w1 x) 2) 2) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  small
  ((x Int)) Int (+ (+ (+ (+ (+ (div (+ (v0 x) x) 2) 1) x) x) x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
