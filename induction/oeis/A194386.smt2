(define-fun
  g1
  ((x Int)) Int (div x (+ 1 (+ 2 2))))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f1
  ((x Int)) Int
  (+ (+ (div (+ 1 (div (- 2 x) (+ 2 2))) (+ 2 2)) 1) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  fast
  ((x Int)) Int (+ (v1 x) x))
(define-fun
  f0
  ((x Int) (y Int)) Int
  (+
    (ite
      (<= (- (- (mod (mod x (+ 2 (+ 2 (+ 2 y)))) (+ 2 (+ 2 2))) 2) 2) 0)
      1 2)
    x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
