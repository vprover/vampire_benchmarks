(declare-sort sk 0)
(declare-datatype
  Tree
  ((Leaf)
   (Node (proj1-Node Tree) (proj2-Node sk) (proj3-Node Tree))))
(declare-datatype Nat ((Z) (S (proj1-S Nat))))
(define-fun-rec
  mirror
  ((x Tree)) Tree
  (match x
    ((Leaf Leaf)
     ((Node l y r) (Node (mirror r) y (mirror l))))))
(define-fun-rec
  max
  ((x Nat) (y Nat)) Nat
  (match x
    ((Z y)
     ((S z)
      (match y
        ((Z (S z))
         ((S x2) (S (max z x2)))))))))
(define-fun-rec
  height
  ((x Tree)) Nat
  (match x
    ((Leaf Z)
     ((Node l y r) (S (max (height l) (height r)))))))
(assert-not
  (forall ((a1 Tree)) (= (height (mirror a1)) (height a1))))
(assert-claim (= (mirror Leaf) Leaf))
(assert-claim (= (height Leaf) Z))
(assert-claim (forall ((x Nat) (y Nat)) (= (max y x) (max x y))))
(assert-claim (forall ((x Nat)) (= (max x x) x)))
(assert-claim
  (forall ((y Tree)) (= (height (mirror y)) (height y))))
(assert-claim (forall ((x Nat)) (= (max x Z) x)))
(assert-claim (forall ((y Tree)) (= (mirror (mirror y)) y)))
(assert-claim (forall ((x Nat)) (= (max x (S x)) (S x))))
(assert-claim
  (forall ((y sk) (z Tree) (x2 sk) (x3 Tree))
    (= (height (Node z y x3)) (height (Node z x2 x3)))))
(assert-claim
  (forall ((y Tree) (z sk) (x2 Tree))
    (= (height (Node x2 z y)) (height (Node y z x2)))))
(assert-claim
  (forall ((y sk) (z Tree))
    (= (height (Node z y z)) (S (height z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (max (max x y) z) (max x (max y z)))))
(assert-claim
  (forall ((y sk) (z Tree))
    (= (height (Node z y Leaf)) (S (height z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (max (S x) (S y)) (S (max x y)))))
(assert-claim
  (forall ((y sk) (z Tree))
    (= (mirror (Node z y Leaf)) (Node Leaf y (mirror z)))))
(assert-claim
  (forall ((y Tree) (z sk) (x2 Tree))
    (= (Node (mirror x2) z (mirror y)) (mirror (Node y z x2)))))
(assert-claim
  (forall ((y Tree) (z sk) (x2 Tree))
    (= (height (Node y z (mirror x2))) (height (Node y z x2)))))
(assert-claim
  (forall ((y Tree) (z sk) (x2 Tree))
    (= (S (max (height y) (height x2))) (height (Node y z x2)))))
