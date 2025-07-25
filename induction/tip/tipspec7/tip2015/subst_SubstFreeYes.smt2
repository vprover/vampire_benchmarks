(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-sort fun13 0)
(declare-datatype list2 ((nil2) (cons2 (head2 Int) (tail2 list2))))
(declare-datatype list ((nil) (cons (head sk) (tail list))))
(declare-datatype
  Expr
  ((Var (proj1-Var Int)) (Lam (proj1-Lam Int) (proj2-Lam Expr))
   (App (proj1-App Expr) (proj2-App Expr))))
(declare-fun lam (Int) fun13)
(declare-fun lam2 (Int) fun13)
(declare-fun lam3 (list2) fun13)
(declare-const lam4 fun13)
(declare-const lam5 fun13)
(declare-fun lam6 (Int) fun13)
(declare-fun lam7 (Int) fun13)
(declare-fun lam8 (Int) fun13)
(declare-fun lam9 (Int) fun13)
(declare-fun lam10 (Int) fun13)
(declare-fun lam11 (Int) fun13)
(declare-fun lam12 (Int) fun13)
(declare-const lam13 fun13)
(declare-const lam14 fun13)
(declare-const lam15 fun13)
(declare-const lam16 fun13)
(declare-fun lam17 (Int) fun13)
(declare-fun lam18 (Int) fun13)
(declare-fun lam19 (list2 list2) fun13)
(declare-fun lam20 (list2 list2) fun13)
(declare-fun lam21 (Int) fun13)
(declare-fun lam22 (Int list2) fun13)
(declare-fun lam23 (Int) fun13)
(declare-fun lam24 (Int) fun13)
(declare-fun lam25 (Int) fun13)
(declare-fun lam26 (list2) fun13)
(declare-fun lam27 (list2) fun13)
(declare-const lam28 fun13)
(declare-const lam29 fun13)
(declare-const lam30 fun13)
(declare-fun apply1 (fun1 sk) sk)
(declare-fun apply12 (fun12 sk) Bool)
(declare-fun apply13 (fun13 Int) Bool)
(define-fun-rec
  new-maximum
  ((x Int) (y list2)) Int
  (match y
    ((nil2 x)
     ((cons2 z ys)
      (ite (<= x z) (new-maximum z ys) (new-maximum x ys))))))
(define-fun
  new
  ((x list2)) Int (+ (new-maximum 0 x) 1))
(define-fun-rec
  filter2
  ((p fun12) (x list)) list
  (match x
    ((nil nil)
     ((cons y xs)
      (ite (apply12 p y) (cons y (filter2 p xs)) (filter2 p xs))))))
(define-fun-rec
  filter
  ((p fun13) (x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs)
      (ite (apply13 p y) (cons2 y (filter p xs)) (filter p xs))))))
(define-fun-rec
  elem2
  ((x sk) (y list)) Bool
  (match y
    ((nil false)
     ((cons z xs) (or (= z x) (elem2 x xs))))))
(define-fun-rec
  elem
  ((x Int) (y list2)) Bool
  (match y
    ((nil2 false)
     ((cons2 z xs) (or (= z x) (elem x xs))))))
(define-fun-rec
  ++2
  ((x list) (y list)) list
  (match x
    ((nil y)
     ((cons z xs) (cons z (++2 xs y))))))
(define-fun-rec
  ++
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z xs) (cons2 z (++ xs y))))))
(define-fun-rec
  free
  ((x Expr)) list2
  (match x
    (((Var y) (cons2 y nil2))
     ((Lam z b) (filter (lam z) (free b)))
     ((App a2 b2) (++ (free a2) (free b2))))))
(define-fun-rec
  subst
  ((x Int) (y Expr) (z Expr)) Expr
  (match z
    (((Var y2) (ite (= x y2) y (Var y2)))
     ((Lam y3 a)
      (let ((z2 (new (++ (free y) (free a)))))
        (ite
          (= x y3) (Lam y3 a)
          (ite
            (elem y3 (free y)) (subst x y (Lam z2 (subst y3 (Var z2) a)))
            (Lam y3 (subst x y a))))))
     ((App a2 b2) (App (subst x y a2) (subst x y b2))))))
(assert
  (forall ((z Int) (x2 Int))
    (= (apply13 (lam z) x2) (distinct z x2))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam2 x) z) (distinct z x))))
