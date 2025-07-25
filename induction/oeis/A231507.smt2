(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u1 (- x 1) y) x)))
(define-fun
  g5
  ((x Int)) Int (div x 2))
(define-fun
  g3
  ((x Int)) Int (mod x 2))
(define-fun
  g2
  ((x Int)) Int (+ 1 x))
(define-fun
  g1
  ((x Int)) Int (+ 2 x))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x) 1))
(define-fun
  g0
  ((x Int)) Int (+ 1 x))
(define-fun
  f5
  ((x Int)) Int (+ x x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) 1))
(define-fun
  f4
  ((x Int)) Int (* x x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 1 (v5 x)))
(define-fun
  f3
  ((x Int)) Int (+ x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) (v4 x)))
(define-fun
  f2
  ((x Int)) Int
  (+
    (mod (ite (<= (- (mod (+ 1 (v3 x)) (+ 1 (+ x x))) 2) 0) 2 1)
      (+ 1 x))
    x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) 2))
(define-fun
  f0
  ((x Int)) Int (+ (ite (<= (mod (v1 x) (+ 1 (+ x x))) 0) 1 2) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 (g0 x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (v2 c)))))
