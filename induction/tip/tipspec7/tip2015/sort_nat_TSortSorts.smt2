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
  ordered
  ((x list)) Bool
  (match x
    ((nil true)
     ((cons y z)
      (match z
        ((nil true)
         ((cons y2 xs) (and (leq y y2) (ordered (cons y2 xs))))))))))
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
(assert-not (forall ((xs list)) (ordered (tsort xs))))
(assert-claim (ordered nil))
(assert-claim (= (toTree nil) TNil))
(assert-claim (forall ((x list)) (=> (ordered x) (= (tsort x) x))))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim (forall ((x list)) (= (flatten TNil x) x)))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x list)) (ordered (tsort x))))
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
  (forall ((x list)) (= (tsort x) (flatten (toTree x) nil))))
(assert-claim (forall ((x Nat)) (ordered (cons x nil))))
(assert-claim
  (forall ((x list)) (= (ordered (cons zero x)) (ordered x))))
(assert-claim
  (forall ((x list))
    (= (tsort (cons zero x)) (cons zero (tsort x)))))
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
  (forall ((x Tree) (y Nat) (z list))
    (= (flatten (TNode x y TNil) z) (flatten x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y Tree) (z list))
    (= (flatten (TNode TNil x y) z) (cons x (flatten y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ordered (cons x (cons x y))) (ordered (cons x y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq x y)
      (= (ordered (cons x (cons y z))) (ordered (cons y z))))))
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
    (= (leq x y) (ordered (cons x (cons y nil))))))
(assert-claim
  (forall ((x list) (y Nat))
    (=> (ordered x)
      (= (ordered (cons y (cons zero x))) (leq y zero)))))
(assert-claim
  (forall ((x Nat) (y Tree))
    (= (ordered (flatten (add x y) nil)) (ordered (flatten y nil)))))
(assert-claim
  (forall ((x list))
    (= (ordered (flatten (toTree x) (tsort x)))
      (ordered (flatten (toTree x) x)))))
(assert-claim
  (forall ((x Nat))
    (= (tsort (cons x (cons x nil))) (cons x (cons x nil)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (tsort (cons x (cons y nil))) (cons x (cons y nil))))))
(assert-claim
  (forall ((x Tree) (y list))
    (=> (ordered y)
      (= (ordered (flatten x (cons zero nil)))
        (ordered (flatten x (cons zero y)))))))
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
  (forall ((x Nat) (y Nat) (z list))
    (= (flatten (add y (add x TNil)) z)
      (flatten (add x (add y TNil)) z))))
(assert-claim
  (forall ((x Nat) (y Tree) (z list))
    (= (flatten (add x (add zero y)) z)
      (cons zero (flatten (add x y) z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ordered (cons x (tsort (cons x y))))
      (ordered (cons x (tsort y))))))
(assert-claim
  (forall ((x Nat) (y list))
    (not (ordered (cons (succ x) (cons x y))))))
(assert-claim
  (forall ((x Tree) (y list))
    (= (ordered (flatten x (tsort (flatten x y))))
      (ordered (flatten x (flatten x (tsort y)))))))
(assert-claim
  (forall ((x Tree) (y list))
    (= (ordered (flatten (TNode x zero x) y))
      (ordered (flatten x (cons zero y))))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (ordered (flatten (add x (toTree y)) y))
      (ordered (cons x (flatten (toTree y) y))))))
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
    (= (tsort (cons x (cons y nil)))
      (flatten (add x (add y TNil)) nil))))
(assert-claim
  (forall ((x Nat) (y list))
    (not (ordered (cons (succ x) (cons zero y))))))
(assert-claim
  (forall ((x list))
    (= (ordered (flatten (toTree x) (cons zero x)))
      (ordered (flatten (toTree x) (cons zero nil))))))