(assert
  (forall ((x list2) (y Int))
    (= (apply13 (lam3 x) y) (<= (new x) y))))
(assert (forall ((y Int)) (= (apply13 lam4 y) (<= 0 y))))
(assert (forall ((y Int)) (= (apply13 lam5 y) (<= 1 y))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam6 x) z) (<= x z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam7 x) x2) (<= x x2))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam8 x) z) (<= x z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam9 x) x2) (<= x x2))))
(assert
  (forall ((y Int) (x2 Int)) (= (apply13 (lam10 y) x2) (<= y x2))))
(assert
  (forall ((y Int) (x3 Int)) (= (apply13 (lam11 y) x3) (<= y x3))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam12 x) z) (<= x z))))
(assert (forall ((y Int)) (= (apply13 lam13 y) (<= 1 y))))
(assert (forall ((y Int)) (= (apply13 lam14 y) (<= 1 y))))
(assert (forall ((z Int)) (= (apply13 lam15 z) (<= 1 z))))
(assert (forall ((y Int)) (= (apply13 lam16 y) (<= 1 y))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam17 x) z) (<= x z))))
(assert
  (forall ((y Int) (z Int)) (= (apply13 (lam18 y) z) (<= y z))))
(assert
  (forall ((x list2) (y list2) (z Int))
    (= (apply13 (lam19 x y) z) (<= (new (++ y x)) z))))
(assert
  (forall ((x list2) (y list2) (z Int))
    (= (apply13 (lam20 x y) z) (<= (new-maximum (new y) x) z))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam21 x) z) (<= x z))))
(assert
  (forall ((x Int) (y list2) (z Int))
    (= (apply13 (lam22 x y) z) (<= (new-maximum x y) z))))
(assert
  (forall ((x Int) (x2 Int)) (= (apply13 (lam23 x) x2) (<= x x2))))
(assert
  (forall ((x Int) (z Int)) (= (apply13 (lam24 x) z) (<= x z))))
(assert
  (forall ((x Int) (x2 Int))
    (= (apply13 (lam25 x) x2) (<= (+ x 1) x2))))
(assert
  (forall ((x list2) (z Int))
    (= (apply13 (lam26 x) z) (<= (new-maximum 1 x) z))))
(assert
  (forall ((x list2) (x2 Int))
    (= (apply13 (lam27 x) x2) (<= (new-maximum 0 x) x2))))
(assert (forall ((y Int)) (= (apply13 lam28 y) (<= 0 y))))
(assert (forall ((z Int)) (= (apply13 lam29 z) (<= 1 z))))
(assert (forall ((x2 Int)) (= (apply13 lam30 x2) (<= 1 x2))))
(assert-not
  (forall ((x Int) (e Expr) (a Expr) (y Int))
    (=> (elem x (free a))
      (= (elem y (++ (filter (lam2 x) (free a)) (free e)))
        (elem y (free (subst x e a)))))))
(assert-claim (= (new nil2) 1))
(assert-claim (= (new (cons2 1 nil2)) (+ 1 1)))
(assert-claim (= (free (Lam 0 (Var 1))) (cons2 1 nil2)))
(assert-claim (= (free (Lam 1 (Var 0))) (cons2 0 nil2)))
(assert-claim (forall ((y list)) (= (++2 y nil) y)))
(assert-claim (forall ((y list)) (= (++2 nil y) y)))
(assert-claim (forall ((y sk)) (not (elem2 y nil))))
(assert-claim (forall ((y fun12)) (= (filter2 y nil) nil)))
(assert-claim (forall ((x Int)) (= (free (Var x)) (cons2 x nil2))))
(assert-claim (forall ((x Int)) (= (new-maximum x nil2) x)))
(assert-claim (forall ((x list2)) (not (elem (new x) x))))
(assert-claim
  (forall ((x list2) (y list2)) (= (new (++ y x)) (new (++ x y)))))
(assert-claim (forall ((x list2)) (= (new (++ x x)) (new x))))
(assert-claim
  (forall ((x list2)) (= (new-maximum (new x) x) (new x))))
(assert-claim (forall ((x list2)) (<= 0 (new x))))
(assert-claim (forall ((x list2)) (<= 1 (new x))))
(assert-claim (forall ((x list2)) (= (new (cons2 0 x)) (new x))))
(assert-claim
  (forall ((y list) (z list) (x2 list))
    (= (++2 (++2 y z) x2) (++2 y (++2 z x2)))))
