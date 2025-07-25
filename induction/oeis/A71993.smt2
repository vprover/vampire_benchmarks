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
  g6
  () Int (+ 1 (* 2 (+ 2 2))))
(define-fun
  g4
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int (+ x x))
(define-fun
  g2
  ((x Int) (y Int)) Int y)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f6
  ((x Int)) Int (div (ite (<= (mod x 2) 0) 2 x) 2))
(define-fun-rec
  u6
  ((x Int) (y Int)) Int (ite (<= x 0) y (f6 (u6 (- x 1) y))))
(define-fun
  v6
  ((x Int)) Int (u6 g6 x))
(define-fun-rec
  u5
  ((x Int) (y Int)) Int (ite (<= x 0) y (v6 (u5 (- x 1) y))))
(define-fun
  v5
  ((x Int)) Int (u5 2 x))
(define-fun
  f4
  ((x Int)) Int (mod (+ (v5 x) 1) 2))
(define-fun-rec
  t4
  ((x Int)) Int (ite (<= (f4 x) 0) x (t4 (+ x 1))))
(define-fun-rec
  u4
  ((x Int)) Int (ite (<= x 0) (t4 0) (t4 (+ (u4 (- x 1)) 1))))
(define-fun
  fast
  ((x Int)) Int (+ (+ (+ (+ (* (u4 x) (- 0 1)) 2) x) x) x))
(define-fun
  f3
  ((x Int)) Int (div (ite (<= (mod x 2) 0) 2 x) 2))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 (g3 x) x))
(define-fun-rec
  t2
  ((x Int)) Int (ite (<= (v3 x) 0) x (t2 (+ x 1))))
(define-fun-rec
  u2
  ((x Int)) Int (ite (<= x 0) (t2 0) (t2 (+ (u2 (- x 1)) 1))))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 y))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y) x)))
(define-fun
  v1
  ((x Int)) Int (u1 x 0))
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
  ((x Int)) Int (+ (- (v0 x) x) 1))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
