(define-fun
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y 0))
(define-fun
  small
  ((x Int)) Int
  (+
    (+
      (+
        (div (+ (+ (div (- (* 2 (+ x x)) (mod (div x 2) 2)) (+ 1 2)) 1) x)
          (ite (<= x 0) 1 2))
        x)
      x)
    x))
(define-fun
  g0
  ((x Int)) Int (- (mod x (+ 2 2)) 2))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (+
        (div (+ (+ (div (+ 1 (+ (v0 x) x)) (+ 1 2)) x) x)
          (ite (<= x 0) 1 2))
        x)
      x)
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
