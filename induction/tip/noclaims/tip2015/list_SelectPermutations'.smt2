(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-sort fun13 0)
(declare-datatype
  pair3 ((pair22 (proj1-pair2 sk) (proj2-pair2 sk))))
(declare-datatype list ((nil3) (cons3 (head3 sk) (tail3 list))))
(declare-datatype
  list3 ((nil2) (cons2 (head2 list) (tail2 list3))))
(declare-datatype pair ((pair2 (proj1-pair sk) (proj2-pair list))))
(declare-datatype list2 ((nil) (cons (head pair) (tail list2))))
(declare-fun lam (list sk) fun13)
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) Bool)
(declare-fun apply13 (fun13 list) Bool)
(define-fun-rec
  select2
  ((x sk) (y list2)) list2
  (match y
    ((nil nil)
     ((cons z x2)
      (match z
        (((pair2 y2 ys)
          (cons (pair2 y2 (cons3 x ys)) (select2 x x2)))))))))
(define-fun-rec
  select22
  ((x list)) list2
  (match x
    ((nil3 nil)
     ((cons3 y xs) (cons (pair2 y xs) (select2 y (select22 xs)))))))
(define-fun-rec
  formula
  ((x list2)) list3
  (match x
    ((nil nil2)
     ((cons y z)
      (match y (((pair2 y2 ys) (cons2 (cons3 y2 ys) (formula z)))))))))
(define-fun-rec
  count
  ((x sk) (y list)) Int
  (match y
    ((nil3 0)
     ((cons3 z ys) (ite (= x z) (+ 1 (count x ys)) (count x ys))))))
(define-fun-rec
  all2
  ((p fun12) (x list)) Bool
  (match x
    ((nil3 true)
     ((cons3 y xs) (and (apply12 p y) (all2 p xs))))))
(define-fun-rec
  all
  ((p fun13) (x list3)) Bool
  (match x
    ((nil2 true)
     ((cons2 y xs) (and (apply13 p y) (all p xs))))))
(assert
  (forall ((xs list) (z sk) (x list))
    (= (apply13 (lam xs z) x) (= (count z xs) (count z x)))))
(assert-not
  (forall ((xs list) (z sk))
    (all (lam xs z) (formula (select22 xs)))))
