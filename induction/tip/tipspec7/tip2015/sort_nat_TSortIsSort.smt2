(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype
  Tree
  ((TNode (proj1-TNode Tree) (proj2-TNode Nat) (proj3-TNode Tree))
   (TNil)))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(define-fun-rec
  leq
  ((x Nat) (y Nat)) Bool
  (match x
    ((zero true)
     ((succ z)
      (match y
        ((zero false)
         ((succ x2) (leq z x2))))))))
(define-fun-rec
  insert2
  ((x Nat) (y list)) list
  (match y
    ((nil (cons x nil))
     ((cons z xs)
      (ite (leq x z) (cons x (cons z xs)) (cons z (insert2 x xs)))))))
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
    (((TNode q z r) (flatten q (cons z (flatten r y))))
     (TNil y))))
(define-fun-rec
  add
  ((x Nat) (y Tree)) Tree
  (match y
    (((TNode q z r)
      (ite (leq x z) (TNode (add x q) z r) (TNode q z (add x r))))
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
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim (forall ((x list)) (= (flatten TNil x) x)))
(assert-claim (forall ((x Nat)) (= (insert2 x nil) (cons x nil))))
(assert-claim
  (forall ((x list)) (= (insert2 zero x) (cons zero x))))
(assert-claim (forall ((x list)) (= (isort (isort x)) (isort x))))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim
  (forall ((x Nat) (y list))
    (= (isort (cons x y)) (insert2 x (isort y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (isort (insert2 x y)) (insert2 x (isort y)))))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim (forall ((x Nat)) (not (leq (succ x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq y x) (not (leq (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (toTree (cons x y)) (add x (toTree y)))))
(assert-claim
  (forall ((x Nat)) (= (add x TNil) (TNode TNil x TNil))))
(assert-claim
  (forall ((x list)) (= (isort x) (flatten (toTree x) nil))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 x (cons x y)) (cons x (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (insert2 y (insert2 x z)) (insert2 x (insert2 y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y) (= (insert2 x (cons y z)) (cons x (cons y z))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (flatten (add x TNil) y) (cons x y))))
(assert-claim
  (forall ((x Tree) (y list))
    (= (flatten (add zero x) y) (cons zero (flatten x y)))))
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
  (forall ((x Nat) (y Nat)) (= (leq (succ x) (succ y)) (leq x y))))
(assert-claim
  (forall ((x Tree) (y Nat) (z Tree))
    (= (add y (TNode x y z)) (TNode (add y x) y z))))
(assert-claim
  (forall ((x Nat) (y Tree) (z Nat) (x2 Tree))
    (=> (leq x z) (= (add x (TNode y z x2)) (TNode (add x y) z x2)))))
(assert-claim
  (forall ((x Tree) (y Nat) (z list))
    (= (flatten (TNode x y TNil) z) (flatten x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y Tree) (z list))
    (= (flatten (TNode TNil x y) z) (cons x (flatten y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 (succ x) (cons x y)) (cons x (insert2 (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y)
      (= (insert2 (succ y) (cons x z)) (cons x (insert2 (succ y) z))))))
(assert-claim
  (forall ((x Nat) (y Tree) (z list))
    (= (isort (flatten y (cons x z)))
      (insert2 x (isort (flatten y z))))))
(assert-claim
  (forall ((x Nat) (y Tree) (z list))
    (= (isort (flatten (add x y) z))
      (insert2 x (isort (flatten y z))))))
(assert-claim
  (forall ((x Tree) (y Nat) (z Tree))
    (= (add (succ y) (TNode x y z)) (TNode x y (add (succ y) z)))))
(assert-claim
  (forall ((x Tree) (y Nat) (z Tree) (x2 list))
    (= (flatten x (cons y (flatten z x2)))
      (flatten (TNode x y z) x2))))
(assert-claim
  (forall ((x Tree) (y Nat) (z Tree))
    (= (add (succ y) (TNode x zero z))
      (TNode x zero (add (succ y) z)))))
(assert-claim
  (forall ((x Nat) (y Tree) (z list))
    (= (flatten (add x (add zero y)) z)
      (cons zero (flatten (add x y) z)))))
(assert-claim
  (forall ((x Tree) (y list) (z list))
    (= (isort (flatten (toTree y) (flatten x z)))
      (isort (flatten x (flatten (toTree y) z))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (toTree (flatten (add x (toTree y)) y))
      (add x (toTree (flatten (toTree y) y))))))
(assert-claim
  (forall ((x Nat) (y Tree))
    (= (add zero (add x (add zero y)))
      (add x (add zero (add zero y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (insert2 x (cons y nil)) (flatten (add x (add y TNil)) nil))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (insert2 (succ zero) (cons (succ x) y))
      (cons (succ zero) (cons (succ x) y)))))