(assert-claim
  (forall ((x Int) (y list2)) (<= x (new-maximum x y))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y) (<= x (new-maximum y z)))))
(assert-claim
  (forall ((x Int) (y list2) (z Int))
    (=> (<= x z)
      (= (<= (new-maximum z y) z) (<= (new-maximum x y) z)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (cons y (++2 z x2)) (++2 (cons y z) x2))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (elem2 y (++2 x2 z)) (elem2 y (++2 z x2)))))
(assert-claim
  (forall ((y sk) (z list)) (= (elem2 y (++2 z z)) (elem2 y z))))
(assert-claim (forall ((y sk) (z list)) (elem2 y (cons y z))))
(assert-claim
  (forall ((y sk) (z sk) (x2 list))
    (=> (elem2 y x2) (= (elem2 z (cons y x2)) (elem2 z x2)))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (=> (elem2 y x2) (elem2 y (++2 z x2)))))
(assert-claim
  (forall ((y fun12) (z fun12) (x2 list))
    (= (filter2 z (filter2 y x2)) (filter2 y (filter2 z x2)))))
(assert-claim
  (forall ((y fun12) (z list))
    (= (filter2 y (filter2 y z)) (filter2 y z))))
(assert-claim
  (forall ((x Int) (y list2) (z list2))
    (= (new-maximum x (++ z y)) (new-maximum x (++ y z)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (new-maximum x (++ y y)) (new-maximum x y))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (new-maximum y (cons2 x z)) (new-maximum x (cons2 y z)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (new-maximum x (cons2 x y)) (new-maximum x y))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y) (= (new-maximum x (cons2 y z)) (new-maximum y z)))))
(assert-claim
  (forall ((x Int) (y list2) (z list2))
    (= (new-maximum (new-maximum x y) z) (new-maximum x (++ y z)))))
(assert-claim
  (forall ((x Int) (y Expr)) (= (subst x y (Var x)) y)))
(assert-claim
  (forall ((x Int) (y Expr)) (= (subst x (Var x) y) y)))
(assert-claim
  (forall ((x Expr) (y Expr))
    (= (++ (free x) (free y)) (free (App x y)))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (elem2 z (cons y nil)) (elem2 y (cons z nil)))))
(assert-claim
  (forall ((x Int) (y Int))
    (=> (<= y x) (= (elem y (cons2 x nil2)) (<= x y)))))
(assert-claim (forall ((x Int)) (= (free (Lam x (Var x))) nil2)))
(assert-claim
  (forall ((x list2)) (= (new (cons2 (new x) x)) (+ 1 (new x)))))
(assert-claim
  (forall ((x list2)) (= (new x) (+ 1 (new-maximum 0 x)))))
(assert-claim
  (forall ((x list2))
    (= (<= 1 (new-maximum 0 x)) (elem (new-maximum 1 x) x))))
(assert-claim
  (forall ((x list2)) (= (elem 0 (cons2 1 x)) (elem 0 x))))
(assert-claim
  (forall ((x list2)) (= (elem 1 (cons2 0 x)) (elem 1 x))))
(assert-claim
  (forall ((x Expr)) (= (new (free (Lam 0 x))) (new (free x)))))
(assert-claim (forall ((x Expr)) (= (subst 0 x (Var 1)) (Var 1))))
(assert-claim (forall ((x Expr)) (= (subst 1 x (Var 0)) (Var 0))))
(assert-claim (forall ((x list2)) (= (filter (lam3 x) x) nil2)))
(assert-claim
  (forall ((x list2)) (= (new (filter lam4 x)) (new x))))
(assert-claim
  (forall ((x list2)) (= (new (filter lam5 x)) (new x))))
(assert-claim
  (forall ((x Expr) (y Int) (z Expr))
    (= (subst y x (Lam y z)) (Lam y z))))
(assert-claim
  (forall ((x Int) (y list2) (z Int))
    (=> (<= z x) (not (<= (+ x (new y)) z)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y) (<= x (+ y (new z))))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= (new x) (new-maximum y x)) (<= (new x) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= (new-maximum x y) (new y)) (<= x (new y)))))
