(declare-sort sk 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  len
  ((x list)) Nat
  (match x
    ((nil Z)
     ((cons y xs) (S (len xs))))))
(define-fun-rec
  butlast
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y z)
      (match z
        ((nil nil)
         ((cons x2 x3) (cons y (butlast (cons x2 x3))))))))))
(define-fun-rec
  |-2|
  ((x Nat) (y Nat)) Nat
  (match x
    ((Z Z)
     ((S z)
      (match y
        ((Z (S z))
         ((S x2) (|-2| z x2))))))))
(assert-not
  (forall ((xs list)) (= (len (butlast xs)) (|-2| (len xs) (S Z)))))
(assert-claim (= (len nil) Z))
(assert-claim (= (butlast nil) nil))
(assert-claim (forall ((x Nat)) (= (|-2| x x) Z)))
(assert-claim (forall ((x Nat)) (= (|-2| x Z) x)))
(assert-claim (forall ((x Nat)) (= (|-2| Z x) Z)))
(assert-claim (forall ((x Nat)) (= (|-2| x (S x)) Z)))
(assert-claim (forall ((x Nat)) (= (|-2| (S x) x) (S Z))))
(assert-claim
  (forall ((y sk) (z list)) (= (len (cons y z)) (S (len z)))))
(assert-claim (forall ((y sk)) (= (butlast (cons y nil)) nil)))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| y (|-2| y x)) (|-2| x (|-2| x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (|-2| (|-2| x z) y) (|-2| (|-2| x y) z))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (|-2| (S x) (S y)) (|-2| x y))))
(assert-claim
  (forall ((y list) (z Nat))
    (= (|-2| (len (butlast y)) z) (|-2| (len y) (S z)))))
(assert-claim
  (forall ((y sk) (z list))
    (= (butlast (butlast (cons y z))) (butlast (cons y (butlast z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| (S (|-2| x y)) y) (|-2| (|-2| (S x) y) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| (S (|-2| x y)) x) (|-2| (S (|-2| y x)) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (S (|-2| x (|-2| x y))) (|-2| (S x) (|-2| x y)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list))
    (= (butlast (cons y (cons z x2))) (cons y (butlast (cons z x2))))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (|-2| (|-2| x y) (|-2| z y)) (|-2| (|-2| x z) (|-2| y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| (|-2| x y) (|-2| y x)) (|-2| x y))))
(assert-claim
  (forall ((y Nat) (z list))
    (= (|-2| y (|-2| (S y) (len z)))
      (|-2| y (|-2| y (len (butlast z)))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (|-2| (S (S (|-2| x y))) x) (|-2| (S (S (|-2| y x))) y))))
(assert-claim
  (forall ((x Nat))
    (= (|-2| (S (S (S (S x)))) x) (S (S (S (S Z)))))))
