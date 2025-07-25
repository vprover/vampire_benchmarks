(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int)) Int (div x 2))
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int (mod x 2))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (+ x x))
(define-fun
  g1
  ((x Int) (y Int)) Int (+ 2 y))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f6
  ((x Int)) Int (div (ite (<= (mod x 2) 0) 2 x) 2))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 x x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (v6 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) (h5 x)))
(define-fun
  f4
  ((x Int)) Int (+ (+ (mod (+ (v5 x) x) 2) (mod x 2)) x))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 2 x))
(define-fun
  f3
  ((x Int)) Int (mod (+ (+ (v4 x) 1) x) 2))
(define-fun-rec
  t3
  ((x Int)) Int (ite (<= (f3 x) 0) x (t3 (+ x 1))))
(define-fun-rec
  u3
  ((x Int)) Int (ite (<= x 0) (t3 0) (t3 (+ (u3 (- x 1)) 1))))
(define-fun
  f2
  ((x Int)) Int (ite (<= (mod x 2) 0) (div x 2) 2))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) x))
(define-fun
  f1
  ((x Int)) Int (- (v2 x) 1))
(define-fun-rec
  t1
  ((x Int)) Int (ite (<= (f1 x) 0) x (t1 (+ x 1))))
(define-fun-rec
  u1
  ((x Int)) Int (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y)))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) (div x 2)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (u3 c)))))
