(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u4 (- x 1) y) x)))
(define-fun
  h7
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int)) Int x)
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g7
  ((x Int)) Int (mod x 2))
(define-fun
  g6
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int) (y Int)) Int (+ (* 2 (+ 2 2)) y))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 (g4 x y) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (v4 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int)) Int (u3 x 1))
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g2
  ((x Int)) Int (mod x 2))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f7
  ((x Int)) Int
  (+
    (-
      (mod (+ (div (+ (* 2 (div x (+ 2 (+ 2 2)))) x) (* 2 (+ 2 2))) x)
        (+ 1 2))
      1)
    x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 (g7 x) x))
(define-fun
  f6
  ((x Int)) Int (+ (+ (mod (+ (v7 x) x) 2) 1) x))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 x 1))
(define-fun
  f5
  ((x Int)) Int (- (- (v6 x) x) x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 2 x))
(define-fun
  fast
  ((x Int)) Int
  (+ (+ (+ (+ (div (+ (v5 x) 1) (ite (<= x 0) 1 2)) x) x) x) x))
(define-fun
  f2
  ((x Int)) Int (+ (- (mod (v3 x) (+ 1 2)) 1) x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (f2 (u2 (- x 1) y))))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) x))
(define-fun
  f1
  ((x Int)) Int (+ (+ (mod (+ (v2 x) x) 2) 1) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun
  f0
  ((x Int)) Int (- (- (v1 x) x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int
  (+ (+ (div (+ (+ (+ (+ (+ (+ (v0 x) 1) x) x) 1) x) x) 2) x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
