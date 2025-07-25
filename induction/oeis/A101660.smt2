(define-fun
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h7
  () Int (+ 2 2))
(define-fun
  h6
  ((x Int)) Int (+ 1 x))
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int (div x 2))
(define-fun
  h2
  ((x Int)) Int (+ (+ x x) x))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g7
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  v7
  ((x Int)) Int (u7 (g7 x) h7))
(define-fun
  g6
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  g5
  ((x Int)) Int (- (mod x (+ 2 2)) 2))
(define-fun
  g4
  ((x Int)) Int (mod x 2))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f6
  ((x Int)) Int (div x (v7 x)))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 (g6 x) (h6 x)))
(define-fun
  f5
  ((x Int)) Int (+ (mod (v6 x) 2) x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x) x))
(define-fun
  f4
  ((x Int)) Int (+ (- (v5 x) x) 1))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 (g4 x) x))
(define-fun
  f3
  ((x Int)) Int (mod (+ (v4 x) 1) 2))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 1 (h3 x)))
(define-fun
  f2
  ((x Int)) Int (mod (+ (v3 x) 1) 2))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 1 (h2 x)))
(define-fun
  fast
  ((x Int)) Int (+ (mod (+ (v2 x) x) 2) (mod x 2)))
(define-fun
  f1
  ((x Int) (y Int)) Int (div y (- 2 (mod x 2))))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 0))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 x x))
(define-fun
  small
  ((x Int)) Int (+ (mod (v0 x) 2) (mod x 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
