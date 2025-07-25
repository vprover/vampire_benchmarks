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
(define-fun
  &&
  ((x Bool) (y Bool)) Bool (ite x y false))
(define-fun-rec
  subset2
  ((x list) (y list)) Bool
  (match x
    ((nil true)
     ((cons z xs) (&& (elem z y) (subset2 xs y))))))
(assert-not
  (forall ((x list) (y list))
    (=> (subset2 x y) (= (intersect2 x y) x))))
(assert-claim
  (forall ((x Bool) (y Bool) (z Bool))
    (=> (&& y z) (=> (&& z x) (= y z)))))
(assert-claim (forall ((x Bool) (y Bool)) (=> (&& y x) (= x y))))
(assert-claim (forall ((x Nat) (y Nat)) (=> (== y x) (= x y))))
(assert-claim (forall ((x Bool) (y Bool)) (=> (&& y x) y)))
(assert-claim (forall ((x Bool) (y Bool)) (= (&& y x) (&& x y))))
(assert-claim (forall ((x Bool)) (= (&& x x) x)))
(assert-claim
  (forall ((x Bool) (y Bool) (z Bool)) (=> (&& y x) (= (&& z y) z))))
(assert-claim (forall ((x Nat) (y Nat)) (= (== y x) (== x y))))
(assert-claim
  (forall ((x Bool) (y Nat) (z Bool)) (=> (&& z x) (= (== y y) z))))
(assert-claim
  (forall ((x Bool) (y Bool)) (= (barbar y x) (barbar x y))))
(assert-claim (forall ((x Bool)) (= (barbar x x) x)))
(assert-claim
  (forall ((x Bool) (y Bool) (z Bool))
    (=> (&& z x) (= (barbar y z) z))))
(assert-claim (forall ((x list)) (= (intersect2 x x) x)))
(assert-claim
  (forall ((x list) (y list))
    (=> (subset2 y x) (= (intersect2 y x) y))))
(assert-claim
  (forall ((x Bool) (y list) (z Bool))
    (=> (&& z x) (= (subset2 y y) z))))
(assert-claim (forall ((x Bool)) (not (&& x false))))
(assert-claim (forall ((x Bool)) (= x x)))
(assert-claim (forall ((x Nat)) (not (elem x nil))))
(assert-claim (forall ((x list)) (= (intersect2 x nil) nil)))
(assert-claim (forall ((x list)) (= (intersect2 nil x) nil)))
(assert-claim
  (forall ((x Bool) (y list) (z Bool))
    (=> (&& z x) (= (subset2 nil y) z))))
(assert-claim
  (forall ((x Nat) (y list)) (=> (elem x y) (not (subset2 y nil)))))
(assert-claim (forall ((x Nat)) (not (== x (S x)))))
(assert-claim (forall ((x Nat)) (not (== (S x) Z))))
(assert-claim
  (forall ((x Bool) (y Bool) (z Bool))
    (= (&& (&& x y) z) (&& x (&& y z)))))
(assert-claim
  (forall ((x Bool) (y Bool)) (= (&& y (barbar y x)) y)))
(assert-claim
  (forall ((x Bool) (y Bool)) (= (barbar y (&& y x)) y)))
(assert-claim
  (forall ((x Bool) (y Bool) (z Bool))
    (= (barbar (barbar x y) z) (barbar x (barbar y z)))))
(assert-claim
  (forall ((x Bool) (y Bool) (z Bool))
    (=> (barbar x z) (= (barbar (&& y x) z) (barbar y z)))))
(assert-claim
  (forall ((x Bool) (y Nat) (z list) (x2 Bool))
    (=> (&& x2 x) (= (elem y (cons y z)) x2))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (elem x z) (= (elem y (cons x z)) (elem y z)))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (= (elem x (intersect2 z y)) (elem x (intersect2 y z)))))
(assert-claim
  (forall ((x Bool) (y Nat) (z Nat) (x2 list) (x3 Bool))
    (=> (&& x3 x) (=> (elem y x2) (= (elem y (cons z x2)) x3)))))
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
(assert-claim
  (forall ((x Bool) (y Nat) (z list) (x2 Bool))
    (=> (&& x2 x) (= (subset2 z (cons y z)) x2))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (=> (elem x z) (= (subset2 y (cons x z)) (subset2 y z)))))
(assert-claim
  (forall ((x list) (y list) (z list))
    (= (subset2 x (intersect2 z y)) (subset2 x (intersect2 y z)))))
(assert-claim
  (forall ((x list) (y list))
    (= (subset2 x (intersect2 x y)) (subset2 x y))))
(assert-claim
  (forall ((x Nat) (y list)) (= (elem x y) (subset2 (cons x y) y))))
(assert-claim
  (forall ((x list) (y Nat) (z list))
    (=> (subset2 x z) (= (subset2 (cons y x) z) (elem y z)))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (=> (elem x z) (= (subset2 (cons x y) z) (subset2 y z)))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (=> (elem x y) (= (subset2 (cons x y) z) (subset2 y z)))))
(assert-claim
  (forall ((x list) (y list) (z list))
    (= (subset2 (intersect2 y x) z) (subset2 (intersect2 x y) z))))
(assert-claim (forall ((x Nat)) (not (== x (S (S x))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== (S x) (S y)) (== x y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (== x y) (elem x (cons y nil)))))
(assert-claim
  (forall ((x Nat) (y list) (z list) (x2 list))
    (=> (elem x z)
      (=> (subset2 x2 y) (= (subset2 (cons Z z) x2) (subset2 z x2))))))
