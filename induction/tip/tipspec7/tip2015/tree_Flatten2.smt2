(declare-sort sk 0)
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-datatype
  Tree
  ((Node (proj1-Node Tree) (proj2-Node sk) (proj3-Node Tree)) (Nil)))
(define-fun-rec
  flatten2
  ((x Tree) (y list)) list
  (match x
    (((Node p z q) (flatten2 p (cons z (flatten2 q y))))
     (Nil y))))
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
(assert-not (forall ((p Tree)) (= (flatten2 p nil) (flatten0 p))))
(assert-claim (= (flatten0 Nil) nil))
(assert-claim (forall ((y list)) (= (++ y nil) y)))
(assert-claim (forall ((y list)) (= (++ nil y) y)))
(assert-claim
  (forall ((y Tree)) (= (flatten2 y nil) (flatten0 y))))
(assert-claim (forall ((y list)) (= (flatten2 Nil y) y)))
(assert-claim
  (forall ((y Tree) (z list))
    (= (++ (flatten0 y) z) (flatten2 y z))))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++ (++ y z) x2) (++ y (++ z x2)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (cons y (++ z x2)) (++ (cons y z) x2))))
(assert-claim
  (forall ((y sk) (z Tree))
    (= (flatten0 (Node Nil y z)) (cons y (flatten0 z)))))
(assert-claim
  (forall ((y Tree) (z sk))
    (= (flatten2 y (cons z nil)) (flatten0 (Node y z Nil)))))
(assert-claim
  (forall ((y Tree) (z sk) (x2 Tree))
    (= (flatten2 y (cons z (flatten0 x2))) (flatten0 (Node y z x2)))))
(assert-claim
  (forall ((y Tree) (z sk) (x2 Tree) (x3 list))
    (= (flatten2 y (cons z (flatten2 x2 x3)))
      (flatten2 (Node y z x2) x3))))
