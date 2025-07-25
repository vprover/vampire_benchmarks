(declare-sort sk 0)
(declare-datatype
  pair3 ((pair22 (proj1-pair2 Int) (proj2-pair2 Bool))))
(declare-datatype pair ((pair2 (proj1-pair sk) (proj2-pair sk))))
(declare-datatype
  list4 ((nil4) (cons4 (head4 Bool) (tail4 list4))))
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
  ((x list4)) Bool
  (match x
    ((nil4 false)
     ((cons4 y xs) (or y (or2 xs))))))
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
  ((x Int) (y list)) list4
  (match y
    ((nil nil4)
     ((cons z x2)
      (match z
        (((pair22 y2 x3)
          (ite x3 (models6 x x2) (cons4 (= x y2) (models6 x x2))))))))))
(define-fun-rec
  models4
  ((x Int) (y list)) list4
  (match y
    ((nil nil4)
     ((cons z x2)
      (match z
        (((pair22 y2 x3)
          (ite x3 (cons4 (= x y2) (models4 x x2)) (models4 x x2)))))))))
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
(define-fun
  valid
  ((x Form)) Bool
  (match (models3 (Not x) nil)
    ((nil2 true)
     ((cons2 y z) false))))
(define-fun-rec
  ++
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++ xs y))))))
(assert-not (forall ((p Form)) (= (valid (|:&:| p p)) (valid p))))
(assert-claim (not (or2 nil4)))
(assert-claim
  (forall ((x Int) (y list)) (= (models7 x y) (models7 x y))))
(assert-claim (forall ((y list3)) (= (++3 y nil3) y)))
(assert-claim (forall ((y list3)) (= (++3 nil3 y) y)))
(assert-claim (forall ((x Form)) (= (models2 x nil2) nil2)))
(assert-claim (forall ((x Int)) (= (models4 x nil) nil4)))
(assert-claim (forall ((x Int)) (= (models7 x nil) nil)))
(assert-claim (forall ((x Int)) (= (models6 x nil) nil4)))
(assert-claim
  (forall ((x Form)) (=> (valid x) (not (valid (Not x))))))
(assert-claim (forall ((x Int)) (not (valid (Var x)))))
(assert-claim
  (forall ((x list2) (y Form)) (= (models2 y x) (models x y nil2))))
(assert-claim
  (forall ((x Form) (y list2)) (= (models nil2 x y) y)))
(assert-claim
  (forall ((x Form) (y list2))
    (=> (valid x) (= (models2 (Not x) y) nil2))))
(assert-claim
  (forall ((x Form) (y list))
    (=> (valid x) (= (models3 (Not x) y) nil2))))
(assert-claim
  (forall ((x list4) (y list4)) (= (or2 (++4 y x)) (or2 (++4 x y)))))
(assert-claim (forall ((x list4)) (= (or2 (++4 x x)) (or2 x))))
(assert-claim
  (forall ((x list4) (y list4)) (=> (or2 y) (or2 (++4 x y)))))
(assert-claim
  (forall ((x Bool) (y list4)) (=> (or2 y) (or2 (cons4 x y)))))
(assert-claim
  (forall ((x Form) (y Form))
    (= (valid (|:&:| y x)) (valid (|:&:| x y)))))
(assert-claim
  (forall ((x Form)) (= (valid (|:&:| x x)) (valid x))))
(assert-claim
  (forall ((x Form) (y Form))
    (=> (valid x) (= (valid (|:&:| y x)) (valid y)))))
(assert-claim (forall ((x Bool)) (= (or2 (cons4 x nil4)) x)))
(assert-claim
  (forall ((x list4)) (= (or2 (cons4 false x)) (or2 x))))
(assert-claim (forall ((x list4)) (or2 (cons4 true x))))
(assert-claim
  (forall ((x Form)) (= (valid (Not (Not x))) (valid x))))
(assert-claim (forall ((x Int)) (not (valid (Not (Var x))))))
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
  (forall ((x Form) (y list))
    (= (models3 x y) (models2 x (cons2 y nil2)))))
(assert-claim
  (forall ((x Form) (y list2))
    (= (models2 (Not (Not x)) y) (models2 x y))))
(assert-claim
  (forall ((x list4) (y list4))
    (= (or2 (cons4 (or2 x) y)) (or2 (++4 x y)))))
(assert-claim (forall ((x Form)) (not (valid (|:&:| x (Not x))))))
(assert-claim
  (forall ((x Form) (y Form))
    (=> (valid y) (not (valid (|:&:| x (Not y)))))))
(assert-claim
  (forall ((x Form) (y Int)) (not (valid (|:&:| x (Var y))))))
(assert-claim
  (forall ((x Form) (y Form))
    (= (valid (Not (|:&:| y x))) (valid (Not (|:&:| x y))))))
(assert-claim
  (forall ((x Form)) (= (valid (Not (|:&:| x x))) (valid (Not x)))))
(assert-claim
  (forall ((x Form) (y Form))
    (=> (valid x) (= (valid (Not (|:&:| y x))) (valid (Not y))))))
(assert-claim
  (forall ((x Form) (y list2) (z list2))
    (= (models z x (models2 x y)) (models2 x (++2 y z)))))
(assert-claim
  (forall ((x Form) (y list2))
    (= (models2 x (models2 (Not x) y)) nil2)))
(assert-claim
  (forall ((x Form) (y list2))
    (= (models2 (Not (|:&:| x x)) y) (models2 (Not x) y))))
(assert-claim
  (forall ((x Form) (y Form) (z list2))
    (=> (valid x)
      (= (models2 (Not (|:&:| y x)) z) (models2 (Not y) z)))))
(assert-claim
  (forall ((x Form) (y Form) (z list2))
    (=> (valid x)
      (= (models2 (Not (|:&:| x y)) z) (models2 (|:&:| x (Not y)) z)))))
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
(assert-claim
  (forall ((x Form) (y Form) (z Form))
    (= (valid (|:&:| y (|:&:| z x))) (valid (|:&:| y z)))))
(assert-claim
  (forall ((x list2) (y list2) (z Form) (x2 list2))
    (= (models y z (models x z x2)) (models (++2 x y) z x2))))
(assert-claim
  (forall ((x Int) (y list) (z list))
    (= (++4 (models4 x y) (models4 x z)) (models4 x (++ y z)))))
(assert-claim
  (forall ((x Int) (y list) (z list))
    (= (++4 (models6 x y) (models6 x z)) (models6 x (++ y z)))))
(assert-claim
  (forall ((x Int) (y list) (z list))
    (= (++ (models7 x y) (models7 x z)) (models7 x (++ y z)))))
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
