(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(define-fun-rec
  drop2
  ((x Nat) (y list2)) list2
  (match x
    ((Z y)
     ((S z)
      (match y
        ((nil2 nil2)
         ((cons2 x2 x3) (drop2 z x3))))))))
(define-fun-rec
  drop
  ((x Nat) (y list)) list
  (match x
    ((Z y)
     ((S z)
      (match y
        ((nil nil)
         ((cons x2 x3) (drop z x3))))))))
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
(assert-not
  (forall ((x Nat) (y Nat) (z list))
    (=> (elem x (drop y z)) (elem x z))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (== y x) (= x y))))
(assert-claim (forall ((x Nat) (y Nat)) (= (== y x) (== x y))))
(assert-claim (forall ((x Nat)) (== x x)))
(assert-claim
  (forall ((x Bool) (y Bool)) (= (barbar y x) (barbar x y))))
(assert-claim (forall ((x Bool)) (= (barbar x x) x)))
(assert-claim (forall ((x Bool)) (= x x)))
(assert-claim (forall ((x Bool)) (barbar x true)))
(assert-claim (forall ((y Nat)) (= (drop2 y nil2) nil2)))
(assert-claim (forall ((y list2)) (= (drop2 Z y) y)))
(assert-claim (forall ((x Nat)) (not (elem x nil))))
(assert-claim (forall ((x Nat)) (not (== x (S x)))))
(assert-claim (forall ((x Nat)) (not (== (S x) Z))))
(assert-claim
  (forall ((x Bool) (y Bool) (z Bool))
    (= (barbar (barbar x y) z) (barbar x (barbar y z)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 list2))
    (= (drop2 z (drop2 y x2)) (drop2 y (drop2 z x2)))))
(assert-claim (forall ((x Nat) (y list)) (elem x (cons x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (elem x z) (= (elem y (cons x z)) (elem y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (elem x z) (elem x (cons y z)))))
(assert-claim (forall ((x Nat)) (not (== x (S (S x))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== (S x) (S y)) (== x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (drop x (cons Z y)) (drop x (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== x y) (elem x (cons y nil)))))
(assert-claim
  (forall ((y Nat) (z Nat) (x2 Nat) (x3 list2))
    (=> (== x2 y)
      (= (drop2 x2 (drop2 (S z) x3)) (drop2 z (drop2 (S x2) x3))))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list2))
    (= (drop2 (S z) (cons2 y x2)) (drop2 z x2))))
(assert-claim
  (forall ((x Nat) (y list)) (= (elem x (cons (S x) y)) (elem x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (elem (S x) (cons x y)) (elem (S x) y))))
(assert-claim (forall ((x Nat)) (not (== x (S (S (S x)))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (drop x (cons (S x) y)) (drop x (cons (S Z) y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (elem (S x) (cons Z y)) (elem (S x) y))))
(assert-claim
  (forall ((x Nat) (y list)) (= (elem Z (cons (S x) y)) (elem Z y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (barbar (== x y) (elem x z)) (elem x (cons y z)))))
(assert-claim
  (forall ((y sk) (z Nat) (x2 list2))
    (= (drop2 z (drop2 z (cons2 y x2)))
      (drop2 z (cons2 y (drop2 z x2))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (= (elem x (cons z (cons y x2))) (elem x (cons y (cons z x2))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (elem z (drop y (cons x nil))) (elem x (drop y (cons z nil))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (elem x (drop y (cons y nil))) (elem x (drop x (cons y nil))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (elem x (drop y (cons x nil))) (== y Z))))
(assert-claim (forall ((x Nat)) (not (== x (S (S (S (S x))))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (drop x (cons (S (S x)) y)) (drop x (cons (S (S Z)) y)))))
