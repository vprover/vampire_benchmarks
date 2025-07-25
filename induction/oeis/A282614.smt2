(define-fun
  small
  ((x Int)) Int
  (*
    (*
      (* (div (* (div (+ (* (* (+ 2 (* (* x x) x)) x) x) x) 2) x) 2) x)
      x)
    x))
(define-fun
  fast
  ((x Int)) Int
  (div (* (+ 1 (* (+ 2 (* (* x x) x)) x)) (* (* (* (* x x) x) x) x))
    (+ 2 2)))
(assert-not
  (forall ((c Int)) (or (not (>= c 0)) (= (small c) (fast c)))))
