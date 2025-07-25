(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 Int) (tail2 list2))))
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-datatype
  Tree2
  ((Node2 (proj1-Node2 Tree2) (proj2-Node2 Int) (proj3-Node2 Tree2))
   (Nil2)))
(declare-datatype
  Tree
  ((Node (proj1-Node Tree) (proj2-Node sk) (proj3-Node Tree)) (Nil)))
(define-fun-rec
  swap
  ((x Int) (y Int) (z Tree2)) Tree2
  (match z
    (((Node2 p x2 q)
      (ite
        (= x2 x) (Node2 (swap x y p) y (swap x y q))
        (ite
          (= x2 y) (Node2 (swap x y p) x (swap x y q))
          (Node2 (swap x y p) x2 (swap x y q)))))
     (Nil2 Nil2))))
(define-fun-rec
  elem2
  ((x Int) (y list2)) Bool
  (match y
    ((nil2 false)
     ((cons2 z xs) (or (= z x) (elem2 x xs))))))
(define-fun-rec
  elem
  ((x sk) (y list)) Bool
  (match y
    ((nil false)
     ((cons z xs) (or (= z x) (elem x xs))))))
(define-fun-rec
  ++2
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z xs) (cons2 z (++2 xs y))))))
(define-fun-rec
  flatten02
  ((x Tree2)) list2
  (match x
    (((Node2 p y q)
      (++2 (flatten02 p) (++2 (cons2 y nil2) (flatten02 q))))
     (Nil2 nil2))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(define-fun-rec
  flatten0
  ((x Tree)) list
  (match x
    (((Node p y q) (++ (flatten0 p) (++ (cons y nil) (flatten0 q))))
     (Nil nil))))
(assert-not
  (forall ((p Tree2) (a Int) (b Int))
    (=> (elem2 a (flatten02 p))
      (=> (elem2 b (flatten02 p))
        (and (elem2 a (flatten02 (swap a b p)))
          (elem2 b (flatten02 (swap a b p))))))))
(assert-claim (= (flatten0 Nil) nil))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim (forall ((y sk)) (not (elem y nil))))
(assert-claim
  (forall ((x Int) (y Int) (z Tree2)) (= (swap y x z) (swap x y z))))
(assert-claim (forall ((x Int) (y Tree2)) (= (swap x x y) y)))
(assert-claim (forall ((x Int) (y Int)) (= (swap x y Nil2) Nil2)))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++ (++ y z) x2) (++ y (++ z x2)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (cons y (++ z x2)) (++ (cons y z) x2))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (elem y (++ x2 z)) (elem y (++ z x2)))))
(assert-claim
  (forall ((y sk) (z list)) (= (elem y (++ z z)) (elem y z))))
(assert-claim (forall ((y sk) (z list)) (elem y (cons y z))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list))
    (=> (elem y x2) (= (elem z (cons y x2)) (elem z x2)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (=> (elem y x2) (elem y (++ z x2)))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (elem z (cons y nil)) (elem y (cons z nil)))))
(assert-claim
  (forall ((y sk) (z Tree))
    (= (flatten0 (Node Nil y z)) (cons y (flatten0 z)))))
(assert-claim
  (forall ((y Tree) (z sk))
    (= (++ (flatten0 y) (cons z nil)) (flatten0 (Node y z Nil)))))
(assert-claim
  (forall ((x Int) (y Int) (z Tree2)) (= (swap x y (swap x y z)) z)))
(assert-claim
  (forall ((y sk) (z list) (x2 list) (x3 list))
    (= (elem y (++ z (++ x3 x2))) (elem y (++ z (++ x2 x3))))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (elem y (++ z (++ z x2))) (elem y (++ z x2)))))
(assert-claim
  (forall ((y sk) (z Tree) (x2 sk) (x3 Tree))
    (= (elem y (flatten0 (Node x3 x2 z)))
      (elem y (flatten0 (Node z x2 x3))))))
(assert-claim
  (forall ((y Tree) (z sk) (x2 Tree))
    (elem z (flatten0 (Node y z x2)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 Tree))
    (= (elem y (flatten0 (Node x2 z x2)))
      (elem y (cons z (flatten0 x2))))))
(assert-claim
  (forall ((x Int) (y Tree2) (z Int))
    (= (swap x z (Node2 y x Nil2)) (Node2 (swap x z y) z Nil2))))
(assert-claim
  (forall ((x Int) (y Int) (z Tree2))
    (= (swap x y (Node2 Nil2 x z)) (Node2 Nil2 y (swap x y z)))))
(assert-claim
  (forall ((y Tree) (z sk) (x2 Tree))
    (= (++ (flatten0 y) (cons z (flatten0 x2)))
      (flatten0 (Node y z x2)))))
