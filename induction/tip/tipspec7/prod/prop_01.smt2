(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  double
  ((x Nat)) Nat
  (match x
    ((Z Z)
     ((S y) (S (S (double y)))))))
(define-fun-rec
  +2
  ((x Nat) (y Nat)) Nat
  (match x
    ((Z y)
     ((S z) (S (+2 z y))))))
(assert-not (forall ((x Nat)) (= (double x) (+2 x x))))
(assert-claim (= (double Z) Z))
(assert-claim (forall ((x Nat) (y Nat)) (= (+2 y x) (+2 x y))))
(assert-claim (forall ((x Nat)) (= (double x) (+2 x x))))
(assert-claim (forall ((x Nat)) (= (+2 x Z) x)))
(assert-claim (= (double (S Z)) (S (S Z))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (+2 y (S x)) (+2 x (S y)))))
(assert-claim (forall ((x Nat)) (= (+2 x (S x)) (S (double x)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (S (+2 x y)) (+2 x (S y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (+2 (+2 x y) z) (+2 x (+2 y z)))))
