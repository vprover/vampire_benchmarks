(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  <=2
  ((x Nat) (y Nat)) Bool
  (match x
    ((Z true)
     ((S z)
      (match y
        ((Z false)
         ((S x2) (<=2 z x2))))))))
(define-fun-rec
  +2
  ((x Nat) (y Nat)) Nat
  (match x
    ((Z y)
     ((S z) (S (+2 z y))))))
(assert-not (forall ((n Nat) (m Nat)) (<=2 n (+2 n m))))
(assert-claim (forall ((x Nat) (y Nat)) (= (+2 y x) (+2 x y))))
(assert-claim (forall ((x Nat)) (<=2 x x)))
(assert-claim (forall ((x Nat)) (= (+2 x Z) x)))
(assert-claim (forall ((x Nat)) (<=2 Z x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (+2 y (S x)) (+2 x (S y)))))
(assert-claim (forall ((x Nat)) (<=2 x (S x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (<=2 x (S y)))))
(assert-claim (forall ((x Nat)) (not (<=2 (S x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 y x) (not (<=2 (S x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (S (+2 x y)) (+2 x (S y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (+2 (+2 x y) z) (+2 x (+2 y z)))))
(assert-claim (forall ((x Nat) (y Nat)) (<=2 x (+2 x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<=2 (+2 y x) x) (<=2 y Z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (<=2 x y) (= (<=2 (+2 y y) x) (<=2 y Z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat)) (=> (<=2 x z) (<=2 x (+2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (<=2 x y) (= (<=2 (+2 x y) Z) (<=2 y Z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<=2 (S x) (S y)) (<=2 x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<=2 (+2 y x) (S x)) (<=2 y (S Z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<=2 (S x) (+2 y x)) (<=2 (S Z) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (<=2 x y) (= (<=2 (S x) (+2 y y)) (<=2 (S Z) y)))))
(assert-claim
  (forall ((x Nat)) (= (<=2 (+2 x x) (S Z)) (<=2 x Z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (<=2 x y) (= (<=2 (S Z) (+2 x y)) (<=2 (S Z) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (<=2 (+2 y x) (+2 z x)) (<=2 y z))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<=2 (+2 x x) (+2 y y)) (<=2 x y))))
