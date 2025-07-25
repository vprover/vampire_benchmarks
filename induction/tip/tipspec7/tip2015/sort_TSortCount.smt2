(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 Int) (tail2 list2))))
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-datatype
  Tree
  ((TNode (proj1-TNode Tree) (proj2-TNode Int) (proj3-TNode Tree))
   (TNil)))
(define-fun-rec
  flatten
  ((x Tree) (y list2)) list2
  (match x
    (((TNode p z q) (flatten p (cons2 z (flatten q y))))
     (TNil y))))
(define-fun-rec
  count2
  ((x Int) (y list2)) Int
  (match y
    ((nil2 0)
     ((cons2 z ys) (ite (= x z) (+ 1 (count2 x ys)) (count2 x ys))))))
(define-fun-rec
  count
  ((x sk) (y list)) Int
  (match y
    ((nil 0)
     ((cons z ys) (ite (= x z) (+ 1 (count x ys)) (count x ys))))))
(define-fun-rec
  add
  ((x Int) (y Tree)) Tree
  (match y
    (((TNode p z q)
      (ite (<= x z) (TNode (add x p) z q) (TNode p z (add x q))))
     (TNil (TNode TNil x TNil)))))
(define-fun-rec
  toTree
  ((x list2)) Tree
  (match x
    ((nil2 TNil)
     ((cons2 y xs) (add y (toTree xs))))))
(define-fun
  tsort
  ((x list2)) list2 (flatten (toTree x) nil2))
(assert-not
  (forall ((x Int) (xs list2))
    (= (count2 x (tsort xs)) (count2 x xs))))
