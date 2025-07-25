(define-fun-rec
  u4
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u4 (- x 1) y) x)))
(define-fun
  v4
  ((x Int) (y Int)) Int (u4 y 0))
(define-fun
  h8
  ((x Int)) Int (+ 2 x))
(define-fun
  h7
  ((x Int)) Int (+ 2 x))
(define-fun
  h6
  ((x Int) (y Int)) Int y)
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
  g5
  ((x Int)) Int x)
(define-fun
  g4
  ((x Int) (y Int)) Int y)
(define-fun
  g3
  ((x Int) (y Int)) Int y)
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int) (y Int)) Int (+ 1 y))
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  f8
  ((x Int)) Int (- (* (* x x) x) x))
(define-fun-rec
  u8
  ((x Int) (y Int)) Int (ite (<= x 0) y (f8 (u8 (- x 1) y))))
(define-fun
  v8
  ((x Int)) Int (u8 1 (h8 x)))
(define-fun
  f7
  ((x Int)) Int (* (div (* (v8 x) x) (* 2 (+ 2 (+ 2 2)))) x))
(define-fun-rec
  u7
  ((x Int) (y Int)) Int (ite (<= x 0) y (f7 (u7 (- x 1) y))))
(define-fun
  v7
  ((x Int)) Int (u7 1 (h7 x)))
(define-fun
  f6
  ((x Int)) Int (div (* (v7 x) (+ 1 x)) (+ 2 (* 2 (+ 2 2)))))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int) (y Int)) Int (u6 1 y))
(define-fun
  f5
  ((x Int) (y Int)) Int (+ (v6 x y) x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (f5 (u5 (- x 1) y) x)))
(define-fun
  v5
  ((x Int)) Int (u5 x 2))
(define-fun
  fast
  ((x Int)) Int (div (v5 x) 2))
(define-fun
  f3
  ((x Int) (y Int)) Int (+ (* (v4 x y) y) x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y) x)))
(define-fun
  v3
  ((x Int) (y Int)) Int (u3 y x))
(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (v3 (u2 (- x 1) y) x)))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 y x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int) (y Int)) Int (u1 (g1 x y) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (v0 c) (fast c)))))
