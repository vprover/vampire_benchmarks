(declare-sort sk 0)
(declare-datatype
  pair3 ((pair22 (proj1-pair2 Int) (proj2-pair2 Bool))))
(declare-datatype pair ((pair2 (proj1-pair sk) (proj2-pair sk))))
(declare-datatype
  list5 ((nil5) (cons5 (head5 Bool) (tail5 list5))))
(declare-datatype list4 ((nil4) (cons4 (head4 Int) (tail4 list4))))
(declare-datatype list3 ((nil3) (cons3 (head3 sk) (tail3 list3))))
(declare-datatype list ((nil) (cons (head pair3) (tail list))))
(declare-datatype
  list2 ((nil2) (cons2 (head2 list) (tail2 list2))))
(declare-datatype
  Form
  ((|:&:| (|proj1-:&:| Form) (|proj2-:&:| Form))
   (Not (proj1-Not Form)) (Var (proj1-Var Int))))
(define-fun-rec
  or2
  ((x list5)) Bool
  (match x
    ((nil5 false)
     ((cons5 y xs) (or y (or2 xs))))))
(define-fun-rec
  okay
  ((x list)) list4
  (match x
    ((nil nil4)
     ((cons y xs) (match y (((pair22 z y2) (cons4 z (okay xs)))))))))
(define-fun-rec
  models7
  ((x Int) (y list)) list
  (match y
    ((nil nil)
     ((cons z xs)
      (ite
        (distinct x (match z (((pair22 x2 y2) x2))))
        (cons z (models7 x xs)) (models7 x xs))))))
(define-fun-rec
  models6
  ((x Int) (y list)) list5
  (match y
    ((nil nil5)
     ((cons z x2)
      (match z
        (((pair22 y2 x3)
          (ite x3 (models6 x x2) (cons5 (= x y2) (models6 x x2))))))))))
(define-fun-rec
  models4
  ((x Int) (y list)) list5
  (match y
    ((nil nil5)
     ((cons z x2)
      (match z
        (((pair22 y2 x3)
          (ite x3 (cons5 (= x y2) (models4 x x2)) (models4 x x2)))))))))
(define-fun-rec
  elem4
  ((x Bool) (y list5)) Bool
  (match y
    ((nil5 false)
     ((cons5 z xs) (or (= z x) (elem4 x xs))))))
(define-fun-rec
  elem3
  ((x Int) (y list4)) Bool
  (match y
    ((nil4 false)
     ((cons4 z xs) (or (= z x) (elem3 x xs))))))
(define-fun-rec
  okay2
  ((x list)) Bool
  (match x
    ((nil true)
     ((cons y m)
      (match y
        (((pair22 z c2) (and (not (elem3 z (okay m))) (okay2 m)))))))))
(define-fun-rec
  formula
  ((x list2)) Bool
  (match x
    ((nil2 true)
     ((cons2 y xs) (and (okay2 y) (formula xs))))))
(define-fun-rec
  elem2
  ((x sk) (y list3)) Bool
  (match y
    ((nil3 false)
     ((cons3 z xs) (or (= z x) (elem2 x xs))))))
(define-fun-rec
  elem
  ((x list) (y list2)) Bool
  (match y
    ((nil2 false)
     ((cons2 z xs) (or (= z x) (elem x xs))))))
(define-fun-rec
  ++5
  ((x list5) (y list5)) list5
  (match x
    ((nil5 y)
     ((cons5 z xs) (cons5 z (++5 xs y))))))
(define-fun-rec
  ++4
  ((x list4) (y list4)) list4
  (match x
    ((nil4 y)
     ((cons4 z xs) (cons4 z (++4 xs y))))))
(define-fun-rec
  ++3
  ((x list3) (y list3)) list3
  (match x
    ((nil3 y)
     ((cons3 z xs) (cons3 z (++3 xs y))))))
