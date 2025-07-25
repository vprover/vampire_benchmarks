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
(assert-not
  (forall ((m Nat) (n Nat)) (=> (<=2 m n) (<=2 m (S n)))))
(assert-claim (forall ((x Nat)) (<=2 x x)))
(assert-claim (forall ((x Nat)) (<=2 Z x)))
(assert-claim (forall ((x Nat)) (<=2 x (S x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 x y) (<=2 x (S y)))))
(assert-claim (forall ((x Nat)) (not (<=2 (S x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 y x) (not (<=2 (S x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<=2 (S x) (S y)) (<=2 x y))))
