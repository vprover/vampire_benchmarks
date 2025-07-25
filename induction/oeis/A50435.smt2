(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (* (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int)) Int (u2 x 2))
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g7
  ((x Int)) Int (div x 2))
(define-fun
  g6
  ((x Int)) Int (- 1 (mod x 2)))
(define-fun
  g5
  ((x Int)) Int (div x 2))
(define-fun
  g4
  ((x Int)) Int (+ 1 x))
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int (+ 2 x))
(define-fun
  f7
  ((x Int)) Int (+ x x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 (g7 x) 1))
(define-fun
  f6
  ((x Int)) Int (mod (- 1 (v7 x)) (+ 1 x)))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 (g6 x) x))
(define-fun
  f5
  ((x Int)) Int (- (ite (<= (- (v6 x) 2) 0) (+ 1 x) 1) 1))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) x))
(define-fun-rec
  t4
  ((x Int)) Int (ite (<= (v5 x) 0) x (t4 (+ x 1))))
(define-fun-rec
  u4
  ((x Int)) Int (ite (<= x 0) (t4 0) (t4 (+ (u4 (- x 1)) 1))))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (v4 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 2 x))
(define-fun
  fast
  ((x Int)) Int (+ (v3 x) 1))
(define-fun
  f1
  ((x Int)) Int (mod (v2 x) (+ 1 x)))
(define-fun-rec
  t1
  ((x Int)) Int (ite (<= (f1 x) 0) x (t1 (+ x 1))))
(define-fun-rec
  u1
  ((x Int)) Int (ite (<= x 0) (t1 0) (t1 (+ (u1 (- x 1)) 1))))
(define-fun
  v1
  ((x Int)) Int (u1 (g1 x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int (+ (v0 x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