(assert-claim
  (forall ((x Int) (y Expr)) (not (elem x (free (Lam x y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (elem (new x) (++ x y)) (elem (new x) y))))
(assert-claim
  (forall ((x fun13) (y list2)) (not (elem (new y) (filter x y)))))
(assert-claim
  (forall ((x list2) (y list2)) (not (elem (new (++ y x)) y))))
(assert-claim
  (forall ((x list2) (y list2))
    (not (elem (new-maximum (new y) x) y))))
(assert-claim
  (forall ((x Int) (y Int) (z Expr))
    (= (free (Lam y (Lam x z))) (free (Lam x (Lam y z))))))
(assert-claim
  (forall ((x Int) (y Expr))
    (= (free (Lam x (Lam x y))) (free (Lam x y)))))
(assert-claim
  (forall ((x fun13) (y list2))
    (= (new (++ y (filter x y))) (new y))))
(assert-claim
  (forall ((x fun13) (y list2) (z list2))
    (= (new (filter x (++ z y))) (new (filter x (++ y z))))))
(assert-claim
  (forall ((x fun13) (y list2))
    (= (new (filter x (++ y y))) (new (filter x y)))))
(assert-claim
  (forall ((x Int) (y Expr))
    (= (new (free (subst x y y))) (new (free y)))))
(assert-claim
  (forall ((x Int) (y Expr))
    (= (new-maximum x (free (Lam x y))) (new-maximum x (free y)))))
(assert-claim
  (forall ((x Int) (y Int) (z Expr))
    (=> (<= x y)
      (= (new-maximum y (free (Lam x z))) (new-maximum y (free z))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (subst x (Var y) (Var y)) (subst x (Var x) (Var y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (<= (new x) (new-maximum 0 y))
      (elem (new-maximum (new x) y) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= (new (cons2 x y)) 1) (<= (new-maximum x y) 0))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (elem 0 (cons2 (new x) y)) (elem 0 (++ y y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (elem (new x) (cons2 0 y)) (elem (new x) y))))
(assert-claim
  (forall ((x Expr)) (= (free (Lam (new (free x)) x)) (free x))))
(assert-claim
  (forall ((x fun13) (y list2))
    (= (new (filter x (cons2 0 y))) (new (filter x y)))))
(assert-claim
  (forall ((x Expr) (y list2))
    (= (subst 0 x (Var (new y))) (Var (new y)))))
(assert-claim
  (forall ((x list2) (y Expr))
    (= (subst (new x) y (Var 0)) (Var 0))))
(assert-claim
  (forall ((x Expr))
    (= (elem 0 (free (Lam 1 x))) (elem 0 (free x)))))
(assert-claim
  (forall ((x Expr))
    (= (elem 1 (free (Lam 0 x))) (elem 1 (free x)))))
(assert-claim
  (forall ((x list2))
    (= (free (Lam 0 (Var (new x)))) (cons2 (new x) nil2))))
(assert-claim
  (forall ((x list2))
    (= (free (Lam (new x) (Var 0))) (cons2 0 nil2))))
(assert-claim
  (forall ((x Int)) (= (new (free (Lam x (Var 0)))) 1)))
(assert-claim
  (forall ((x Int) (y list2))
    (= (elem x (filter (lam6 x) y)) (elem x y))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= x y) (= (elem y (filter (lam7 x) z)) (elem y z)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (filter (lam8 x) (cons2 x y)) (cons2 x (filter (lam9 x) y)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (=> (<= y x)
      (= (filter (lam10 y) (cons2 x z))
        (cons2 x (filter (lam11 y) z))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (new-maximum x (filter (lam12 x) y)) (new-maximum x y))))
(assert-claim (forall ((x list2)) (not (elem 0 (filter lam13 x)))))
(assert-claim
  (forall ((x list2))
    (= (filter lam14 (cons2 0 x)) (filter lam15 x))))
(assert-claim
  (forall ((x list2))
    (= (new-maximum 0 (filter lam16 x)) (new-maximum 0 x))))
(assert-claim
  (forall ((x Int) (y Expr) (z Expr))
    (= (subst x (subst x y y) z) (subst x y (subst x y z)))))
(assert-claim
  (forall ((y fun12) (z list) (x2 list))
    (= (++2 (filter2 y z) (filter2 y x2)) (filter2 y (++2 z x2)))))
(assert-claim
  (forall ((x Int) (y Int) (z list2))
    (= (<= (new-maximum x z) (new-maximum y z))
      (<= x (new-maximum y z)))))
(assert-claim
  (forall ((x Int) (y list2) (z Int))
    (= (<= (new-maximum z (cons2 x y)) z) (<= (new-maximum x y) z))))
(assert-claim
  (forall ((y sk) (z list) (x2 list) (x3 list))
    (= (elem2 y (++2 z (++2 x3 x2))) (elem2 y (++2 z (++2 x2 x3))))))
(assert-claim
  (forall ((y sk) (z list) (x2 list))
    (= (elem2 y (++2 z (++2 z x2))) (elem2 y (++2 z x2)))))
(assert-claim
  (forall ((y fun12) (z sk) (x2 list))
    (= (elem2 z (++2 x2 (filter2 y x2))) (elem2 z x2))))
(assert-claim
  (forall ((y list) (z fun12) (x2 sk) (x3 list))
    (= (elem2 x2 (filter2 z (cons x2 y)))
      (elem2 x2 (filter2 z (cons x2 x3))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (elem x (cons2 (+ x x) y)) (elem x (cons2 0 y)))))
(assert-claim
  (forall ((x Int) (y Expr) (z Expr))
    (= (elem x (free (subst x z y))) (elem x (free (subst x y z))))))
(assert-claim
  (forall ((x Int) (y Int) (z Expr))
    (= (elem y (free (subst x z z))) (elem y (free z)))))
(assert-claim
  (forall ((x Int) (y list2)) (elem (new-maximum x y) (cons2 x y))))
(assert-claim
  (forall ((x Int) (y Expr) (z Expr))
    (= (free (subst x (Lam x y) z)) (free (Lam x (subst x y z))))))
(assert-claim
  (forall ((x fun13) (y Int) (z list2))
    (= (new-maximum y (++ z (filter x z))) (new-maximum y z))))
(assert-claim
  (forall ((x Int) (y fun13) (z list2))
    (= (new-maximum x (filter y (cons2 x z)))
      (new-maximum x (filter y z)))))
(assert-claim
  (forall ((x Int) (y Int) (z Expr))
    (= (new-maximum y (free (subst x z z))) (new-maximum y (free z)))))
(assert-claim
  (forall ((x Int) (y Expr) (z Expr))
    (= (subst x z (App y (Var x))) (App (subst x z y) z))))
(assert-claim
  (forall ((x Int) (y Expr) (z Expr))
    (= (subst x y (App (Var x) z)) (App y (subst x y z)))))
(assert-claim
  (forall ((x Int) (y Expr) (z Int))
    (= (subst x (Lam z y) (Var z)) (subst x (Lam x y) (Var z)))))
(assert-claim
  (forall ((x Expr) (y Int))
    (= (subst (+ y y) x (Var y)) (subst 0 x (Var y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= (+ x x) (new-maximum 0 y)) (<= (+ x x) (new-maximum x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= (+ x x) (new-maximum 1 y)) (<= (+ x x) (new-maximum x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= (+ x (new-maximum x y)) 0) (<= (+ x (new y)) 1))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= 0 (+ x (new-maximum x y))) (<= 1 (+ x (new y))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= 0 (new-maximum (+ x x) y)) (<= 0 (new-maximum x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= 1 (new-maximum (+ x x) y)) (<= 1 (new-maximum x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= (new (cons2 x y)) (new y)) (<= x (new-maximum 0 y)))))
(assert-claim
  (forall ((x Expr) (y Int))
    (= (<= (new (free (Lam y x))) y) (<= (new-maximum 1 (free x)) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= (new-maximum (+ x x) y) 0) (<= (new-maximum x y) 0))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= (new-maximum 0 x) (+ y y)) (<= (new-maximum y x) (+ y y)))))
(assert-claim
  (forall ((y sk) (z fun12) (x2 sk))
    (= (elem2 x2 (filter2 z (cons y nil)))
      (elem2 y (filter2 z (cons x2 nil))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (elem x (cons2 (+ y x) nil2)) (elem y (cons2 0 nil2)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (elem x (cons2 (+ x 1) y)) (elem x y))))
(assert-claim
  (forall ((x Int) (y Int) (z Int))
    (= (elem z (free (Lam y (Var x))))
      (elem x (free (Lam y (Var z)))))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (elem x (free (Lam y (Var x))))
      (elem y (free (Lam x (Var y)))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (elem (+ x x) (cons2 0 y)) (elem (+ x x) (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (elem (+ x x) (cons2 1 y)) (elem (+ x x) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (elem (+ x 1) (cons2 x y)) (elem (+ x 1) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (not (elem (+ 1 (new-maximum x y)) y))))
(assert-claim
  (forall ((x list2) (y list2)) (not (elem (+ (new y) (new x)) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (elem 0 (cons2 (+ x x) y)) (elem 0 (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (elem 1 (cons2 (+ x x) y)) (elem 1 y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (elem (new-maximum (+ x 1) y) y)
      (<= (+ x 1) (new-maximum x y)))))
(assert-claim
  (forall ((x Int) (y Expr))
    (= (free (Lam x (App y (Var x)))) (free (Lam x y)))))
(assert-claim
  (forall ((x Int) (y Expr))
    (= (free (Lam x (App (Var x) y))) (free (Lam x y)))))
(assert-claim
  (forall ((x Int) (y Int)) (= (free (Lam y (Lam x (Var y)))) nil2)))
(assert-claim
  (forall ((x Int))
    (= (free (Lam (+ x x) (Var x))) (free (Lam 0 (Var x))))))
(assert-claim
  (forall ((x Expr) (y Expr))
    (= (free (subst (new (free y)) x y)) (free y))))
(assert-claim
  (forall ((x Int) (y Expr))
    (= (new (cons2 x (free (Lam x y)))) (new (cons2 x (free y))))))
(assert-claim
  (forall ((x Int) (y Expr))
    (= (new (free (App y (Lam x y)))) (new (free y)))))
(assert-claim
  (forall ((x Int) (y Expr) (z Expr))
    (= (new (free (Lam x (App z y)))) (new (free (Lam x (App y z)))))))
(assert-claim
  (forall ((x Int) (y Expr))
    (= (new (free (Lam x (App y y)))) (new (free (Lam x y))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (new-maximum (+ 1 (new-maximum x y)) y)
      (+ 1 (new-maximum x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (new-maximum (+ (new x) (new y)) x) (+ (new x) (new y)))))
(assert-claim
  (forall ((x list2) (y list2) (z list2))
    (= (new-maximum (new x) (cons2 (new y) z))
      (new-maximum (new (++ x y)) z))))
(assert-claim
  (forall ((x Expr) (y Int))
    (= (subst y x (Var (+ y 1))) (Var (+ y 1)))))
(assert-claim
  (forall ((x Int) (y Expr))
    (= (subst (+ x x) y (Var 0)) (subst x y (Var 0)))))
(assert-claim
  (forall ((x Int) (y Expr)) (= (subst (+ x x) y (Var 1)) (Var 1))))
(assert-claim
  (forall ((x Expr) (y Int)) (= (subst (+ y 1) x (Var y)) (Var y))))
(assert-claim
  (forall ((x Expr) (y Int))
    (= (subst 0 x (Var (+ y y))) (subst y x (Var (+ y y))))))
(assert-claim
  (forall ((x Expr) (y Int))
    (= (subst 1 x (Var (+ y y))) (Var (+ y y)))))
(assert-claim
  (forall ((x Int) (y Int))
    (= (+ x (new-maximum y (cons2 0 nil2)))
      (new-maximum x (cons2 (+ x y) nil2)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= (+ x (new-maximum x y)) 1) (<= (+ x (new-maximum 1 y)) 1))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= 1 (+ x (new-maximum x y))) (<= 1 (+ x (new-maximum 0 y))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= 1 (new-maximum x (cons2 0 y))) (<= 1 (new-maximum x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (<= (new (cons2 1 x)) (new y))
      (elem (new-maximum 1 (++ x y)) y))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= (new-maximum (+ x x) y) 1) (<= (new-maximum (+ x 1) y) 1))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (<= (new-maximum 1 x) (new-maximum 1 y))
      (<= (new x) (new (cons2 1 y))))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (elem 0 (cons2 (new-maximum 1 x) y)) (elem 0 (++ y y)))))
(assert-claim
  (forall ((x fun13) (y list2))
    (= (elem 0 (filter x (cons2 1 y))) (elem 0 (filter x y)))))
(assert-claim
  (forall ((x list2) (y Expr))
    (= (elem 0 (free (Lam (new x) y))) (elem 0 (free y)))))
(assert-claim
  (forall ((x list2))
    (= (elem 1 (cons2 (new-maximum 0 x) x)) (elem 1 x))))
(assert-claim
  (forall ((x list2))
    (= (elem 1 (cons2 (new-maximum 1 x) x))
      (elem 1 (cons2 (new x) x)))))
(assert-claim
  (forall ((x fun13) (y list2))
    (= (elem 1 (filter x (cons2 0 y))) (elem 1 (filter x y)))))
(assert-claim
  (forall ((x list2) (y Expr))
    (= (elem (new x) (free (Lam 0 y))) (elem (new x) (free y)))))
(assert-claim
  (forall ((x list2))
    (= (elem (new-maximum 0 x) (cons2 1 x))
      (elem (new-maximum 0 x) x))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (elem (new-maximum 1 x) (cons2 0 y))
      (elem (new-maximum 1 x) y))))
(assert-claim
  (forall ((x Int))
    (= (free (Lam (+ x x) (Var 0))) (free (Lam x (Var 0))))))
(assert-claim
  (forall ((x Int))
    (= (free (Lam 0 (Var (+ x x)))) (free (Lam x (Var (+ x x)))))))
(assert-claim
  (forall ((x fun13) (y Expr))
    (= (new (filter x (free (Lam 0 y)))) (new (filter x (free y))))))
(assert-claim
  (forall ((x Int) (y Expr))
    (= (new (free (subst x (Var 0) y))) (new (free (Lam x y))))))
(assert-claim
  (forall ((x fun13) (y list2))
    (= (new-maximum 1 (filter x (cons2 0 y)))
      (new-maximum 1 (filter x y)))))
(assert-claim
  (forall ((x Expr) (y Expr))
    (= (subst 0 x (App y (Var 1))) (App (subst 0 x y) (Var 1)))))
(assert-claim
  (forall ((x Expr) (y Expr))
    (= (subst 0 x (App (Var 1) y)) (App (Var 1) (subst 0 x y)))))
(assert-claim
  (forall ((x Expr) (y list2))
    (= (subst 0 x (Var (new-maximum 1 y))) (Var (new-maximum 1 y)))))
(assert-claim
  (forall ((x Expr) (y Expr))
    (= (subst 1 x (App y (Var 0))) (App (subst 1 x y) (Var 0)))))
(assert-claim
  (forall ((x Expr) (y Expr))
    (= (subst 1 x (App (Var 0) y)) (App (Var 0) (subst 1 x y)))))
(assert-claim
  (forall ((x list2) (y Expr))
    (= (subst (new-maximum 1 x) y (Var 0)) (Var 0))))
(assert-claim
  (forall ((x Int))
    (= (free (Lam x (Lam 0 (Var 1)))) (free (Lam x (Var 1))))))
(assert-claim
  (forall ((x Expr))
    (= (free (Lam 0 (App x (Var 1)))) (free (App (Lam 0 x) (Var 1))))))
(assert-claim
  (forall ((x Expr))
    (= (free (Lam 0 (App (Var 1) x))) (cons2 1 (free (Lam 0 x))))))
(assert-claim
  (forall ((x Expr))
    (= (free (Lam 1 (App x (Var 0)))) (free (App (Lam 1 x) (Var 0))))))
(assert-claim
  (forall ((x Expr))
    (= (free (Lam 1 (App (Var 0) x))) (cons2 0 (free (Lam 1 x))))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (<= x (new (filter (lam17 x) y))) (<= x (new-maximum 1 y)))))
(assert-claim
  (forall ((x list2) (y Int))
    (= (<= (new (filter (lam18 y) x)) y) (<= (new x) y))))
(assert-claim
  (forall ((x list2) (y list2)) (= (filter (lam19 x y) y) nil2)))
(assert-claim
  (forall ((x list2) (y list2)) (= (filter (lam20 x y) y) nil2)))
(assert-claim
  (forall ((x Int) (y list2))
    (= (new (cons2 x (filter (lam21 x) y))) (new (cons2 x y)))))
(assert-claim
  (forall ((x Int) (y list2))
    (= (new (filter (lam22 x y) y)) (new (filter (lam23 x) y)))))
(assert-claim
  (forall ((x Int) (y Expr))
    (= (filter (lam24 x) (free (Lam x y)))
      (filter (lam25 x) (free y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (new (filter (lam26 x) y)) (new (filter (lam27 x) y)))))
(assert-claim
  (forall ((x list2))
    (= (filter lam28 (filter lam29 x)) (filter lam30 x))))
