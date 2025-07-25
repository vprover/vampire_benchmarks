(define-fun
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  v7
  ((x Int) (y Int)) Int (u7 (- x y) x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (v7 (u6 (- x 1) y) x)))
(define-fun
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 (- x y) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (v4 (u3 (- x 1) y) x)))
(define-fun
  h7
  ((x Int)) Int x)
(define-fun
  h6
  ((x Int)) Int (+ 1 x))
(define-fun
  v6
  ((x Int)) Int (u6 x (h6 x)))
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int (+ 1 x))
(define-fun
  v3
  ((x Int)) Int (u3 x (h3 x)))
(define-fun
  h1
  ((x Int) (y Int)) Int y)
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g5
  ((x Int)) Int (+ 1 x))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f7
  ((x Int) (y Int)) Int y)
(define-fun
  f5
  ((x Int)) Int
  (mod
    (-
      (mod (mod (- (mod (mod (- (v6 x) 1) (+ 1 x)) (+ 1 2)) 1) (+ 1 x))
        (+ 1 2))
      1)
    (+ 1 x)))
(define-fun-rec
  t5
  ((x Int)) Int (ite (<= (f5 x) 0) x (t5 (+ x 1))))
(define-fun-rec
  u5
  ((x Int)) Int (ite (<= x 0) (t5 0) (t5 (+ (u5 (- x 1)) 1))))
(define-fun
  v5
  ((x Int)) Int (u5 (g5 x)))
(define-fun
  fast
  ((x Int)) Int (- (div (+ (* (v5 x) 2) 1) (+ 1 2)) x))
(define-fun
  f4
  ((x Int) (y Int)) Int y)
(define-fun
  f2
  ((x Int)) Int (+ (+ (mod (- 2 (v3 x)) (+ 2 2)) 1) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 x 1))
(define-fun
  f1
  ((x Int)) Int (mod (v2 x) 2))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 1 y))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (v1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
