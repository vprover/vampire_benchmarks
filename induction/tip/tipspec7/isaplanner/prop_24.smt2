(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  max
  ((x Nat) (y Nat)) Nat
  (match x
    ((Z y)
     ((S z)
      (match y
        ((Z (S z))
         ((S x2) (S (max z x2)))))))))
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
  (forall ((a Nat) (b Nat)) (= (== (max a b) a) (<=2 b a))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (== y x) (= x y))))
(assert-claim (forall ((x Nat)) (<=2 x x)))
(assert-claim (forall ((x Nat) (y Nat)) (= (== y x) (== x y))))
(assert-claim (forall ((x Nat)) (== x x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (= (<=2 y x) (== x y)))))
(assert-claim (forall ((x Nat) (y Nat)) (= (max y x) (max x y))))
(assert-claim (forall ((x Nat)) (= (max x x) x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (= (max x y) y))))
(assert-claim (forall ((x Nat)) (<=2 Z x)))
(assert-claim (forall ((x Nat)) (<=2 x (S x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (<=2 x (S y)))))
(assert-claim (forall ((x Nat)) (not (<=2 (S x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 y x) (not (<=2 (S x) y)))))
(assert-claim (forall ((x Nat) (y Nat)) (<=2 x (max x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (<=2 x z) (<=2 x (max y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<=2 (max y x) y) (<=2 x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (<=2 x z) (= (<=2 (max y x) z) (<=2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (max (max x y) z) (max x (max y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<=2 (S x) (S y)) (<=2 x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== (S x) (S y)) (== x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (max (S x) (S y)) (S (max x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<=2 (S x) (max x y)) (<=2 (S x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (<=2 x y) (= (<=2 (S y) (max z x)) (<=2 (S y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== (S y) (max y x)) (== x (S y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (<=2 x z) (= (== (S z) (max y x)) (== y (S z))))))
