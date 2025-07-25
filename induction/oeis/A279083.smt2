(define-fun
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  g1
  ((x Int)) Int (mod (+ 1 x) (+ 2 2)))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 2))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (+
    (+ (- (mod (+ (+ (- (v1 x) 2) x) x) (+ 2 x)) (ite (<= x 0) 0 1)) x)
    x))
(define-fun
  f1
  ((x Int) (y Int)) Int y)
(define-fun
  f0
  ((x Int)) Int
  (+ 1 (+ (ite (<= (mod x (+ 1 2)) 0) 1 (mod (- 2 x) (+ 2 2))) x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x 0))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
