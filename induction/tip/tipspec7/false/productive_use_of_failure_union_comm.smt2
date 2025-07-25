(declare-datatype Nat ((S (proj1-S Nat)) (Z)))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(define-fun-rec
  eqNat
  ((x Nat) (y Nat)) Bool
  (match x
    (((S z)
      (match y
        (((S y2) (eqNat z y2))
         (Z false))))
     (Z
      (match y
        (((S x2) false)
         (Z true)))))))
(define-fun
  barbar
  ((x Bool) (y Bool)) Bool (ite x true y))
(define-fun-rec
  elem
  ((x Nat) (y list)) Bool
  (match y
    ((nil false)
     ((cons z xs) (barbar (eqNat x z) (elem x xs))))))
(define-fun-rec
  union2
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs)
      (ite (elem z y) (union2 xs y) (cons z (union2 xs y)))))))
(assert-not
  (forall ((xs list) (ys list)) (= (union2 xs ys) (union2 ys xs))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (eqNat y x) (= x y))))
(assert-claim
  (forall ((x Bool) (y Bool)) (= (barbar y x) (barbar x y))))
(assert-claim (forall ((x Bool)) (= (barbar x x) x)))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (eqNat y x) (eqNat x y))))
(assert-claim (forall ((x Nat)) (eqNat x x)))
(assert-claim (forall ((x list)) (= (union2 x x) x)))
(assert-claim (forall ((x Bool)) (= x x)))
(assert-claim (forall ((x Bool)) (barbar x true)))
(assert-claim (forall ((x Nat)) (not (elem x nil))))
(assert-claim (forall ((x list)) (= (union2 x nil) x)))
(assert-claim (forall ((x list)) (= (union2 nil x) x)))
(assert-claim (forall ((x Nat)) (not (eqNat x (S x)))))
(assert-claim (forall ((x Nat)) (not (eqNat (S x) Z))))
(assert-claim
  (forall ((x Bool) (y Bool) (z Bool))
    (= (barbar (barbar x y) z) (barbar x (barbar y z)))))
(assert-claim (forall ((x Nat) (y list)) (elem x (cons x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (elem x z) (= (elem y (cons x z)) (elem y z)))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (= (elem x (union2 z y)) (elem x (union2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (elem x z) (elem x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (=> (elem x z) (elem x (union2 y z)))))
(assert-claim
  (forall ((x Nat) (y list)) (= (union2 y (cons x y)) (cons x y))))
(assert-claim
  (forall ((x list) (y list))
    (= (union2 x (union2 x y)) (union2 x y))))
(assert-claim
  (forall ((x list) (y list))
    (= (union2 y (union2 x y)) (union2 x y))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (=> (elem x z) (= (union2 (cons x y) z) (union2 y z)))))
(assert-claim
  (forall ((x list) (y list) (z list))
    (= (union2 (union2 x y) z) (union2 x (union2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (eqNat x y) (elem x (cons y nil)))))
(assert-claim (forall ((x Nat)) (not (eqNat x (S (S x))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (eqNat (S x) (S y)) (eqNat x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (union2 (cons x nil) y) (union2 (cons x y) y))))
(assert-claim
  (forall ((x Nat) (y list)) (= (elem x (cons (S x) y)) (elem x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (elem (S x) (cons x y)) (elem (S x) y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (elem (S x) (cons Z y)) (elem (S x) y))))
(assert-claim
  (forall ((x Nat) (y list)) (= (elem Z (cons (S x) y)) (elem Z y))))
(assert-claim (forall ((x Nat)) (not (eqNat x (S (S (S x)))))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (= (barbar (elem x y) (elem x z)) (elem x (union2 y z)))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (= (union2 y (cons x (union2 y z))) (cons x (union2 y z)))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (= (union2 (cons x (union2 z y)) z) (union2 (cons x y) z))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (= (union2 (cons x (union2 y z)) z) (union2 (cons x y) z))))
(assert-claim (forall ((x Nat)) (not (eqNat x (S (S (S (S x))))))))
