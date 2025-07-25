(define-fun
  v0
  ((x Int) (y Int) (z Int)) Int (ite (<= x 0) z 2))
(define-fun
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y 2))
(define-fun-rec
  u0
  ((x Int) (y Int) (z Int)) Int
  (ite (<= x 0) y (+ (u0 (- x 1) y z) (v0 (- x 1) y z))))
(define-fun
  i0
  ((x Int)) Int x)
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h1
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (- x 2))
(define-fun
  w0
  ((x Int)) Int (u0 (h0 x) x 1))
(define-fun
  small
  ((x Int)) Int (ite (<= x 0) 1 (* 2 (w0 x))))
(define-fun
  g2
  ((x Int)) Int (- 2 x))
(define-fun
  v2
  ((x Int)) Int (u2 (g2 x) x))
(define-fun
  f1
  ((x Int)) Int (+ (* (- (v2 x) 2) 2) 1))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (f1 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 2 x))
(define-fun
  fast
  ((x Int)) Int
  (+ (+ (div (- (+ (* (v1 x) 2) 1) (ite (<= x 0) 1 2)) 2) x) x))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
