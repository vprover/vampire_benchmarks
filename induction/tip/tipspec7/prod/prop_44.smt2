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
  intersect2
  ((x list) (y list)) list
  (match x
    ((nil nil)
     ((cons z xs)
      (ite (elem z y) (cons z (intersect2 xs y)) (intersect2 xs y))))))
(assert-not
  (forall ((x Nat) (y list) (z list))
    (=> (elem x y) (=> (elem x z) (elem x (intersect2 y z))))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (== y x) (= x y))))
(assert-claim (forall ((x Nat) (y Nat)) (= (== y x) (== x y))))
(assert-claim (forall ((x Nat)) (== x x)))
(assert-claim
  (forall ((x Bool) (y Bool)) (= (barbar y x) (barbar x y))))
(assert-claim (forall ((x Bool)) (= (barbar x x) x)))
(assert-claim (forall ((x list)) (= (intersect2 x x) x)))
(assert-claim (forall ((x Bool)) (= x x)))
(assert-claim (forall ((x Bool)) (barbar x true)))
(assert-claim (forall ((x Nat)) (not (elem x nil))))
(assert-claim (forall ((x list)) (= (intersect2 x nil) nil)))
(assert-claim (forall ((x list)) (= (intersect2 nil x) nil)))
(assert-claim (forall ((x Nat)) (not (== x (S x)))))
(assert-claim (forall ((x Nat)) (not (== (S x) Z))))
(assert-claim
  (forall ((x Bool) (y Bool) (z Bool))
    (= (barbar (barbar x y) z) (barbar x (barbar y z)))))
(assert-claim (forall ((x Nat) (y list)) (elem x (cons x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (elem x z) (= (elem y (cons x z)) (elem y z)))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (= (elem x (intersect2 z y)) (elem x (intersect2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (elem x z) (elem x (cons y z)))))
(assert-claim
  (forall ((x list) (y Nat) (z list))
    (=> (elem y x) (= (elem y (intersect2 z x)) (elem y z)))))
(assert-claim
  (forall ((x Nat) (y list)) (= (intersect2 y (cons x y)) y)))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (=> (elem x z) (= (intersect2 y (cons x z)) (intersect2 y z)))))
(assert-claim
  (forall ((x list) (y list) (z list))
    (= (intersect2 x (intersect2 z y))
      (intersect2 x (intersect2 y z)))))
(assert-claim
  (forall ((x list) (y list))
    (= (intersect2 x (intersect2 x y)) (intersect2 x y))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (=> (elem x z)
      (= (intersect2 (cons x y) z) (cons x (intersect2 y z))))))
(assert-claim
  (forall ((x list) (y list) (z list))
    (= (intersect2 (intersect2 x y) z)
      (intersect2 x (intersect2 y z)))))
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
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (= (elem x (cons z (cons y x2))) (elem x (cons y (cons z x2))))))
(assert-claim
  (forall ((x list) (y Nat) (z Nat) (x2 list))
    (= (intersect2 x (cons z (cons y x2)))
      (intersect2 x (cons y (cons z x2))))))
(assert-claim
  (forall ((x list) (y Nat) (z list) (x2 list))
    (= (intersect2 x (cons y (intersect2 x2 z)))
      (intersect2 x (cons y (intersect2 z x2))))))
(assert-claim
  (forall ((x list) (y Nat) (z list))
    (= (intersect2 x (cons y (intersect2 x z)))
      (intersect2 x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (= (intersect2 (cons x (intersect2 y z)) z)
      (intersect2 (cons x y) z))))
(assert-claim
  (forall ((x Nat) (y list) (z Nat))
    (= (elem z (intersect2 y (cons x nil)))
      (elem x (intersect2 y (cons z nil))))))
(assert-claim (forall ((x Nat)) (not (== x (S (S (S (S x))))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (intersect2 (cons y nil) (cons x nil))
      (intersect2 (cons x nil) (cons y nil)))))
