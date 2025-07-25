(define-fun
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  v6
  ((x Int) (y Int)) Int (u6 (- x y) x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (v6 (u5 (- x 1) y) x)))
(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 (- x y) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y) x)))
(define-fun
  h6
  ((x Int)) Int x)
(define-fun
  h5
  ((x Int)) Int (+ 1 x))
(define-fun
  v5
  ((x Int)) Int (u5 x (h5 x)))
(define-fun
  h4
  ((x Int)) Int (+ 2 x))
(define-fun
  h3
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int (+ 1 x))
(define-fun
  v1
  ((x Int)) Int (u1 x (h1 x)))
(define-fun
  h0
  ((x Int)) Int (+ 1 x))
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
  ((x Int) (y Int)) Int y)
(define-fun
  f4
  ((x Int)) Int (- (v5 x) 1))
(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (f4 (u4 (- x 1) y))))
(define-fun
  v4
  ((x Int)) Int (u4 1 (h4 x)))
(define-fun
  f3
  ((x Int)) Int
  (mod
    (+
      (mod (ite (<= (mod (- (mod (v4 x) (+ 1 x)) 1) (+ 1 x)) 0) 1 0)
        (+ 1 x))
      x)
    (+ 1 x)))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) x))
(define-fun
  fast
  ((x Int)) Int
  (+
    (+
      (ite
        (<= (mod (- (mod (mod (+ (v3 x) x) 2) (+ 1 x)) 1) (+ 1 x)) 0)
        (+ 1 x) 0)
      1)
    x))
(define-fun
  f2
  ((x Int) (y Int)) Int y)
(define-fun
  f0
  ((x Int)) Int (- (v1 x) 1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 1 (h0 x)))
(define-fun
  small
  ((x Int)) Int
  (+
    (+ (ite (<= (mod (+ (- (v0 x) (mod x 2)) 1) (+ 1 x)) 0) (+ 1 x) 0)
      1)
    x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
