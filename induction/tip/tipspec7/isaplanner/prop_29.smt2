(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
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
  elem
  ((x Nat) (y list)) Bool
  (match y
    ((nil false)
     ((cons z xs) (ite (== x z) true (elem x xs))))))
(define-fun-rec
  ins1
  ((x Nat) (y list)) list
  (match y
    ((nil (cons x nil))
     ((cons z xs) (ite (== x z) (cons z xs) (cons z (ins1 x xs)))))))
(assert-not (forall ((x Nat) (xs list)) (elem x (ins1 x xs))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (== y x) (= x y))))
(assert-claim (forall ((x Nat) (y Nat)) (= (== y x) (== x y))))
(assert-claim (forall ((x Nat)) (== x x)))
(assert-claim
  (forall ((x Nat) (y list)) (=> (elem x y) (= (ins1 x y) y))))
(assert-claim (forall ((x Nat)) (not (elem x nil))))
(assert-claim (forall ((x Nat)) (= (ins1 x nil) (cons x nil))))
(assert-claim (forall ((x Nat)) (not (== x (S x)))))
(assert-claim (forall ((x Nat)) (not (== (S x) Z))))
(assert-claim (forall ((x Nat) (y list)) (elem x (cons x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (elem x z) (= (elem y (cons x z)) (elem y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (elem x (ins1 y z)) (elem x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (elem x z) (elem x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (elem x z) (= (ins1 y (cons x z)) (cons x (ins1 y z))))))
(assert-claim
  (forall ((x Nat) (y list)) (= (ins1 x (ins1 x y)) (ins1 x y))))
(assert-claim (forall ((x Nat)) (not (== x (S (S x))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== (S x) (S y)) (== x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== x y) (elem x (cons y nil)))))
(assert-claim
  (forall ((x Nat) (y list)) (= (elem x (cons (S x) y)) (elem x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (elem (S x) (cons x y)) (elem (S x) y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ins1 x (cons (S x) y)) (cons (S x) (ins1 x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ins1 (S x) (cons x y)) (cons x (ins1 (S x) y)))))
(assert-claim (forall ((x Nat)) (not (== x (S (S (S x)))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (elem (S x) (cons Z y)) (elem (S x) y))))
(assert-claim
  (forall ((x Nat) (y list)) (= (elem Z (cons (S x) y)) (elem Z y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ins1 (S x) (cons Z y)) (cons Z (ins1 (S x) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ins1 Z (cons (S x) y)) (cons (S x) (ins1 Z y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (= (elem x (cons z (cons y x2))) (elem x (cons y (cons z x2))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (= (elem x (cons y (ins1 z x2))) (elem x (cons y (cons z x2))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (ins1 y (cons x (ins1 y z))) (cons x (ins1 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (ins1 x (cons y (ins1 y z))) (cons y (ins1 x (ins1 y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (ins1 y (ins1 x (ins1 y z))) (ins1 x (ins1 y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (elem x (cons (S (S x)) y)) (elem x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (elem (S (S x)) (cons x y)) (elem (S (S x)) y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ins1 x (cons (S (S x)) y)) (cons (S (S x)) (ins1 x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ins1 (S (S x)) (cons x y)) (cons x (ins1 (S (S x)) y)))))
(assert-claim (forall ((x Nat)) (not (== x (S (S (S (S x))))))))
