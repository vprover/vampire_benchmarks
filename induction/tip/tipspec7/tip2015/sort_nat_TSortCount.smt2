(declare-sort sk 0)
(declare-datatype list2 ((nil2) (cons2 (head2 sk) (tail2 list2))))
(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype
  Tree
  ((TNode (proj1-TNode Tree) (proj2-TNode Nat) (proj3-TNode Tree))
   (TNil)))
(declare-datatype list ((nil) (cons (head Nat) (tail list))))
(define-fun-rec
  plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (succ (plus z y))))))
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
  flatten
  ((x Tree) (y list)) list
  (match x
    (((TNode q z r) (flatten q (cons z (flatten r y))))
     (TNil y))))
(define-fun-rec
  count2
  ((x sk) (y list2)) Nat
  (match y
    ((nil2 zero)
     ((cons2 z ys)
      (ite (= x z) (plus (succ zero) (count2 x ys)) (count2 x ys))))))
(define-fun-rec
  count
  ((x Nat) (y list)) Nat
  (match y
    ((nil zero)
     ((cons z ys)
      (ite (= x z) (plus (succ zero) (count x ys)) (count x ys))))))
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
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
(assert-not
  (forall ((x Nat) (xs list)) (= (count x (tsort xs)) (count x xs))))
