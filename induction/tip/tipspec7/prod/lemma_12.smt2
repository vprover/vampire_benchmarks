(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(define-fun-rec
  <=2
  ((x Nat) (y Nat)) Bool
  (match x
    ((Z true)
     ((S z)
      (match y
        ((Z false)
         ((S x2) (<=2 z x2))))))))
(define-fun-rec
  insert2
  ((x Nat) (y list)) list
  (match y
    ((nil (cons x nil))
     ((cons z xs)
      (ite (<=2 x z) (cons x (cons z xs)) (cons z (insert2 x xs)))))))
(define-fun
  &&
  ((x Bool) (y Bool)) Bool (ite x y false))
(define-fun-rec
  sorted
  ((x list)) Bool
  (match x
    ((nil true)
     ((cons y z)
      (match z
        ((nil true)
         ((cons y2 xs) (&& (<=2 y y2) (sorted (cons y2 xs))))))))))
(assert-not
  (forall ((x Nat) (y list)) (=> (sorted y) (sorted (insert2 x y)))))
(assert-claim
  (forall ((x Bool) (y Bool) (z Bool))
    (=> (&& y z) (=> (&& z x) (= y z)))))
(assert-claim (forall ((x Bool) (y Bool)) (=> (&& y x) (= x y))))
(assert-claim (forall ((x Bool) (y Bool)) (=> (&& y x) y)))
(assert-claim
  (forall ((x Bool) (y Bool)) (=> (&& y x) (= (sorted nil) y))))
(assert-claim (forall ((x Bool) (y Bool)) (= (&& y x) (&& x y))))
(assert-claim (forall ((x Bool)) (= (&& x x) x)))
(assert-claim
  (forall ((x Bool) (y Bool) (z Bool)) (=> (&& y x) (= (&& z y) z))))
(assert-claim
  (forall ((x Bool) (y Nat) (z Bool)) (=> (&& z x) (= (<=2 y y) z))))
(assert-claim (forall ((x Bool)) (not (&& x false))))
(assert-claim
  (forall ((x Bool) (y Nat) (z Bool)) (=> (&& z x) (= (<=2 Z y) z))))
(assert-claim (forall ((x Nat)) (= (insert2 x nil) (cons x nil))))
(assert-claim (forall ((x list)) (= (insert2 Z x) (cons Z x))))
(assert-claim
  (forall ((x Bool) (y Nat) (z Bool))
    (=> (&& z x) (= (<=2 y (S y)) z))))
(assert-claim
  (forall ((x Bool) (y Nat) (z Nat) (x2 Bool))
    (=> (&& x2 x) (=> (<=2 y z) (= (<=2 y (S z)) x2)))))
(assert-claim (forall ((x Nat)) (not (<=2 (S x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (<=2 y x) (not (<=2 (S x) y)))))
(assert-claim
  (forall ((x Nat) (y list)) (= (sorted (insert2 x y)) (sorted y))))
(assert-claim
  (forall ((x Bool) (y Bool) (z Bool))
    (= (&& (&& x y) z) (&& x (&& y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 x (cons x y)) (cons x (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (insert2 y (insert2 x z)) (insert2 x (insert2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 x y) (= (insert2 x (cons y z)) (cons x (cons y z))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<=2 (S x) (S y)) (<=2 x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 (S x) (cons x y)) (cons x (insert2 (S x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 x y)
      (= (insert2 (S y) (cons x z)) (cons x (insert2 (S y) z))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (sorted (cons x (insert2 x y))) (sorted (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 y x)
      (= (sorted (cons y (insert2 x z))) (sorted (cons y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 y x)
      (= (sorted (cons x (insert2 y z))) (sorted (cons x (cons y z)))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (<=2 x y) (sorted (cons x (cons y nil))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (sorted (cons x (cons Z y))) (&& (<=2 x Z) (sorted y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (&& (<=2 y x) (<=2 y Z)) (<=2 y Z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (&& (<=2 y x) (<=2 x Z)) (&& (<=2 x y) (<=2 y Z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (&& (sorted y) (sorted (cons x y))) (sorted (cons x y)))))
(assert-claim
  (forall ((x Nat) (y list)) (not (sorted (cons (S x) (cons x y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (&& (<=2 x Z) (<=2 y Z)) (&& (<=2 x y) (<=2 y Z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 (S Z) (cons (S x) y)) (cons (S Z) (cons (S x) y)))))
