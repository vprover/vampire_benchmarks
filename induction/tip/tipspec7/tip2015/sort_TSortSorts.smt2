(declare-datatype list ((nil) (cons (head Int) (tail list))))
(declare-datatype
  Tree
  ((TNode (proj1-TNode Tree) (proj2-TNode Int) (proj3-TNode Tree))
   (TNil)))
(define-fun-rec
  ordered
  ((x list)) Bool
  (match x
    ((nil true)
     ((cons y z)
      (match z
        ((nil true)
         ((cons y2 xs) (and (<= y y2) (ordered (cons y2 xs))))))))))
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
(assert-not (forall ((xs list)) (ordered (tsort xs))))
(assert-claim (ordered nil))
(assert-claim (= (toTree nil) TNil))
(assert-claim (forall ((x list)) (=> (ordered x) (= (tsort x) x))))
(assert-claim (forall ((x list)) (= (flatten TNil x) x)))
(assert-claim (forall ((x list)) (ordered (tsort x))))
(assert-claim
  (forall ((x Int) (y list))
    (= (toTree (cons x y)) (add x (toTree y)))))
(assert-claim
  (forall ((x Int)) (= (add x TNil) (TNode TNil x TNil))))
(assert-claim
  (forall ((x list)) (= (tsort x) (flatten (toTree x) nil))))
(assert-claim (forall ((x Int)) (ordered (cons x nil))))
(assert-claim
  (forall ((x Int) (y list))
    (= (flatten (add x TNil) y) (cons x y))))
(assert-claim
  (forall ((x list) (y list))
    (= (flatten (toTree (tsort x)) y) (flatten (toTree x) y))))
(assert-claim
  (forall ((x Int) (y list))
    (= (tsort (cons x (tsort y))) (tsort (cons x y)))))
(assert-claim
  (forall ((x Tree) (y list))
    (= (tsort (flatten x (tsort y))) (tsort (flatten x y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (tsort (flatten (toTree y) x)) (tsort (flatten (toTree x) y)))))
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
  (forall ((x Int) (y list))
    (= (ordered (cons x (cons x y))) (ordered (cons x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (=> (<= x y)
      (= (ordered (cons x (cons y z))) (ordered (cons y z))))))
(assert-claim
  (forall ((x Int) (y Int) (z Int) (x2 list))
    (=> (<= z x)
      (= (tsort (cons z (cons y x2))) (tsort (cons y (cons z x2)))))))
(assert-claim
  (forall ((x Int) (y Tree) (z list))
    (= (tsort (flatten y (cons x z))) (tsort (cons x (flatten y z))))))
(assert-claim
  (forall ((x Int) (y Tree) (z list))
    (= (tsort (flatten (add x y) z)) (tsort (cons x (flatten y z))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (ordered (cons x (cons y nil))) (<= x y))))
(assert-claim
  (forall ((x Int) (y Tree))
    (= (ordered (flatten (add x y) nil)) (ordered (flatten y nil)))))
(assert-claim
  (forall ((x list))
    (= (ordered (flatten (toTree x) (tsort x)))
      (ordered (flatten (toTree x) x)))))
(assert-claim
  (forall ((x Int))
    (= (tsort (cons x (cons x nil))) (cons x (cons x nil)))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (<= x y)
      (= (tsort (cons x (cons y nil))) (cons x (cons y nil))))))
(assert-claim
  (forall ((x Tree) (y Int) (z Tree) (x2 list))
    (= (flatten x (cons y (flatten z x2)))
      (flatten (TNode x y z) x2))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (= (flatten (add y (add x TNil)) z)
      (flatten (add x (add y TNil)) z))))
(assert-claim
  (forall ((x Int) (y list))
    (= (ordered (cons x (tsort (cons x y))))
      (ordered (cons x (tsort y))))))
(assert-claim
  (forall ((x Tree) (y list))
    (= (ordered (flatten x (tsort (flatten x y))))
      (ordered (flatten x (flatten x (tsort y)))))))
(assert-claim
  (forall ((x Int) (y list))
    (= (ordered (flatten (add x (toTree y)) y))
      (ordered (cons x (flatten (toTree y) y))))))
(assert-claim
  (forall ((x Int) (y list))
    (= (toTree (flatten (add x (toTree y)) y))
      (add x (toTree (flatten (toTree y) y))))))
(assert-claim
  (forall ((x Tree) (y list) (z list))
    (= (tsort (flatten (toTree y) (flatten x z)))
      (tsort (flatten x (flatten (toTree y) z))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (tsort (cons x (cons y nil)))
      (flatten (add x (add y TNil)) nil))))
