(declare-sort fun1 0)
(declare-datatype list2 ((nil2) (cons2 (head2 Int) (tail2 list2))))
(declare-datatype list ((nil) (cons (head list2) (tail list))))
(declare-const lam fun1)
(declare-fun apply1 (fun1 Int) list2)
(define-fun-rec
  ordered
  ((x list2)) Bool
  (match x
    ((nil2 true)
     ((cons2 y z)
      (match z
        ((nil2 true)
         ((cons2 y2 xs) (and (<= y y2) (ordered (cons2 y2 xs))))))))))
(define-fun-rec
  map2
  ((f fun1) (x list2)) list
  (match x
    ((nil2 nil)
     ((cons2 y xs) (cons (apply1 f y) (map2 f xs))))))
(define-fun-rec
  lmerge
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z x2)
      (match y
        ((nil2 (cons2 z x2))
         ((cons2 x3 x4)
          (ite
            (<= z x3) (cons2 z (lmerge x2 (cons2 x3 x4)))
            (cons2 x3 (lmerge (cons2 z x2) x4))))))))))
(define-fun-rec
  pairwise
  ((x list)) list
  (match x
    ((nil nil)
     ((cons xs y)
      (match y
        ((nil (cons xs nil))
         ((cons ys xss) (cons (lmerge xs ys) (pairwise xss)))))))))
(define-fun-rec
  mergingbu
  ((x list)) list2
  (match x
    ((nil nil2)
     ((cons xs y)
      (match y
        ((nil xs)
         ((cons z x2) (mergingbu (pairwise (cons xs (cons z x2)))))))))))
(define-fun
  msortbu
  ((x list2)) list2 (mergingbu (map2 lam x)))
(assert (forall ((y Int)) (= (apply1 lam y) (cons2 y nil2))))
(assert-not (forall ((xs list2)) (ordered (msortbu xs))))
