(declare-datatype
  list3 ((nil3) (cons3 (head3 Bool) (tail3 list3))))
(declare-datatype It ((A) (B) (C)))
(declare-datatype list2 ((nil2) (cons2 (head2 It) (tail2 list2))))
(declare-datatype list ((nil) (cons (head list2) (tail list))))
(define-fun-rec
  removeOne
  ((x It) (y list)) list
  (match y
    ((nil nil)
     ((cons z x2) (cons (cons2 x z) (removeOne x x2))))))
(define-fun-rec
  removeOne2
  ((x list2)) list
  (match x
    ((nil2 nil)
     ((cons2 y xs) (cons xs (removeOne y (removeOne2 xs)))))))
(define-fun-rec
  or2
  ((x list3)) Bool
  (match x
    ((nil3 false)
     ((cons3 y xs) (or y (or2 xs))))))
(define-fun-rec
  isPrefix
  ((x list2) (y list2)) Bool
  (match x
    ((nil2 true)
     ((cons2 z x2)
      (match y
        ((nil2 false)
         ((cons2 x3 x4) (and (= z x3) (isPrefix x2 x4)))))))))
(define-fun-rec
  isRelaxedPrefix
  ((x list2) (y list2)) Bool
  (match x
    ((nil2 true)
     ((cons2 z x2)
      (match x2
        ((nil2 true)
         ((cons2 x3 x4)
          (match y
            ((nil2 false)
             ((cons2 x5 x6)
              (ite
                (= z x5) (isRelaxedPrefix (cons2 x3 x4) x6)
                (isPrefix (cons2 x3 x4) (cons2 x5 x6)))))))))))))
(define-fun-rec
  spec
  ((ys list2) (x list)) list3
  (match x
    ((nil nil3)
     ((cons y z) (cons3 (isPrefix y ys) (spec ys z))))))
(define-fun
  spec2
  ((x list2) (y list2)) Bool (or2 (spec y (cons x (removeOne2 x)))))
(assert-not
  (forall ((xs list2) (ys list2))
    (= (isRelaxedPrefix xs ys) (spec2 xs ys))))
(assert-claim (not (or2 nil3)))
(assert-claim (= (removeOne2 nil2) nil))
(assert-claim (forall ((x list2)) (isPrefix x x)))
(assert-claim (forall ((x list2)) (isRelaxedPrefix x x)))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (isPrefix x y) (isRelaxedPrefix x y))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (spec2 x y) (isRelaxedPrefix x y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (isRelaxedPrefix x y) (spec2 x y))))
(assert-claim (forall ((x list2)) (isPrefix nil2 x)))
(assert-claim (forall ((x It)) (= (removeOne x nil) nil)))
(assert-claim (forall ((x list2)) (= (spec x nil) nil3)))
(assert-claim
  (forall ((x Bool) (y list3)) (=> (or2 y) (or2 (cons3 x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (isPrefix y x)
      (= (spec x (removeOne2 y)) (spec y (removeOne2 y))))))
(assert-claim (forall ((x Bool)) (= (or2 (cons3 x nil3)) x)))
(assert-claim
  (forall ((x list3)) (= (or2 (cons3 false x)) (or2 x))))
(assert-claim (forall ((x list3)) (or2 (cons3 true x))))
(assert-claim
  (forall ((x It) (y It))
    (= (removeOne2 (cons2 x nil2)) (removeOne2 (cons2 y nil2)))))
(assert-claim
  (forall ((x It) (y list2)) (not (isPrefix (cons2 x y) y))))
(assert-claim
  (forall ((x It) (y list2) (z list2))
    (=> (isPrefix z y) (not (isPrefix (cons2 x y) z)))))
(assert-claim
  (forall ((x list2) (y list2) (z It) (x2 list2))
    (=> (isPrefix y x2)
      (=> (isPrefix x2 x)
        (= (isPrefix y (cons2 z y)) (isPrefix y (cons2 z x2)))))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (=> (isPrefix y x) (= (spec x (cons x z)) (spec x (cons y z))))))
(assert-claim
  (forall ((x list2) (y It) (z list2))
    (=> (isPrefix z x)
      (= (removeOne y (cons z nil)) (cons (cons2 y z) nil)))))
(assert-claim
  (forall ((x list2)) (= (spec x (cons x nil)) (cons3 true nil3))))
(assert-claim
  (forall ((x It) (y It) (z list))
    (= (spec nil2 (removeOne x z)) (spec nil2 (removeOne y z)))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (=> (isPrefix y x)
      (= (spec (cons2 B nil2) z) (spec (cons2 B y) z)))))
(assert-claim
  (forall ((x It) (y list2))
    (= (cons y (removeOne x (removeOne2 y)))
      (removeOne2 (cons2 x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (isPrefix y x)
      (= (spec x (cons y (removeOne2 y)))
        (spec y (cons y (removeOne2 y)))))))
(assert-claim
  (forall ((x list2) (y It) (z list2))
    (=> (isPrefix z x)
      (= (spec x (removeOne y (removeOne2 z)))
        (spec z (removeOne y (removeOne2 z)))))))
(assert-claim
  (forall ((x list2) (y It) (z list2))
    (=> (isPrefix z x)
      (= (spec x (removeOne2 (cons2 y z)))
        (spec z (removeOne2 (cons2 y z)))))))
(assert-claim
  (forall ((x It) (y It) (z list2))
    (= (spec nil2 (removeOne2 (cons2 x z)))
      (spec nil2 (removeOne2 (cons2 y z))))))
(assert-claim
  (forall ((x It) (y list2) (z It) (x2 list))
    (= (spec (cons2 z y) (removeOne x x2))
      (spec (cons2 x y) (removeOne z x2)))))
(assert-claim
  (forall ((x It) (y list2) (z list))
    (= (spec (cons2 x y) (removeOne x z)) (spec y z))))
(assert-claim
  (forall ((x list2) (y list))
    (= (cons (cons2 A x) (removeOne A y)) (removeOne A (cons x y)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (cons (cons2 B x) (removeOne B y)) (removeOne B (cons x y)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (cons (cons2 C x) (removeOne C y)) (removeOne C (cons x y)))))
