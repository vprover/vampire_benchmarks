(define-fun
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y 1))
(define-fun
  h7
  () Int (+ 2 2))
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int (div (+ 2 x) 2))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (+ 2 (+ x x)))
(define-fun
  g7
  ((x Int)) Int (mod x (+ 2 2)))
(define-fun
  v7
  ((x Int)) Int (u7 (g7 x) h7))
(define-fun
  g5
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int (mod x 2))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f6
  ((x Int)) Int (div x (v7 x)))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 2 x))
(define-fun
  f5
  ((x Int)) Int (div (v6 x) (+ 1 (mod x 2))))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 x x))
(define-fun
  f4
  ((x Int)) Int (ite (<= (v5 x) 0) 1 0))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 1 (h4 x)))
(define-fun
  f3
  ((x Int)) Int (- (+ (mod (+ (v4 x) x) 2) x) 1))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) x))
(define-fun
  fast
  ((x Int)) Int (mod (+ (v3 x) x) 2))
(define-fun
  f2
  ((x Int)) Int (div x (ite (<= (mod x (+ 2 2)) 0) (+ 2 2) 1)))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 2 x))
(define-fun
  f1
  ((x Int)) Int (div (v2 x) (+ 1 (mod x 2))))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x x))
(define-fun
  f0
  ((x Int)) Int (ite (<= (v1 x) 0) 1 0))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
