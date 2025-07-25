(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(define-fun-rec
  last
  ((x list)) Nat
  (match x
    ((nil Z)
     ((cons y z)
      (match z
        ((nil y)
         ((cons x2 x3) (last (cons x2 x3)))))))))
(assert-not
  (forall ((xs list) (x Nat))
    (=>
      (not
        (match xs
          ((nil true)
           ((cons y z) false))))
      (= (last (cons x xs)) (last xs)))))
(assert-claim (= (last nil) Z))
(assert-claim (forall ((x Nat)) (= (last (cons x nil)) x)))
(assert-claim (forall ((x list)) (= (last (cons Z x)) (last x))))
(assert-claim
  (forall ((x list)) (= (last (cons (last x) x)) (last x))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (last (cons x (cons y z))) (last (cons y z)))))
(assert-claim
  (forall ((x list))
    (= (last (cons (S (last x)) x)) (last (cons (S Z) x)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (last (cons (last (cons x y)) y)) (last (cons x y)))))
(assert-claim
  (forall ((x list))
    (= (last (cons (S (S (last x))) x)) (last (cons (S (S Z)) x)))))