(define-fun-rec
  ++2
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z xs) (cons2 z (++2 xs y))))))
(define-funs-rec
  ((models3
    ((x Form) (y list)) list2)
   (models2
    ((q Form) (x list2)) list2)
   (models
    ((x list2) (q Form) (y list2)) list2))
  ((match x
     (((|:&:| p q) (models2 q (models3 p y)))
      ((Not z)
       (match z
         (((|:&:| r q2)
           (++2 (models3 (Not r) y) (models3 (|:&:| r (Not q2)) y)))
          ((Not p2) (models3 p2 y))
          ((Var x2)
           (ite
             (not (or2 (models4 x2 y)))
             (cons2 (cons (pair22 x2 false) (models7 x2 y)) nil2) nil2)))))
      ((Var x3)
       (ite
         (not (or2 (models6 x3 y)))
         (cons2 (cons (pair22 x3 true) (models7 x3 y)) nil2) nil2))))
   (match x
     ((nil2 nil2)
      ((cons2 y z) (models z q (models3 q y)))))
   (match y
     ((nil2 (models2 q x))
      ((cons2 z x2) (cons2 z (models x q x2)))))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(assert-not (forall ((p Form)) (formula (models3 p nil))))
(assert-claim (okay2 nil))
(assert-claim (formula nil2))
(assert-claim (not (or2 nil5)))
(assert-claim (= (okay nil) nil4))
(assert-claim
  (forall ((x Int) (y list)) (= (models7 x y) (models7 x y))))
(assert-claim (forall ((y list3)) (= (++3 y nil3) y)))
(assert-claim (forall ((y list3)) (= (++3 nil3 y) y)))
(assert-claim (forall ((y sk)) (not (elem2 y nil3))))
(assert-claim (forall ((x list5)) (= (or2 x) (elem4 true x))))
(assert-claim (forall ((x Form)) (= (models2 x nil2) nil2)))
(assert-claim (forall ((x Int)) (= (models4 x nil) nil5)))
(assert-claim (forall ((x Int)) (= (models7 x nil) nil)))
(assert-claim (forall ((x Int)) (= (models6 x nil) nil5)))
(assert-claim
  (forall ((x list2) (y list2))
    (= (formula (++2 y x)) (formula (++2 x y)))))
(assert-claim
  (forall ((x list2)) (= (formula (++2 x x)) (formula x))))
(assert-claim
  (forall ((x list2) (y list2))
    (=> (formula x) (= (formula (++2 y x)) (formula y)))))
(assert-claim
  (forall ((x list2) (y list))
    (=> (formula x) (= (formula (cons2 y x)) (okay2 y)))))
(assert-claim
  (forall ((x list) (y list2))
    (=> (okay2 x) (= (formula (cons2 x y)) (formula y)))))
(assert-claim
  (forall ((x Form) (y list2))
    (=> (formula y) (formula (models2 x y)))))
(assert-claim
  (forall ((x Form) (y list))
    (=> (okay2 y) (formula (models3 x y)))))
(assert-claim
  (forall ((x list2) (y Form)) (= (models2 y x) (models x y nil2))))
(assert-claim
  (forall ((x Form) (y list2)) (= (models nil2 x y) y)))
(assert-claim
  (forall ((x list) (y list)) (= (okay2 (++ y x)) (okay2 (++ x y)))))
(assert-claim
  (forall ((x Int) (y list)) (=> (okay2 y) (okay2 (models7 x y)))))
(assert-claim
  (forall ((x list5) (y list5)) (= (or2 (++5 y x)) (or2 (++5 x y)))))
(assert-claim (forall ((x list5)) (= (or2 (++5 x x)) (or2 x))))
(assert-claim
  (forall ((x list5) (y list5)) (=> (or2 y) (or2 (++5 x y)))))
(assert-claim
  (forall ((x Bool) (y list5)) (=> (or2 y) (or2 (cons5 x y)))))
(assert-claim (forall ((x Bool)) (= (or2 (cons5 x nil5)) x)))
(assert-claim
  (forall ((x list5)) (= (or2 (cons5 false x)) (or2 x))))
(assert-claim (forall ((x list5)) (or2 (cons5 true x))))
(assert-claim
  (forall ((y list3) (z list3) (x2 list3))
    (= (++3 (++3 y z) x2) (++3 y (++3 z x2)))))
(assert-claim
  (forall ((x list2) (y Form) (z list2))
    (= (models z y x) (++2 x (models2 y z)))))
(assert-claim
  (forall ((y sk) (z list3) (x2 list3))
    (= (cons3 y (++3 z x2)) (++3 (cons3 y z) x2))))
(assert-claim
  (forall ((y sk) (z list3) (x2 list3))
    (= (elem2 y (++3 x2 z)) (elem2 y (++3 z x2)))))
(assert-claim
  (forall ((y sk) (z list3)) (= (elem2 y (++3 z z)) (elem2 y z))))
(assert-claim (forall ((y sk) (z list3)) (elem2 y (cons3 y z))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list3))
    (=> (elem2 y x2) (= (elem2 z (cons3 y x2)) (elem2 z x2)))))
(assert-claim
  (forall ((y sk) (z list3) (x2 list3))
    (=> (elem2 y x2) (elem2 y (++3 z x2)))))
(assert-claim
  (forall ((x Bool) (y list5) (z list5))
    (=> (or2 y)
      (=> (or2 z) (= (elem4 (elem4 x y) z) (elem4 x (++5 y z)))))))
(assert-claim
  (forall ((x list) (y list) (z list2))
    (=> (formula z) (= (elem (++ y x) z) (elem (++ x y) z)))))
