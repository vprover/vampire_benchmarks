(define-fun
  small
  ((x Int)) Int
  (+
    (+
      (+
        (+
          (+
            (div (+ 1 (+ (div (+ (- x (mod (div x 2) 2)) x) (+ 1 2)) x))
              (ite (<= x 0) 1 2))
            x)
          x)
        x)
      x)
    x))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int (- (mod x (+ 2 2)) 2))
(define-fun
  f0
  ((x Int)) Int (- x 1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) x))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (+
        (+
          (+ (div (+ (+ (div (+ (v0 x) x) (+ 1 2)) 1) x) (ite (<= x 0) 1 2))
            x)
          x)
        x)
      x)
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
