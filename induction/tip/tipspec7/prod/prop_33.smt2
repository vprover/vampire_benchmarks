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
  fac
  ((x Nat)) Nat
  (match x
    ((Z (S Z))
     ((S y) (*2 (S y) (fac y))))))
(define-fun-rec
  qfac
  ((x Nat) (y Nat)) Nat
  (match x
    ((Z y)
     ((S z) (qfac z (*2 (S z) y))))))
(assert-not (forall ((x Nat)) (= (fac x) (qfac x one))))
(assert-claim (= one (S Z)))
(assert-claim (= one (fac Z)))
(assert-claim (= (fac one) one))
(assert-claim (forall ((x Nat) (y Nat)) (= (*2 y x) (*2 x y))))
(assert-claim (forall ((x Nat) (y Nat)) (= (+2 y x) (+2 x y))))
(assert-claim (forall ((x Nat)) (= (*2 x Z) Z)))
(assert-claim (forall ((x Nat)) (= (*2 x one) x)))
(assert-claim (forall ((x Nat)) (= (+2 x Z) x)))
(assert-claim (forall ((x Nat)) (= (+2 x one) (S x))))
(assert-claim (forall ((x Nat)) (= (qfac x Z) Z)))
(assert-claim (forall ((x Nat)) (= (fac x) (qfac x one))))
(assert-claim (forall ((x Nat)) (= (qfac Z x) x)))
(assert-claim (forall ((x Nat)) (= (qfac one x) x)))
(assert-claim (= (fac (S one)) (S one)))
