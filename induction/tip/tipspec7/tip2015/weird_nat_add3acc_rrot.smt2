(declare-datatype Nat ((zero) (succ (p Nat))))
(define-fun-rec
  add3acc
  ((x Nat) (y Nat) (z Nat)) Nat
  (match x
    ((zero
      (match y
        ((zero z)
         ((succ x2) (add3acc zero x2 (succ z))))))
     ((succ x3) (add3acc x3 (succ y) z)))))
(assert-not
  (forall ((x Nat) (y Nat) (z Nat))
    (= (add3acc x y z) (add3acc z x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (add3acc x z y) (add3acc x y z))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (add3acc y x z) (add3acc x y z))))
(assert-claim (forall ((x Nat)) (= (add3acc x zero zero) x)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (add3acc x y (succ z)) (succ (add3acc x y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat) (x3 Nat))
    (= (add3acc x (add3acc y z x2) x3)
      (add3acc x y (add3acc z x2 x3)))))
