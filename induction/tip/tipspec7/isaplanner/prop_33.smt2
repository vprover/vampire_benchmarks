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
(define-fun-rec
  ==
  ((x Nat) (y Nat)) Bool
  (match x
    ((Z
      (match y
        ((Z true)
         ((S z) false))))
     ((S x2)
      (match y
        ((Z false)
         ((S y2) (== x2 y2))))))))
(define-fun-rec
  <=2
  ((x Nat) (y Nat)) Bool
  (match x
    ((Z true)
     ((S z)
      (match y
        ((Z false)
         ((S x2) (<=2 z x2))))))))
(assert-not
  (forall ((a Nat) (b Nat)) (= (== (min a b) a) (<=2 a b))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (== y x) (= x y))))
(assert-claim (forall ((x Nat)) (<=2 x x)))
(assert-claim (forall ((x Nat) (y Nat)) (= (== y x) (== x y))))
(assert-claim (forall ((x Nat)) (== x x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (= (<=2 y x) (== x y)))))
(assert-claim (forall ((x Nat) (y Nat)) (= (min y x) (min x y))))
(assert-claim (forall ((x Nat)) (= (min x x) x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 y x) (= (min y x) y))))
(assert-claim (forall ((x Nat)) (<=2 Z x)))
(assert-claim (forall ((x Nat)) (<=2 x (S x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (<=2 x (S y)))))
(assert-claim (forall ((x Nat)) (not (<=2 (S x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 y x) (not (<=2 (S x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<=2 x (min x y)) (<=2 x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (<=2 y x) (= (<=2 y (min z x)) (<=2 y z)))))
(assert-claim (forall ((x Nat) (y Nat)) (<=2 (min y x) y)))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (<=2 z x) (= (== x (min y z)) (<=2 x (min y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (min (min x y) z) (min x (min y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<=2 (S x) (S y)) (<=2 x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== (S x) (S y)) (== x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (min (S x) (S y)) (S (min x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<=2 (S (min y x)) y) (<=2 (S x) y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== x (S (min x y))) (== x (S y)))))
