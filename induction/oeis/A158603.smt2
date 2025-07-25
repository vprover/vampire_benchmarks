(define-fun-rec
  u2
  ((x Int) (y Int)) Int (ite (<= x 0) y (+ (u2 (- x 1) y) x)))
(define-fun
  h3
  ((x Int)) Int (+ (* 2 (+ (+ x x) x)) x))
(define-fun
  h2
  ((x Int)) Int x)
(define-fun
  h0
  ((x Int)) Int (* x x))
(define-fun
  g2
  () Int (+ 2 (+ 2 2)))
(define-fun
  v2
  ((x Int)) Int (u2 g2 x))
(define-fun-rec
  u1
  ((x Int) (y Int)) Int (ite (<= x 0) y (v2 (u1 (- x 1) y))))
(define-fun
  v1
  ((x Int)) Int (u1 x 1))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (v1 (u0 (- x 1) y))))
(define-fun
  v0
  ((x Int)) Int (u0 2 (h0 x)))
(define-fun
  small
  ((x Int)) Int (- (v0 x) 1))
(define-fun
  g1
  ((x Int)) Int x)
(define-fun
  f3
  ((x Int)) Int (* x x))
(define-fun-rec
  u3
  ((x Int) (y Int)) Int (ite (<= x 0) y (f3 (u3 (- x 1) y))))
(define-fun
  v3
  ((x Int)) Int (u3 1 (h3 x)))
(define-fun
  fast
  ((x Int)) Int (* (+ (* (+ 2 (v3 x)) (+ 1 2)) 1) (+ 1 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
