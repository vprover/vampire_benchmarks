(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun
  one
  () Nat (S Z))
(define-fun-rec
  +2
  ((x Nat) (y Nat)) Nat
  (match x
    ((Z y)
     ((S z) (S (+2 z y))))))
(define-fun-rec
  *2
  ((x Nat) (y Nat)) Nat
  (match x
    ((Z Z)
     ((S z) (+2 y (*2 z y))))))
(define-fun-rec
  exp2
  ((x Nat) (y Nat)) Nat
  (match y
    ((Z (S Z))
     ((S n) (*2 x (exp2 x n))))))
(define-fun-rec
  qexp
  ((x Nat) (y Nat) (z Nat)) Nat
  (match y
    ((Z z)
     ((S n) (qexp x n (*2 x z))))))
(assert-not
  (forall ((x Nat) (y Nat)) (= (exp2 x y) (qexp x y one))))
(assert-claim (= one (S Z)))
(assert-claim (forall ((x Nat) (y Nat)) (= (*2 y x) (*2 x y))))
(assert-claim (forall ((x Nat) (y Nat)) (= (+2 y x) (+2 x y))))
(assert-claim (forall ((x Nat)) (= (*2 x Z) Z)))
(assert-claim (forall ((x Nat)) (= (*2 x one) x)))
(assert-claim (forall ((x Nat)) (= (+2 x Z) x)))
(assert-claim (forall ((x Nat)) (= (+2 x one) (S x))))
(assert-claim (forall ((x Nat)) (= (exp2 x Z) one)))
(assert-claim (forall ((x Nat)) (= (exp2 x one) x)))
(assert-claim (forall ((x Nat)) (= (exp2 one x) one)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (qexp y x x) (qexp x y y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (+2 y (S x)) (+2 x (S y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (S (+2 x y)) (+2 x (S y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (qexp x y x) (exp2 x (S y)))))
(assert-claim (forall ((x Nat) (y Nat)) (= (qexp x y Z) Z)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (exp2 x y) (qexp x y one))))
(assert-claim (forall ((x Nat) (y Nat)) (= (qexp x Z y) y)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (*2 x y) (qexp x one y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (qexp one x y) (qexp x Z y))))
(assert-claim (forall ((x Nat)) (= (+2 x x) (*2 x (S one)))))
