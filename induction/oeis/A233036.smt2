(define-fun
  h0
  ((x Int)) Int x)
(define-fun
  g0
  ((x Int)) Int x)
(define-fun
  fast
  ((x Int)) Int
  (* (div (+ 1 (* (+ 2 x) (ite (<= (- x 2) 0) 1 x))) (* 2 (+ 2 2)))
    2))
(define-fun
  f0
  ((x Int) (y Int)) Int (+ (mod (+ (mod (div x 2) 2) y) x) x))
(define-fun-rec
  u0
  ((x Int) (y Int)) Int (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))
(define-fun
  v0
  ((x Int)) Int (u0 x x))
(define-fun
  small
  ((x Int)) Int (div (- (v0 x) x) 2))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
