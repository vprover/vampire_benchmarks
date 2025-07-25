(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  min
  ((x Nat) (y Nat)) Nat
  (match x
    ((Z Z)
     ((S z)
      (match y
        ((Z Z)
         ((S y1) (S (min z y1)))))))))
(assert-not (forall ((a Nat) (b Nat)) (= (min a b) (min b a))))
(assert-claim (forall ((x Nat) (y Nat)) (= (min y x) (min x y))))
(assert-claim (forall ((x Nat)) (= (min x x) x)))
(assert-claim (forall ((x Nat)) (= (min x Z) Z)))
(assert-claim (forall ((x Nat)) (= (min x (S x)) x)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (min (min x y) z) (min x (min y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (min (S x) (S y)) (S (min x y)))))
