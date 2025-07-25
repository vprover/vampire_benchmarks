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
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y x))
(define-fun
  v2
  ((x Int) (y Int)) Int (u2 (- x y) x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y) x)))
(define-fun
  h4
  ((x Int)) Int x)
(define-fun
  h3
  ((x Int)) Int (+ 2 x))
(define-fun
  v3
  ((x Int)) Int (u3 x (h3 x)))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int (+ 2 x))
(define-fun
  v1
  ((x Int)) Int (u1 x (h1 x)))
(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g3
  ((x Int)) Int x)
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int (mod (+ (mod (- (v3 x) 2) (+ (+ 1 x) x)) 1) 2))
(define-fun
  f4
  ((x Int) (y Int)) Int y)
(define-fun
  f2
  ((x Int) (y Int)) Int y)
(define-fun
  f0
  ((x Int)) Int (- 2 (v1 x)))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 x))
(define-fun
  small
  ((x Int)) Int (mod (+ (v0 x) 1) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
