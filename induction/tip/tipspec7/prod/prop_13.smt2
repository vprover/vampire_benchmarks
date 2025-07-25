(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  half
  ((x Nat)) Nat
  (match x
    ((Z Z)
     ((S y)
      (match y
        ((Z Z)
         ((S z) (S (half z)))))))))
(define-fun-rec
  +2
  ((x Nat) (y Nat)) Nat
  (match x
    ((Z y)
     ((S z) (S (+2 z y))))))
(assert-not (forall ((x Nat)) (= (half (+2 x x)) x)))
(assert-claim (= (half Z) Z))
(assert-claim (forall ((x Nat) (y Nat)) (= (+2 y x) (+2 x y))))
(assert-claim (forall ((x Nat)) (= (+2 x Z) x)))
(assert-claim (= (half (S Z)) Z))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (+2 y (S x)) (+2 x (S y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (S (+2 x y)) (+2 x (S y)))))
(assert-claim (forall ((x Nat)) (= (half (+2 x x)) x)))
(assert-claim (forall ((x Nat)) (= (half (S (S x))) (S (half x)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (+2 (+2 x y) z) (+2 x (+2 y z)))))
(assert-claim (forall ((x Nat)) (= (half (+2 x (S x))) x)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (half (+2 x (+2 x y))) (+2 x (half y)))))
(assert-claim (forall ((x Nat)) (= (+2 (half x) (half (S x))) x)))
(assert-claim
  (forall ((x Nat)) (= (half (half (half (half (half x))))) Z)))
