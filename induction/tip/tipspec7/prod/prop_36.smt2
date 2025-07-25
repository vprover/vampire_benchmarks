(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(define-fun
  barbar
  ((x Bool) (y Bool)) Bool (ite x true y))
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
     ((cons z xs) (barbar (== x z) (elem x xs))))))
(define-fun-rec
  ++2
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z xs) (cons2 z (++2 xs y))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(assert-not
  (forall ((x Nat) (y list) (z list))
    (=> (elem x y) (elem x (++ y z)))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (== y x) (= x y))))
(assert-claim (forall ((x Nat) (y Nat)) (= (== y x) (== x y))))
(assert-claim (forall ((x Nat)) (== x x)))
(assert-claim
  (forall ((x Bool) (y Bool)) (= (barbar y x) (barbar x y))))
(assert-claim (forall ((x Bool)) (= (barbar x x) x)))
(assert-claim (forall ((y list2)) (= (++2 y nil2) y)))
(assert-claim (forall ((y list2)) (= (++2 nil2 y) y)))
(assert-claim (forall ((x Bool)) (= x x)))
(assert-claim (forall ((x Bool)) (barbar x true)))
(assert-claim (forall ((x Nat)) (not (elem x nil))))
(assert-claim (forall ((x Nat)) (not (== x (S x)))))
(assert-claim (forall ((x Nat)) (not (== (S x) Z))))
(assert-claim
  (forall ((y list2) (z list2) (x2 list2))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list2) (x2 list2))
    (= (cons2 y (++2 z x2)) (++2 (cons2 y z) x2))))
(assert-claim
  (forall ((x Bool) (y Bool) (z Bool))
    (= (barbar (barbar x y) z) (barbar x (barbar y z)))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (= (elem x (++ z y)) (elem x (++ y z)))))
(assert-claim
  (forall ((x Nat) (y list)) (= (elem x (++ y y)) (elem x y))))
(assert-claim (forall ((x Nat) (y list)) (elem x (cons x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (elem x z) (= (elem y (cons x z)) (elem y z)))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (=> (elem x z) (elem x (++ y z)))))
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
(assert-claim (forall ((x Nat)) (not (== x (S (S (S x)))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (elem (S x) (cons Z y)) (elem (S x) y))))
(assert-claim
  (forall ((x Nat) (y list)) (= (elem Z (cons (S x) y)) (elem Z y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (barbar (== x y) (elem x z)) (elem x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (= (barbar (elem x y) (elem x z)) (elem x (++ y z)))))
(assert-claim (forall ((x Nat)) (not (== x (S (S (S (S x))))))))
