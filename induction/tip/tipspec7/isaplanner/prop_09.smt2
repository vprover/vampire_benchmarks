(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  |-2|
  ((x Nat) (y Nat)) Nat
  (match x
    ((Z Z)
     ((S z)
      (match y
        ((Z (S z))
         ((S x2) (|-2| z x2))))))))
(define-fun-rec
  +2
  ((x Nat) (y Nat)) Nat
  (match x
    ((Z y)
     ((S z) (S (+2 z y))))))
(assert-not
  (forall ((i Nat) (j Nat) (k Nat))
    (= (|-2| (|-2| i j) k) (|-2| i (+2 j k)))))
(assert-claim (forall ((x Nat) (y Nat)) (= (+2 y x) (+2 x y))))
(assert-claim (forall ((x Nat)) (= (|-2| x x) Z)))
(assert-claim (forall ((x Nat)) (= (+2 x Z) x)))
(assert-claim (forall ((x Nat)) (= (|-2| x Z) x)))
(assert-claim (forall ((x Nat)) (= (|-2| Z x) Z)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (+2 y (S x)) (+2 x (S y)))))
(assert-claim (forall ((x Nat)) (= (|-2| x (S x)) Z)))
(assert-claim (forall ((x Nat)) (= (|-2| (S x) x) (S Z))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (S (+2 x y)) (+2 x (S y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (+2 (+2 x y) z) (+2 x (+2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (+2 x (|-2| y x)) (+2 y (|-2| x y)))))
(assert-claim (forall ((x Nat) (y Nat)) (= (|-2| x (+2 x y)) Z)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| y (|-2| y x)) (|-2| x (|-2| x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (|-2| (+2 y x) y) (+2 x (|-2| y y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (|-2| (|-2| x y) z) (|-2| x (+2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| (S (|-2| x y)) y) (|-2| (|-2| (S x) y) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| (S (|-2| x y)) x) (|-2| (S (|-2| y x)) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (S (|-2| x (|-2| x y))) (|-2| (S x) (|-2| x y)))))
(assert-claim (forall ((x Nat)) (= (|-2| x (|-2| (S Z) x)) x)))
(assert-claim
  (forall ((x Nat)) (= (|-2| (+2 x x) (S Z)) (+2 x (|-2| x (S Z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| x (+2 y (|-2| y x))) (|-2| x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (|-2| x (|-2| (+2 x z) y)) (|-2| x (|-2| x (|-2| y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| x (|-2| (+2 y y) x)) (|-2| x (|-2| y (|-2| x y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| (+2 x x) (+2 y y)) (+2 (|-2| x y) (|-2| x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (|-2| (+2 y x) (|-2| y z)) (+2 x (|-2| y (|-2| y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (|-2| (+2 x (|-2| y z)) y) (|-2| x (|-2| y (|-2| y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| (+2 x (|-2| x y)) y) (+2 (|-2| x y) (|-2| x y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| (S (S (|-2| x y))) x) (|-2| (S (S (|-2| y x))) y))))
(assert-claim
  (forall ((x Nat))
    (= (S (S (|-2| x (S (S Z))))) (+2 x (|-2| (S (S Z)) x)))))
