(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x x))
(define-fun
  h1
  ((x Int)) Int x)
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
          (div
            (div
              (-
                (div
                  (mod (- (+ (* (div (+ 2 (+ x x)) (+ 1 (+ 2 2))) 2) x) x) (+ 1 2))
                  2)
                x)
              2)
            2)
          1)
        x)
      2)
    1))
(define-fun
  f0
  ((x Int)) Int (mod (v1 x) (+ 1 x)))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(define-fun
  small
  ((x Int)) Int
  (+
    (div
      (div (+ (div (+ (div (div (* (+ (u0 x) 1) (+ 1 2)) 2) 2) 1) 2) x)
        2)
      2)
    1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
