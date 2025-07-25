(declare-datatype list ((nil) (cons (head Int) (tail list))))
(declare-datatype
  Tree
  ((TNode (proj1-TNode Tree) (proj2-TNode Int) (proj3-TNode Tree))
   (TNil)))
(define-fun-rec
  insert2
  ((x Int) (y list)) list
  (match y
    ((nil (cons x nil))
     ((cons z xs)
      (ite (<= x z) (cons x (cons z xs)) (cons z (insert2 x xs)))))))
(define-fun-rec
  isort
  ((x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (insert2 y (isort xs))))))
(define-fun-rec
  flatten
  ((x Tree) (y list)) list
  (match x
    (((TNode p z q) (flatten p (cons z (flatten q y))))
     (TNil y))))
(define-fun-rec
  add
  ((x Int) (y Tree)) Tree
  (match y
    (((TNode p z q)
      (ite (<= x z) (TNode (add x p) z q) (TNode p z (add x q))))
     (TNil (TNode TNil x TNil)))))
(define-fun-rec
  toTree
  ((x list)) Tree
  (match x
    ((nil TNil)
     ((cons y xs) (add y (toTree xs))))))
(define-fun
  tsort
  ((x list)) list (flatten (toTree x) nil))
(assert-not (forall ((xs list)) (= (tsort xs) (isort xs))))
(assert-claim (= (isort nil) nil))
(assert-claim (= (toTree nil) TNil))
(assert-claim (forall ((x list)) (= (isort x) (tsort x))))
(assert-claim (forall ((x list)) (= (flatten TNil x) x)))
(assert-claim (forall ((x Int)) (= (insert2 x nil) (cons x nil))))
(assert-claim (forall ((x list)) (= (isort (isort x)) (isort x))))
(assert-claim
  (forall ((x Int) (y list))
    (= (isort (cons x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x Int) (y list))
    (= (isort (insert2 x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x Int) (y list))
    (= (toTree (cons x y)) (add x (toTree y)))))
(assert-claim
  (forall ((x Int)) (= (add x TNil) (TNode TNil x TNil))))
(assert-claim
  (forall ((x list)) (= (isort x) (flatten (toTree x) nil))))
(assert-claim
  (forall ((x Int) (y list))
    (= (insert2 x (cons x y)) (cons x (cons x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (= (insert2 y (insert2 x z)) (insert2 x (insert2 y z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (=> (<= x y) (= (insert2 x (cons y z)) (cons x (cons y z))))))
(assert-claim
  (forall ((x Int) (y list))
    (= (flatten (add x TNil) y) (cons x y))))
(assert-claim
  (forall ((x list) (y list))
    (= (flatten (toTree (isort x)) y) (flatten (toTree x) y))))
(assert-claim
  (forall ((x Tree) (y list))
    (= (isort (flatten x (isort y))) (isort (flatten x y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (isort (flatten (toTree y) x)) (isort (flatten (toTree x) y)))))
(assert-claim
  (forall ((x Tree) (y Int) (z Tree))
    (= (add y (TNode x y z)) (TNode (add y x) y z))))
(assert-claim
  (forall ((x Int) (y Tree) (z Int) (x2 Tree))
    (=> (<= x z) (= (add x (TNode y z x2)) (TNode (add x y) z x2)))))
(assert-claim
  (forall ((x Tree) (y Int) (z list))
    (= (flatten (TNode x y TNil) z) (flatten x (cons y z)))))
(assert-claim
  (forall ((x Int) (y Tree) (z list))
    (= (flatten (TNode TNil x y) z) (cons x (flatten y z)))))
(assert-claim
  (forall ((x Int) (y Tree) (z list))
    (= (isort (flatten y (cons x z)))
      (insert2 x (isort (flatten y z))))))
(assert-claim
  (forall ((x Int) (y Tree) (z list))
    (= (isort (flatten (add x y) z))
      (insert2 x (isort (flatten y z))))))
(assert-claim
  (forall ((x Tree) (y Int) (z Tree) (x2 list))
    (= (flatten x (cons y (flatten z x2)))
      (flatten (TNode x y z) x2))))
(assert-claim
  (forall ((x Tree) (y list) (z list))
    (= (isort (flatten (toTree y) (flatten x z)))
      (isort (flatten x (flatten (toTree y) z))))))
(assert-claim
  (forall ((x Int) (y list))
    (= (toTree (flatten (add x (toTree y)) y))
      (add x (toTree (flatten (toTree y) y))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (insert2 x (cons y nil)) (flatten (add x (add y TNil)) nil))))
