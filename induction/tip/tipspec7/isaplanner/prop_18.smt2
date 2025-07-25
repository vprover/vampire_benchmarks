(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  <2
  ((x Nat) (y Nat)) Bool
  (match y
    ((Z false)
     ((S z)
      (match x
        ((Z true)
         ((S x2) (<2 x2 z))))))))
(define-fun-rec
  +2
  ((x Nat) (y Nat)) Nat
  (match x
    ((Z y)
     ((S z) (S (+2 z y))))))
(assert-not (forall ((i Nat) (m Nat)) (<2 i (S (+2 i m)))))
(assert-claim (forall ((x Nat) (y Nat)) (= (+2 y x) (+2 x y))))
(assert-claim (forall ((x Nat)) (not (<2 x x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<2 y x) (not (<2 x y)))))
(assert-claim (forall ((x Nat)) (= (+2 x Z) x)))
(assert-claim (forall ((x Nat)) (not (<2 x Z))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (<2 x y) (<2 Z y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (+2 y (S x)) (+2 x (S y)))))
(assert-claim (forall ((x Nat)) (<2 x (S x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<2 x y) (<2 x (S y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<2 y x) (not (<2 x (S y))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (S (+2 x y)) (+2 x (S y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (+2 (+2 x y) z) (+2 x (+2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<2 x (+2 y x)) (<2 Z y))))
(assert-claim (forall ((x Nat) (y Nat)) (not (<2 (+2 y x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (<2 z y) (not (<2 (+2 x y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat)) (=> (<2 x z) (<2 x (+2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<2 (S x) (S y)) (<2 x y))))
(assert-claim (forall ((x Nat)) (= (<2 Z (+2 x x)) (<2 Z x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<2 (+2 y x) (S x)) (<2 y (S Z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<2 (S x) (+2 y x)) (<2 (S Z) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 Nat))
    (=> (<2 y z) (=> (<2 x x2) (<2 (S y) (+2 z x2))))))
(assert-claim
  (forall ((x Nat)) (= (<2 (+2 x x) (S Z)) (<2 x (S Z)))))
(assert-claim (forall ((x Nat)) (= (<2 (S Z) (+2 x x)) (<2 Z x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (<2 x y) (= (<2 (S Z) (+2 x y)) (<2 (S Z) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (<2 (+2 y x) (+2 z x)) (<2 y z))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<2 (+2 x x) (+2 y y)) (<2 x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (<2 Z (+2 x (+2 x y))) (<2 Z (+2 x y)))))
