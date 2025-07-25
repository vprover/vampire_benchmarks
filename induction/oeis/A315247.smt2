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
    (+
      (div
        (+
          (+
            (+
              (+
                (+
                  (div
                    (+ (+ (* (+ (- (mod (+ 2 (+ x x)) (+ 1 (+ 2 2))) 1) x) 2) 1) x)
                    (+ 1 2))
                  x)
                x)
              x)
            x)
          x)
        (ite (<= x 0) 1 2))
      x)
    x))
(define-fun
  f1
  ((x Int) (y Int)) Int (+ (- y (div (div x 2) 2)) y))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 0))
(define-fun
  f0
  ((x Int)) Int (mod (+ (v1 x) x) 2))
(define-fun-rec
  t0
  ((x Int)) Int (ite (<= (f0 x) 0) x (t0 (+ x 1))))
(define-fun-rec
  u0
  ((x Int)) Int (ite (<= x 0) (t0 0) (t0 (+ (u0 (- x 1)) 1))))
(define-fun
  small
  ((x Int)) Int (+ (+ (+ (+ (u0 x) 1) x) x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