(assert-claim (= (toTree nil2) TNil))
(assert-claim (= (tsort nil2) nil2))
(assert-claim (forall ((y sk)) (= (count y nil) 0)))
(assert-claim (forall ((x list2)) (= (flatten TNil x) x)))
(assert-claim (forall ((x list2)) (= (tsort (tsort x)) (tsort x))))
(assert-claim
  (forall ((x Int) (y list2)) (= (count2 x (tsort y)) (count2 x y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (toTree (cons2 x y)) (add x (toTree y)))))
(assert-claim
  (forall ((x Int)) (= (add x TNil) (TNode TNil x TNil))))
(assert-claim
  (forall ((x list2)) (= (tsort x) (flatten (toTree x) nil2))))
(assert-claim
  (forall ((x Int)) (= (tsort (cons2 x nil2)) (cons2 x nil2))))
(assert-claim
  (forall ((y sk) (z list))
    (= (+ 1 (count y z)) (count y (cons y z)))))
(assert-claim (forall ((y sk) (z list)) (<= 0 (count y z))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count z (cons y nil)) (count y (cons z nil)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (flatten (add x TNil) y) (cons2 x y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (flatten (toTree (tsort x)) y) (flatten (toTree x) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (tsort (cons2 x (tsort y))) (tsort (cons2 x y)))))
(assert-claim
  (forall ((x Tree) (y list2))
    (= (tsort (flatten x (tsort y))) (tsort (flatten x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (tsort (flatten (toTree y) x)) (tsort (flatten (toTree x) y)))))
(assert-claim
  (forall ((x list2)) (= (count2 0 (cons2 1 x)) (count2 0 x))))
(assert-claim
  (forall ((x list2)) (= (count2 1 (cons2 0 x)) (count2 1 x))))
(assert-claim
  (forall ((x Tree) (y Int) (z Tree))
    (= (add y (TNode x y z)) (TNode (add y x) y z))))
(assert-claim
  (forall ((x Int) (y Tree) (z Int) (x2 Tree))
    (=> (<= x z) (= (add x (TNode y z x2)) (TNode (add x y) z x2)))))
(assert-claim
  (forall ((x Tree) (y Int) (z list2))
    (= (flatten (TNode x y TNil) z) (flatten x (cons2 y z)))))
(assert-claim
  (forall ((x Int) (y Tree) (z list2))
    (= (flatten (TNode TNil x y) z) (cons2 x (flatten y z)))))
(assert-claim
  (forall ((x Int) (y Int) (z Int) (x2 list2))
    (=> (<= z x)
      (= (tsort (cons2 z (cons2 y x2)))
        (tsort (cons2 y (cons2 z x2)))))))
(assert-claim
  (forall ((x Int) (y Tree) (z list2))
    (= (tsort (flatten y (cons2 x z)))
      (tsort (cons2 x (flatten y z))))))
(assert-claim
  (forall ((x Int) (y Tree) (z list2))
    (= (tsort (flatten (add x y) z)) (tsort (cons2 x (flatten y z))))))
(assert-claim
  (forall ((x Tree) (y Tree))
    (= (add 1 (TNode x 0 y)) (TNode x 0 (add 1 y)))))
(assert-claim
  (forall ((x Int))
    (= (tsort (cons2 x (cons2 x nil2))) (cons2 x (cons2 x nil2)))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (<= x y)
      (= (tsort (cons2 x (cons2 y nil2))) (cons2 x (cons2 y nil2))))))
(assert-claim
  (forall ((x Int) (y list2) (z list2))
    (= (+ (count2 x y) (count2 x z))
      (count2 x (flatten (toTree y) z)))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= (count2 (+ y y) x) y) (<= (count2 y x) (+ y y)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 sk) (x3 list))
    (= (count y (cons x2 (cons z x3)))
      (count y (cons z (cons x2 x3))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 x (cons2 (+ x x) y)) (count2 x (cons2 0 y)))))
(assert-claim
  (forall ((x Tree) (y Int) (z Tree) (x2 list2))
    (= (flatten x (cons2 y (flatten z x2)))
      (flatten (TNode x y z) x2))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= x (count2 x (cons2 0 y))) (<= x (count2 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= x (count2 (+ x 1) y)) (<= x (count2 (+ x x) y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= x (count2 0 (cons2 x y))) (<= x (count2 0 y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= (+ x x) (count2 1 y)) (<= (+ x x) (count2 x y)))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= (count2 1 x) (+ y y)) (<= (count2 (+ y 1) x) y))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count z (cons y (cons y nil)))
      (count y (cons z (cons z nil))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (count2 x (cons2 (+ y x) nil2)) (count2 y (cons2 0 nil2)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 x (cons2 (+ x 1) y)) (count2 x y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 (+ x x) (cons2 0 y)) (count2 (+ x x) (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 (+ x x) (cons2 1 y)) (count2 (+ x x) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 (+ x 1) (cons2 x y)) (count2 (+ x 1) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (count2 0 (cons2 (+ x x) y)) (count2 0 (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (flatten (add y (add x TNil)) z)
      (flatten (add x (add y TNil)) z))))
(assert-claim
  (forall ((x Int) (y Tree) (z list2))
    (= (flatten (add 0 (add x y)) z) (flatten (add x (add 0 y)) z))))
(assert-claim
  (forall ((x Int) (y Tree) (z list2))
    (= (flatten (add 1 (add x y)) z) (flatten (add x (add 1 y)) z))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (toTree (flatten (add x (toTree y)) y))
      (add x (toTree (flatten (toTree y) y))))))
(assert-claim
  (forall ((x Tree) (y list2) (z list2))
    (= (tsort (flatten (toTree y) (flatten x z)))
      (tsort (flatten x (flatten (toTree y) z))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (<= x (count2 y (cons2 1 nil2)))
      (<= x (count2 x (cons2 y nil2))))))
(assert-claim
  (forall ((y sk) (z sk)) (<= (count y (cons z nil)) 1)))
(assert-claim
  (forall ((x Int) (y Int))
    (= (<= (count2 x (cons2 0 nil2)) y)
      (<= (count2 x (cons2 y nil2)) y))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (tsort (cons2 x (cons2 y nil2)))
      (flatten (add x (add y TNil)) nil2))))
(assert-claim
  (forall ((x Tree))
    (= (add 1 (add 0 (add 0 x))) (add 0 (add 1 (add 0 x))))))
