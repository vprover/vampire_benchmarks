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
  insort
  ((x Nat) (y list)) list
  (match y
    ((nil (cons x nil))
     ((cons z xs)
      (ite (<=2 x z) (cons x (cons z xs)) (cons z (insort x xs)))))))
(define-fun-rec
  sort
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (insort y (sort xs))))))
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
         ((cons y2 ys) (&& (<=2 y y2) (sorted (cons y2 ys))))))))))
(assert-not (forall ((xs list)) (sorted (sort xs))))
(assert-claim (= (sort nil) nil))
(assert-claim
  (forall ((x Bool) (y Bool) (z Bool))
    (=> (&& y z) (=> (&& z x) (= y z)))))
(assert-claim (forall ((x Bool) (y Bool)) (=> (&& y x) (= x y))))
(assert-claim (forall ((x Bool) (y Bool)) (=> (&& y x) y)))
(assert-claim (forall ((x list)) (=> (sorted x) (= (sort x) x))))
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
(assert-claim (forall ((x Nat)) (= (insort x nil) (cons x nil))))
(assert-claim (forall ((x list)) (= (insort Z x) (cons Z x))))
(assert-claim (forall ((x list)) (= (sort (sort x)) (sort x))))
(assert-claim
  (forall ((x Bool) (y list) (z Bool))
    (=> (&& z x) (= (sorted (sort y)) z))))
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
  (forall ((x Nat) (y list))
    (= (sort (cons x y)) (insort x (sort y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (sort (insort x y)) (insort x (sort y)))))
(assert-claim
  (forall ((x Nat) (y list)) (= (sorted (insort x y)) (sorted y))))
(assert-claim
  (forall ((x Bool) (y Bool) (z Bool))
    (= (&& (&& x y) z) (&& x (&& y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insort x (cons x y)) (cons x (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (insort y (insort x z)) (insort x (insort y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 x y) (= (insort x (cons y z)) (cons x (cons y z))))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (<=2 (S x) (S y)) (<=2 x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insort (S x) (cons x y)) (cons x (insort (S x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 x y)
      (= (insort (S y) (cons x z)) (cons x (insort (S y) z))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (sorted (cons x (insort x y))) (sorted (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 y x)
      (= (sorted (cons y (insort x z))) (sorted (cons y z))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (<=2 y x)
      (= (sorted (cons x (insort y z))) (sorted (cons x (cons y z)))))))
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
    (= (insort (S Z) (cons (S x) y)) (cons (S Z) (cons (S x) y)))))
