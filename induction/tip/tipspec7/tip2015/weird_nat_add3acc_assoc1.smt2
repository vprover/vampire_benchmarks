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
  (forall ((x1 Nat) (x2 Nat) (x3 Nat) (x4 Nat) (x5 Nat))
    (= (add3acc (add3acc x1 x2 x3) x4 x5)
      (add3acc x1 x2 (add3acc x3 x4 x5)))))
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
