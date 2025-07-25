(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f2
  ((x Int)) Int
  (+
    (+ (mod (ite (<= (- (mod (* x x) (+ 1 (+ 2 (+ 2 2)))) 1) 0) 0 x) 2)
      1)
    x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  f1
  ((x Int)) Int (- (- (v2 x) x) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 2 x))
(define-fun
  fast
  ((x Int)) Int (+ (+ (+ (+ (+ (v1 x) 1) x) x) x) x))
(define-fun
  f0
  ((x Int)) Int
  (+
    (+
      (mod (ite (<= (mod (+ 1 (+ (div (div x 2) 2) x)) (+ 2 2)) 0) 2 x)
        2)
      x)
    1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  small
  ((x Int)) Int (+ (* (+ (v0 x) x) 2) (ite (<= x 0) 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