(assert-claim (= (toTree nil) TNil))
(assert-claim (= (tsort nil) nil))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim (forall ((y sk)) (= (count2 y nil2) zero)))
(assert-claim (forall ((x list)) (= (flatten TNil x) x)))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim (forall ((x list)) (= (tsort (tsort x)) (tsort x))))
(assert-claim
  (forall ((x Nat) (y list)) (= (count x (tsort y)) (count x y))))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim (forall ((x Nat)) (not (leq (succ x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq y x) (not (leq (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (toTree (cons x y)) (add x (toTree y)))))
(assert-claim
  (forall ((x Nat)) (= (add x TNil) (TNode TNil x TNil))))
(assert-claim
  (forall ((x list)) (= (tsort x) (flatten (toTree x) nil))))
(assert-claim
  (forall ((x Nat)) (= (tsort (cons x nil)) (cons x nil))))
(assert-claim
  (forall ((x list))
    (= (tsort (cons zero x)) (cons zero (tsort x)))))
(assert-claim
  (forall ((y sk) (z list2))
    (= (count2 y (cons2 y z)) (succ (count2 y z)))))
(assert-claim (forall ((x Nat) (y Nat)) (leq x (plus x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (=> (leq x z) (leq x (plus y z)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (plus y x) x) (leq y zero))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (plus y y) x) (leq y zero)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (plus x y) z) (plus x (plus y z)))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count2 z (cons2 y nil2)) (count2 y (cons2 z nil2)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (flatten (add x TNil) y) (cons x y))))
(assert-claim
  (forall ((x Tree) (y list))
    (= (flatten (add zero x) y) (cons zero (flatten x y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (flatten (toTree (tsort x)) y) (flatten (toTree x) y))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (succ x) (succ y)) (leq x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (plus x y) zero) (leq y zero)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (tsort (cons x (tsort y))) (tsort (cons x y)))))
(assert-claim
  (forall ((x Tree) (y list))
    (= (tsort (flatten x (tsort y))) (tsort (flatten x y)))))
(assert-claim
  (forall ((x list) (y list))
    (= (tsort (flatten (toTree y) x)) (tsort (flatten (toTree x) y)))))
(assert-claim
  (forall ((x Tree) (y Nat) (z Tree))
    (= (add y (TNode x y z)) (TNode (add y x) y z))))
(assert-claim
  (forall ((x Nat) (y Tree) (z Nat) (x2 Tree))
    (=> (leq x z) (= (add x (TNode y z x2)) (TNode (add x y) z x2)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (cons (succ x) y)) (count x y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count (succ x) (cons x y)) (count (succ x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y) (= (count (succ y) (cons x z)) (count (succ y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x) (= (count y (cons (succ x) z)) (count y z)))))
(assert-claim
  (forall ((x Tree) (y Nat) (z list))
    (= (flatten (TNode x y TNil) z) (flatten x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y Tree) (z list))
    (= (flatten (TNode TNil x y) z) (cons x (flatten y z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (succ x) (plus y x)) (leq (succ zero) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (succ x) (plus y y)) (leq (succ zero) y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus y x) (succ x)) (leq y (succ zero)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat) (x2 list))
    (=> (leq z x)
      (= (tsort (cons z (cons y x2))) (tsort (cons y (cons z x2)))))))
(assert-claim
  (forall ((x Nat) (y Tree) (z list))
    (= (tsort (flatten y (cons x z))) (tsort (cons x (flatten y z))))))
(assert-claim
  (forall ((x Nat) (y Tree) (z list))
    (= (tsort (flatten (add x y) z)) (tsort (cons x (flatten y z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (leq (succ zero) (plus x y)) (leq (succ zero) y)))))
(assert-claim
  (forall ((x Nat)) (= (leq (plus x x) (succ zero)) (leq x zero))))
(assert-claim
  (forall ((x Nat))
    (= (tsort (cons x (cons x nil))) (cons x (cons x nil)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (tsort (cons x (cons y nil))) (cons x (cons y nil))))))
(assert-claim
  (forall ((x Tree) (y Nat) (z Tree))
    (= (add (succ y) (TNode x y z)) (TNode x y (add (succ y) z)))))
(assert-claim
  (forall ((y sk) (z sk) (x2 sk) (x3 list2))
    (= (count2 y (cons2 x2 (cons2 z x3)))
      (count2 y (cons2 z (cons2 x2 x3))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count x (cons (plus x x) y)) (count x (cons zero y)))))
(assert-claim
  (forall ((x Tree) (y Nat) (z Tree) (x2 list))
    (= (flatten x (cons y (flatten z x2)))
      (flatten (TNode x y z) x2))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (leq (plus y x) (plus z x)) (leq y z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus x x) (plus y y)) (leq x y))))
(assert-claim
  (forall ((x Nat) (y list) (z list))
    (= (plus (count x y) (count x z))
      (count x (flatten (toTree y) z)))))
(assert-claim
  (forall ((x Tree) (y Nat) (z Tree))
    (= (add (succ y) (TNode x zero z))
      (TNode x zero (add (succ y) z)))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count2 z (cons2 y (cons2 y nil2)))
      (count2 y (cons2 z (cons2 z nil2))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count x (cons (plus y x) nil)) (count y (cons zero nil)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count zero (cons (plus x x) y)) (count zero (cons x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count (plus x x) (cons zero y))
      (count (plus x x) (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (= (flatten (add y (add x TNil)) z)
      (flatten (add x (add y TNil)) z))))
(assert-claim
  (forall ((x Nat) (y Tree) (z list))
    (= (flatten (add x (add zero y)) z)
      (cons zero (flatten (add x y) z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (leq x (count x (cons zero y))) (leq x (count x y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (leq x (count zero (cons x y))) (leq x (count zero y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (succ (succ x)) (plus y x)) (leq (succ (succ zero)) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (count x (cons y nil)) x) (leq (succ zero) (plus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus y x) (succ (succ x))) (leq y (succ (succ zero))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (toTree (flatten (add x (toTree y)) y))
      (add x (toTree (flatten (toTree y) y))))))
(assert-claim
  (forall ((x Tree) (y list) (z list))
    (= (tsort (flatten (toTree y) (flatten x z)))
      (tsort (flatten x (flatten (toTree y) z))))))
(assert-claim
  (forall ((x Nat) (y Tree))
    (= (add zero (add x (add zero y)))
      (add x (add zero (add zero y))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count (succ x) (cons (succ y) nil)) (count x (cons y nil)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (tsort (cons x (cons y nil)))
      (flatten (add x (add y TNil)) nil))))
(assert-claim
  (forall ((x Nat))
    (= (leq (succ (succ zero)) (plus x x)) (leq (succ zero) x))))
(assert-claim
  (forall ((x Nat) (y list) (z Nat))
    (= (leq (count z y) (succ (succ x)))
      (leq (count x y) (succ (succ z))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (count x (cons zero nil)) y)
      (leq (succ zero) (plus x y)))))
(assert-claim
  (forall ((x Nat))
    (= (leq (plus x x) (succ (succ zero))) (leq x (succ zero)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (leq (plus x (count x y)) zero)
      (leq (plus x (count zero y)) zero))))