(assert-claim
  (forall ((x list) (y list) (z list2))
    (=> (okay2 y) (= (elem (++ y x) z) (elem (++ x y) z)))))
(assert-claim
  (forall ((x Form) (y list2))
    (= (formula (models y x y)) (formula y))))
(assert-claim
  (forall ((x Form) (y list2))
    (= (models2 x (models2 x y)) (models2 x y))))
(assert-claim
  (forall ((x Form) (y list))
    (= (models2 x (models3 x y)) (models3 x y))))
(assert-claim
  (forall ((x Form) (y Form) (z list2))
    (= (models2 (|:&:| y x) z) (models2 x (models2 y z)))))
(assert-claim
  (forall ((x Form) (y Form) (z list))
    (= (models3 (|:&:| y x) z) (models2 x (models3 y z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (= (models7 y (models7 x z)) (models7 x (models7 y z)))))
(assert-claim
  (forall ((x Int) (y list))
    (= (models7 x (models7 x y)) (models7 x y))))
(assert-claim
  (forall ((x list) (y list))
    (= (++4 (okay x) (okay y)) (okay (++ x y)))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (elem2 z (cons3 y nil3)) (elem2 y (cons3 z nil3)))))
(assert-claim
  (forall ((x Bool) (y list5))
    (=> (or2 y) (elem4 x (cons5 false y)))))
(assert-claim
  (forall ((x list5) (y list5))
    (=> (or2 y)
      (= (elem4 (elem4 false x) y) (elem4 false (++5 x y))))))
(assert-claim
  (forall ((x Form) (y list2)) (not (elem nil (models2 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (formula (models2 (Var x) y)) (formula y))))
(assert-claim
  (forall ((x Int) (y list))
    (= (formula (models3 (Var x) y)) (okay2 (models7 x y)))))
(assert-claim
  (forall ((x Form) (y list))
    (= (models3 x y) (models2 x (cons2 y nil2)))))
(assert-claim
  (forall ((x Form) (y list2))
    (= (models2 (Not (Not x)) y) (models2 x y))))
(assert-claim
  (forall ((x list5) (y list5))
    (= (or2 (cons5 (or2 x) y)) (or2 (++5 x y)))))
(assert-claim
  (forall ((x list))
    (=> (okay2 x) (= (okay2 (++ x x)) (elem nil (cons2 x nil2))))))
(assert-claim
  (forall ((x Form) (y list2) (z list2))
    (= (models z x (models2 x y)) (models2 x (++2 y z)))))
(assert-claim
  (forall ((x list2) (y list5) (z list5))
    (=> (or2 z)
      (= (elem4 (elem4 (formula x) y) z) (elem4 (or2 y) z)))))
(assert-claim
  (forall ((x list5)) (= (elem4 (elem4 (or2 x) x) x) (or2 x))))
(assert-claim
  (forall ((x list5) (y list5))
    (=> (or2 y)
      (= (elem4 (or2 x) (++5 x y)) (elem4 (elem4 (or2 x) x) y)))))
(assert-claim
  (forall ((x Int) (y list)) (not (elem3 x (okay (models7 x y))))))
(assert-claim
  (forall ((x list2) (y Form) (z list2))
    (=> (formula z) (= (elem nil (models x y z)) (elem nil z)))))
(assert-claim
  (forall ((x Form) (y list2))
    (= (models2 x (models2 (Not x) y)) nil2)))
(assert-claim
  (forall ((x Form) (y list2))
    (= (models2 (Not (|:&:| x x)) y) (models2 (Not x) y))))
(assert-claim
  (forall ((x Bool) (y list5))
    (= (or2 (cons5 (elem4 x y) y)) (elem4 (or2 (cons5 x y)) y))))
(assert-claim
  (forall ((x Bool) (y list5) (z list5))
    (=> (or2 z)
      (= (or2 (cons5 (elem4 x z) y)) (elem4 (or2 (cons5 x y)) z)))))
(assert-claim
  (forall ((x Int) (y list) (z list))
    (= (or2 (models4 x (++ z y))) (or2 (models4 x (++ y z))))))
(assert-claim
  (forall ((x Int) (y list))
    (= (or2 (models4 x (++ y y))) (or2 (models4 x y)))))
(assert-claim
  (forall ((x Int) (y list)) (not (or2 (models4 x (models7 x y))))))
(assert-claim
  (forall ((x Int) (y list) (z list))
    (= (or2 (models6 x (++ z y))) (or2 (models6 x (++ y z))))))
(assert-claim
  (forall ((x Int) (y list))
    (= (or2 (models6 x (++ y y))) (or2 (models6 x y)))))
(assert-claim
  (forall ((x Int) (y list)) (not (or2 (models6 x (models7 x y))))))
(assert-claim (forall ((x list5)) (elem4 (or2 x) (cons5 false x))))
(assert-claim
  (forall ((x list5))
    (= (elem4 (or2 x) (cons5 true x)) (elem4 (or2 x) x))))
(assert-claim
  (forall ((x list5) (y list5))
    (= (or2 (cons5 (elem4 false y) x))
      (elem4 (or2 x) (cons5 true y)))))
(assert-claim
  (forall ((x list2) (y list2) (z Form) (x2 list2))
    (= (models y z (models x z x2)) (models (++2 x y) z x2))))
(assert-claim
  (forall ((x Int) (y list) (z list))
    (= (++5 (models4 x y) (models4 x z)) (models4 x (++ y z)))))
(assert-claim
  (forall ((x Int) (y list) (z list))
    (= (++5 (models6 x y) (models6 x z)) (models6 x (++ y z)))))
(assert-claim
  (forall ((x Int) (y list) (z list))
    (= (++ (models7 x y) (models7 x z)) (models7 x (++ y z)))))
(assert-claim
  (forall ((y sk) (z list3) (x2 list3) (x3 list3))
    (= (elem2 y (++3 z (++3 x3 x2))) (elem2 y (++3 z (++3 x2 x3))))))
(assert-claim
  (forall ((y sk) (z list3) (x2 list3))
    (= (elem2 y (++3 z (++3 z x2))) (elem2 y (++3 z x2)))))
(assert-claim
  (forall ((x Bool) (y list5))
    (= (elem4 x (cons5 (elem4 x y) y)) (elem4 x (cons5 false y)))))
(assert-claim
  (forall ((x Bool) (y list5))
    (= (elem4 (elem4 (elem4 x y) y) y) (elem4 x y))))
(assert-claim
  (forall ((x Int) (y list) (z list2) (x2 list5))
    (= (elem4 (elem (models7 x y) z) x2) (elem4 (elem y z) x2))))
(assert-claim
  (forall ((x list) (y Form) (z list2) (x2 list2))
    (= (elem x (models2 y (++2 x2 z)))
      (elem x (models2 y (++2 z x2))))))
(assert-claim
  (forall ((x list) (y Form) (z list2))
    (= (elem x (models2 y (++2 z z))) (elem x (models2 y z)))))
(assert-claim
  (forall ((x list2) (y list) (z Form) (x2 list))
    (= (elem y (models2 z (cons2 x2 x))) (elem y (models3 z x2)))))
(assert-claim
  (forall ((x list) (y Form) (z Form) (x2 list2))
    (= (elem x (models2 z (models2 y x2)))
      (elem x (models2 y (models2 z x2))))))
(assert-claim
  (forall ((x list) (y Form) (z list) (x2 list))
    (= (elem x (models3 y (++ x2 z))) (elem x (models3 y (++ z x2))))))
(assert-claim
  (forall ((x list) (y Form) (z list) (x2 list))
    (= (elem x (models3 y (++ x2 x2)))
      (elem x (models3 y (++ z x2))))))
(assert-claim
  (forall ((x list) (y Form) (z list2))
    (not (elem (++ x x) (models2 y z)))))
(assert-claim
  (forall ((x list2) (y Form) (z list2))
    (= (models2 y (models x (Not y) z)) (models2 y z))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (= (models4 y (models7 x (models7 y z)))
      (models4 x (models7 x (models7 y z))))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (= (models6 y (models7 x (models7 y z)))
      (models6 x (models7 x (models7 y z))))))
(assert-claim
  (forall ((x Bool) (y list5))
    (= (elem4 x (cons5 (elem4 false y) y))
      (elem4 (or2 y) (cons5 x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (= (elem4 false (models4 y (models7 x z)))
      (elem4 false (models4 x (models7 y z))))))
(assert-claim
  (forall ((x Int) (y list))
    (= (elem4 false (models4 x (models7 x y)))
      (elem4 false (models4 x y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list))
    (= (elem4 false (models6 y (models7 x z)))
      (elem4 false (models6 x (models7 y z))))))
(assert-claim
  (forall ((x Int) (y list))
    (= (elem4 false (models6 x (models7 x y)))
      (elem4 false (models6 x y)))))
(assert-claim
  (forall ((x Form) (y list2) (z list))
    (= (elem nil (cons2 z (models2 x y))) (okay2 (++ z z)))))
(assert-claim
  (forall ((x list5) (y list5))
    (= (or2 (cons5 (elem4 (or2 x) y) x))
      (elem4 (or2 x) (cons5 true y)))))
(assert-claim
  (forall ((x Bool) (y Bool))
    (= (elem4 y (cons5 x (cons5 true nil5)))
      (elem4 x (cons5 y (cons5 false nil5))))))
