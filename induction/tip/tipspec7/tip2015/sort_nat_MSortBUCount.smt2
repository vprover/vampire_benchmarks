(declare-sort sk 0)
(declare-sort fun1 0)
(declare-sort fun12 0)
(declare-sort fun13 0)
(declare-sort fun14 0)
(declare-sort fun15 0)
(declare-sort fun16 0)
(declare-sort fun17 0)
(declare-datatype list3 ((nil3) (cons3 (head3 sk) (tail3 list3))))
(declare-datatype Nat ((zero) (succ (p Nat))))
(declare-datatype list2 ((nil2) (cons2 (head2 Nat) (tail2 list2))))
(declare-datatype list ((nil) (cons (head list2) (tail list))))
(declare-const lam fun13)
(declare-const lam2 fun1)
(declare-const lam3 fun1)
(declare-const lam4 fun17)
(declare-const lam5 fun1)
(declare-const lam6 fun17)
(declare-const lam7 fun17)
(declare-const lam8 fun17)
(declare-const lam9 fun1)
(declare-const lam10 fun1)
(declare-const lam11 fun17)
(declare-const lam12 fun17)
(declare-const lam13 fun17)
(declare-const lam14 fun17)
(declare-fun lam15 (list2 list) fun16)
(declare-fun lam16 (list2 list) fun16)
(declare-const lam17 fun17)
(declare-fun lam18 (Nat) fun1)
(declare-fun lam19 (Nat) fun1)
(declare-const lam20 fun1)
(declare-const lam21 fun1)
(declare-const lam22 fun17)
(declare-const lam23 fun17)
(declare-const lam24 fun17)
(declare-const lam25 fun1)
(declare-const lam26 fun17)
(declare-const lam27 fun1)
(declare-const lam28 fun1)
(declare-const lam29 fun17)
(declare-const lam30 fun1)
(declare-const lam31 fun17)
(declare-fun lam32 (Nat) fun1)
(declare-fun lam33 (list2) fun17)
(declare-const lam34 fun17)
(declare-const lam35 fun1)
(declare-const lam36 fun1)
(declare-const lam37 fun17)
(declare-const lam38 fun17)
(declare-const lam39 fun1)
(declare-fun lam40 (Nat) fun17)
(declare-fun lam41 (Nat) fun1)
(declare-fun lam42 (Nat) fun1)
(declare-fun lam43 (Nat) fun1)
(declare-fun lam44 (Nat) fun16)
(declare-fun lam45 (Nat) fun17)
(declare-fun lam46 (list2) fun17)
(declare-const lam47 fun1)
(declare-const lam48 fun1)
(declare-const lam49 fun1)
(declare-const lam50 fun1)
(declare-fun lam51 (Nat) fun1)
(declare-fun lam52 (Nat) fun1)
(declare-fun lam53 (Nat) fun1)
(declare-const lam54 fun1)
(declare-fun lam55 (Nat) fun1)
(declare-fun lam56 (Nat) fun16)
(declare-const lam57 fun17)
(declare-fun lam58 (Nat) fun16)
(declare-fun lam59 (Nat) fun1)
(declare-fun lam60 (Nat) fun17)
(declare-fun lam61 (Nat) fun1)
(declare-fun lam62 (Nat) fun1)
(declare-fun lam63 (Nat) fun17)
(declare-fun lam64 (Nat) fun1)
(declare-fun lam65 (Nat) fun17)
(declare-const lam66 fun1)
(declare-const lam67 fun17)
(declare-const lam68 fun17)
(declare-const lam69 fun17)
(declare-const lam70 fun17)
(declare-const lam71 fun17)
(declare-const lam72 fun17)
(declare-const lam73 fun17)
(declare-const lam74 fun1)
(declare-const lam75 fun17)
(declare-const lam76 fun1)
(declare-const lam77 fun17)
(declare-const lam78 fun17)
(declare-const lam79 fun1)
(declare-const lam80 fun17)
(declare-fun lam81 (Nat) fun1)
(declare-const lam82 fun1)
(declare-fun lam83 (list2) fun17)
(declare-fun lam84 (list2) fun17)
(declare-const lam85 fun1)
(declare-const lam86 fun1)
(declare-fun lam87 (list2) fun17)
(declare-const lam88 fun1)
(declare-fun lam89 (list2) fun17)
(declare-const lam90 fun1)
(declare-const lam91 fun1)
(declare-fun lam92 (Nat) fun1)
(declare-fun lam93 (Nat) fun1)
(declare-fun lam94 (list2) fun17)
(declare-fun lam95 (list2) fun17)
(declare-const lam96 fun17)
(declare-fun lam97 (Nat) fun1)
(declare-fun lam98 (Nat) fun1)
(declare-fun lam99 (Nat Nat) fun1)
(declare-fun lam100 (list2) fun17)
(declare-fun lam101 (list2) fun17)
(declare-fun lam102 (list2 list2) fun17)
(declare-const lam103 fun16)
(declare-fun lam104 (list) fun16)
(declare-const lam105 fun16)
(declare-fun lam106 (Nat) fun1)
(declare-fun lam107 (Nat) fun17)
(declare-const lam108 fun17)
(declare-const lam109 fun1)
(declare-const lam110 fun17)
(declare-const lam111 fun1)
(declare-const lam112 fun1)
(declare-const lam113 fun1)
(declare-const lam114 fun1)
(declare-fun lam115 (list2) fun17)
(declare-const lam116 fun17)
(declare-const lam117 fun17)
(declare-fun lam118 (list2) fun17)
(declare-const lam119 fun16)
(declare-const lam120 fun17)
(declare-const lam121 fun1)
(declare-const lam122 fun16)
(declare-const lam123 fun17)
(declare-fun lam124 (Nat) fun1)
(declare-fun lam125 (Nat) fun17)
(declare-fun lam126 (Nat) fun1)
(declare-fun lam127 (Nat) fun17)
(declare-const lam128 fun17)
(declare-const lam129 fun1)
(declare-const lam130 fun17)
(declare-const lam131 fun1)
(declare-const lam132 fun17)
(declare-const lam133 fun1)
(declare-const lam134 fun17)
(declare-fun apply1 (fun1 Nat) Nat)
(declare-fun apply12 (fun12 Nat) sk)
(declare-fun apply13 (fun13 Nat) list2)
(declare-fun apply14 (fun14 sk) Nat)
(declare-fun apply15 (fun15 sk) sk)
(declare-fun apply16 (fun16 list2) Nat)
(declare-fun apply17 (fun17 list2) list2)
(define-fun-rec
  plus
  ((x Nat) (y Nat)) Nat
  (match x
    ((zero y)
     ((succ z) (succ (plus z y))))))
(define-fun-rec
  map8
  ((f fun15) (x list3)) list3
  (match x
    ((nil3 nil3)
     ((cons3 y xs) (cons3 (apply15 f y) (map8 f xs))))))
(define-fun-rec
  map7
  ((f fun14) (x list3)) list2
  (match x
    ((nil3 nil2)
     ((cons3 y xs) (cons2 (apply14 f y) (map7 f xs))))))
(define-fun-rec
  map6
  ((f fun12) (x list2)) list3
  (match x
    ((nil2 nil3)
     ((cons2 y xs) (cons3 (apply12 f y) (map6 f xs))))))
(define-fun-rec
  map5
  ((f fun1) (x list2)) list2
  (match x
    ((nil2 nil2)
     ((cons2 y xs) (cons2 (apply1 f y) (map5 f xs))))))
(define-fun-rec
  map4
  ((f fun16) (x list)) list2
  (match x
    ((nil nil2)
     ((cons y xs) (cons2 (apply16 f y) (map4 f xs))))))
(define-fun-rec
  map3
  ((f fun17) (x list)) list
  (match x
    ((nil nil)
     ((cons y xs) (cons (apply17 f y) (map3 f xs))))))
(define-fun-rec
  map2
  ((f fun13) (x list2)) list
  (match x
    ((nil2 nil)
     ((cons2 y xs) (cons (apply13 f y) (map2 f xs))))))
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
  lmerge
  ((x list2) (y list2)) list2
  (match x
    ((nil2 y)
     ((cons2 z x2)
      (match y
        ((nil2 (cons2 z x2))
         ((cons2 x3 x4)
          (ite
            (leq z x3) (cons2 z (lmerge x2 (cons2 x3 x4)))
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
(define-fun-rec
  count3
  ((x sk) (y list3)) Nat
  (match y
    ((nil3 zero)
     ((cons3 z ys)
      (ite (= x z) (plus (succ zero) (count3 x ys)) (count3 x ys))))))
(define-fun-rec
  count2
  ((x Nat) (y list2)) Nat
  (match y
    ((nil2 zero)
     ((cons2 z ys)
      (ite (= x z) (plus (succ zero) (count2 x ys)) (count2 x ys))))))
(define-fun-rec
  count
  ((x list2) (y list)) Nat
  (match y
    ((nil zero)
     ((cons z ys)
      (ite (= x z) (plus (succ zero) (count x ys)) (count x ys))))))
(assert
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus x (plus y z)) (plus (plus x y) z))))
(assert (forall ((x Nat) (y Nat)) (= (plus x y) (plus y x))))
(assert (forall ((x Nat)) (= (plus x zero) x)))
(assert (forall ((x Nat)) (= (plus zero x) x)))
(assert (forall ((y Nat)) (= (apply13 lam y) (cons2 y nil2))))
(assert
  (forall ((y Nat)) (= (apply1 lam2 y) (plus (succ zero) y))))
(assert (forall ((z Nat)) (= (apply1 lam3 z) (succ z))))
(assert (forall ((y list2)) (= (apply17 lam4 y) (lmerge nil2 y))))
(assert (forall ((y list2)) (= (apply17 lam6 y) (map5 lam5 y))))
(assert (forall ((z Nat)) (= (apply1 lam5 z) (plus zero z))))
(assert (forall ((y list2)) (= (apply17 lam7 y) (lmerge nil2 y))))
(assert (forall ((y list2)) (= (apply17 lam8 y) (msortbu y))))
(assert (forall ((y Nat)) (= (apply1 lam9 y) (succ y))))
(assert (forall ((z Nat)) (= (apply1 lam10 z) (succ z))))
(assert (forall ((y list2)) (= (apply17 lam11 y) (msortbu y))))
(assert (forall ((z list2)) (= (apply17 lam12 z) (msortbu z))))
(assert
  (forall ((y list2))
    (= (apply17 lam13 y) (lmerge (cons2 zero nil2) y))))
(assert (forall ((y list2)) (= (apply17 lam14 y) (cons2 zero y))))
(assert
  (forall ((x list2) (y list) (x2 list2))
    (= (apply16 (lam15 x y) x2) (count2 (count (msortbu x) y) x2))))
(assert
  (forall ((x list2) (y list) (x2 list2))
    (= (apply16 (lam16 x y) x2) (count2 (count x y) x2))))
(assert (forall ((z list2)) (= (apply17 lam17 z) (msortbu z))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam18 x) z) (plus x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam19 x) x2) (plus x x2))))
(assert (forall ((y Nat)) (= (apply1 lam20 y) (succ y))))
(assert (forall ((y Nat)) (= (apply1 lam21 y) (succ y))))
(assert (forall ((y list2)) (= (apply17 lam22 y) (msortbu y))))
(assert (forall ((z list2)) (= (apply17 lam23 z) (msortbu z))))
(assert (forall ((x2 list2)) (= (apply17 lam24 x2) (msortbu x2))))
(assert (forall ((y list2)) (= (apply17 lam26 y) (map5 lam25 y))))
(assert (forall ((z Nat)) (= (apply1 lam25 z) (succ z))))
(assert (forall ((x2 Nat)) (= (apply1 lam27 x2) (succ x2))))
(assert (forall ((y list2)) (= (apply17 lam29 y) (map5 lam28 y))))
(assert (forall ((z Nat)) (= (apply1 lam28 z) (succ z))))
(assert
  (forall ((x2 list2)) (= (apply17 lam31 x2) (map5 lam30 x2))))
(assert (forall ((x3 Nat)) (= (apply1 lam30 x3) (succ x3))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam32 x) z) (plus x z))))
(assert
  (forall ((x list2) (z list2))
    (= (apply17 (lam33 x) z) (lmerge x z))))
(assert (forall ((x2 list2)) (= (apply17 lam34 x2) (msortbu x2))))
(assert (forall ((z Nat)) (= (apply1 lam35 z) (succ z))))
(assert (forall ((x2 Nat)) (= (apply1 lam36 x2) (succ x2))))
(assert (forall ((z list2)) (= (apply17 lam37 z) (msortbu z))))
(assert (forall ((x2 list2)) (= (apply17 lam38 x2) (msortbu x2))))
(assert (forall ((z Nat)) (= (apply1 lam39 z) (succ z))))
(assert
  (forall ((y Nat) (x2 list2))
    (= (apply17 (lam40 y) x2) (cons2 y x2))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam41 x) z) (plus x z))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam42 x) z) (plus x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam43 x) x2) (plus x x2))))
(assert
  (forall ((y Nat) (x2 list2))
    (= (apply16 (lam44 y) x2) (count2 y x2))))
(assert
  (forall ((y Nat) (x2 list2))
    (= (apply17 (lam45 y) x2) (cons2 y x2))))
(assert
  (forall ((x list2) (z list2))
    (= (apply17 (lam46 x) z) (lmerge x z))))
(assert
  (forall ((y Nat))
    (= (apply1 lam47 y) (plus (succ (succ zero)) y))))
(assert (forall ((z Nat)) (= (apply1 lam48 z) (succ z))))
(assert (forall ((x2 Nat)) (= (apply1 lam49 x2) (succ x2))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam51 x) x2) (plus x x2))))
(assert
  (forall ((x Nat) (x3 Nat))
    (= (apply1 (lam52 x) x3) (plus (succ x) x3))))
(assert (forall ((z Nat)) (= (apply1 lam50 z) (succ z))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam53 x) z) (plus x z))))
(assert
  (forall ((x Nat) (x3 Nat))
    (= (apply1 (lam55 x) x3) (plus (succ x) x3))))
(assert (forall ((x2 Nat)) (= (apply1 lam54 x2) (succ x2))))
(assert
  (forall ((y Nat) (x2 list2))
    (= (apply16 (lam56 y) x2) (count2 y x2))))
(assert
  (forall ((y Nat) (x4 list2))
    (= (apply16 (lam58 y) x4) (count2 y x4))))
(assert (forall ((x3 list2)) (= (apply17 lam57 x3) (msortbu x3))))
(assert
  (forall ((x Nat) (z list2))
    (= (apply17 (lam60 x) z) (map5 (lam59 x) z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam59 x) x2) (plus x x2))))
(assert
  (forall ((x Nat) (x3 Nat)) (= (apply1 (lam61 x) x3) (plus x x3))))
(assert
  (forall ((x Nat) (z list2))
    (= (apply17 (lam63 x) z) (map5 (lam62 x) z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam62 x) x2) (plus x x2))))
(assert
  (forall ((x Nat) (x3 list2))
    (= (apply17 (lam65 x) x3) (map5 (lam64 x) x3))))
(assert
  (forall ((x Nat) (x4 Nat)) (= (apply1 (lam64 x) x4) (plus x x4))))
(assert (forall ((y list2)) (= (apply17 lam67 y) (map5 lam66 y))))
(assert (forall ((z Nat)) (= (apply1 lam66 z) (succ z))))
(assert (forall ((x2 list2)) (= (apply17 lam68 x2) (msortbu x2))))
(assert (forall ((y list2)) (= (apply17 lam69 y) (msortbu y))))
(assert (forall ((z list2)) (= (apply17 lam70 z) (cons2 zero z))))
(assert
  (forall ((x2 list2)) (= (apply17 lam71 x2) (cons2 zero x2))))
(assert (forall ((x3 list2)) (= (apply17 lam72 x3) (msortbu x3))))
(assert (forall ((y list2)) (= (apply17 lam73 y) (msortbu y))))
(assert (forall ((z list2)) (= (apply17 lam75 z) (map5 lam74 z))))
(assert (forall ((x2 Nat)) (= (apply1 lam74 x2) (succ x2))))
(assert
  (forall ((x3 list2)) (= (apply17 lam77 x3) (map5 lam76 x3))))
(assert (forall ((x4 Nat)) (= (apply1 lam76 x4) (succ x4))))
(assert (forall ((x5 list2)) (= (apply17 lam78 x5) (msortbu x5))))
(assert (forall ((y Nat)) (= (apply1 lam79 y) (succ y))))
(assert (forall ((z list2)) (= (apply17 lam80 z) (msortbu z))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam81 x) z) (plus x z))))
(assert (forall ((z Nat)) (= (apply1 lam82 z) (succ z))))
(assert
  (forall ((y list2) (x2 list2))
    (= (apply17 (lam83 y) x2) (lmerge (msortbu y) x2))))
(assert
  (forall ((y list2) (x3 list2))
    (= (apply17 (lam84 y) x3) (lmerge y x3))))
(assert (forall ((x2 Nat)) (= (apply1 lam85 x2) (succ x2))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply17 (lam87 x) x2) (lmerge x x2))))
(assert (forall ((z Nat)) (= (apply1 lam86 z) (succ z))))
(assert (forall ((x2 Nat)) (= (apply1 lam88 x2) (succ x2))))
(assert
  (forall ((x list2) (z list2))
    (= (apply17 (lam89 x) z) (lmerge x z))))
(assert (forall ((z Nat)) (= (apply1 lam90 z) (succ z))))
(assert (forall ((z Nat)) (= (apply1 lam91 z) (succ z))))
(assert
  (forall ((x Nat) (z Nat)) (= (apply1 (lam92 x) z) (plus x z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam93 x) x2) (plus x x2))))
(assert
  (forall ((x list2) (z list2))
    (= (apply17 (lam94 x) z) (lmerge (msortbu x) z))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply17 (lam95 x) x2) (lmerge x x2))))
(assert (forall ((y list2)) (= (apply17 lam96 y) (cons2 zero y))))
(assert
  (forall ((x Nat) (y Nat) (x4 Nat))
    (= (apply1 (lam99 x y) x4) (plus (plus x y) x4))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam97 x) x2) (plus x x2))))
(assert
  (forall ((y Nat) (x3 Nat)) (= (apply1 (lam98 y) x3) (plus y x3))))
(assert
  (forall ((x list2) (y list2) (x4 list2))
    (= (apply17 (lam102 x y) x4) (lmerge (lmerge x y) x4))))
(assert
  (forall ((x list2) (x2 list2))
    (= (apply17 (lam100 x) x2) (lmerge x x2))))
(assert
  (forall ((y list2) (x3 list2))
    (= (apply17 (lam101 y) x3) (lmerge y x3))))
(assert
  (forall ((x list) (z list2))
    (= (apply16 (lam104 x) z) (count2 (count (map4 lam103 x) x) z))))
(assert
  (forall ((x2 list2)) (= (apply16 lam103 x2) (count2 zero x2))))
(assert
  (forall ((z list2)) (= (apply16 lam105 z) (count2 zero z))))
(assert
  (forall ((x Nat) (z list2))
    (= (apply17 (lam107 x) z) (map5 (lam106 x) z))))
(assert
  (forall ((x Nat) (x2 Nat)) (= (apply1 (lam106 x) x2) (plus x x2))))
(assert (forall ((x3 list2)) (= (apply17 lam108 x3) (msortbu x3))))
(assert
  (forall ((y list2)) (= (apply17 lam110 y) (map5 lam109 y))))
(assert (forall ((z Nat)) (= (apply1 lam109 z) (succ z))))
(assert (forall ((x2 Nat)) (= (apply1 lam111 x2) (succ x2))))
(assert (forall ((z Nat)) (= (apply1 lam112 z) (succ z))))
(assert (forall ((x2 Nat)) (= (apply1 lam113 x2) (succ x2))))
(assert (forall ((x3 Nat)) (= (apply1 lam114 x3) (succ x3))))
(assert
  (forall ((x list2) (z list2))
    (= (apply17 (lam115 x) z) (lmerge (msortbu x) z))))
(assert
  (forall ((x list2) (x4 list2))
    (= (apply17 (lam118 x) x4) (lmerge x x4))))
(assert (forall ((x2 list2)) (= (apply17 lam116 x2) (msortbu x2))))
(assert (forall ((x3 list2)) (= (apply17 lam117 x3) (msortbu x3))))
(assert
  (forall ((y list2)) (= (apply16 lam119 y) (count2 zero y))))
(assert (forall ((z list2)) (= (apply17 lam120 z) (cons2 zero z))))
(assert (forall ((x2 Nat)) (= (apply1 lam121 x2) (succ x2))))
(assert
  (forall ((x3 list2)) (= (apply16 lam122 x3) (count2 zero x3))))
(assert
  (forall ((x Nat) (x2 list2))
    (= (apply17 (lam125 x) x2) (map5 (lam124 x) x2))))
(assert
  (forall ((x Nat) (x3 Nat)) (= (apply1 (lam124 x) x3) (plus x x3))))
(assert
  (forall ((x Nat) (x4 list2))
    (= (apply17 (lam127 x) x4) (map5 (lam126 x) x4))))
(assert
  (forall ((x Nat) (x5 Nat)) (= (apply1 (lam126 x) x5) (plus x x5))))
(assert (forall ((z list2)) (= (apply17 lam123 z) (msortbu z))))
(assert (forall ((x6 list2)) (= (apply17 lam128 x6) (msortbu x6))))
(assert
  (forall ((y list2)) (= (apply17 lam130 y) (map5 lam129 y))))
(assert (forall ((z Nat)) (= (apply1 lam129 z) (succ z))))
(assert
  (forall ((x2 list2)) (= (apply17 lam132 x2) (map5 lam131 x2))))
(assert (forall ((x3 Nat)) (= (apply1 lam131 x3) (succ x3))))
(assert
  (forall ((x4 list2)) (= (apply17 lam134 x4) (map5 lam133 x4))))
(assert
  (forall ((x5 Nat))
    (= (apply1 lam133 x5) (plus (succ (succ zero)) x5))))
(assert-not
  (forall ((x Nat) (xs list2))
    (= (count2 x (msortbu xs)) (count2 x xs))))
(assert-claim (= (pairwise nil) nil))
(assert-claim (= (mergingbu nil) nil2))
(assert-claim (= (msortbu nil2) nil2))
(assert-claim (forall ((x Nat)) (leq x x)))
(assert-claim (forall ((x Nat) (y Nat)) (= (plus y x) (plus x y))))
(assert-claim (forall ((y sk)) (= (count3 y nil3) zero)))
(assert-claim (forall ((x Nat)) (leq zero x)))
(assert-claim (forall ((x list2)) (= (lmerge x nil2) x)))
(assert-claim (forall ((x list2)) (= (lmerge nil2 x) x)))
(assert-claim (forall ((z fun15)) (= (map8 z nil3) nil3)))
(assert-claim
  (forall ((x list)) (= (mergingbu (pairwise x)) (mergingbu x))))
(assert-claim
  (forall ((x list2)) (= (msortbu (msortbu x)) (msortbu x))))
(assert-claim (forall ((x Nat)) (= (plus x zero) x)))
(assert-claim
  (forall ((x Nat)) (= (apply1 lam2 x) (apply1 lam3 x))))
(assert-claim
  (forall ((x list2)) (= (apply17 lam4 x) (apply17 lam6 x))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (count2 x (msortbu y)) (count2 x y))))
(assert-claim (forall ((x Nat)) (leq x (succ x))))
(assert-claim (forall ((x Nat)) (not (leq (succ x) x))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq y x) (not (leq (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (=> (leq x y) (leq x (succ y)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (mergingbu (cons x y)) (lmerge x (mergingbu y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (msortbu (lmerge y x)) (msortbu (lmerge x y)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (plus x (succ y)) (succ (plus x y)))))
(assert-claim
  (forall ((x Nat)) (= (msortbu (cons2 x nil2)) (cons2 x nil2))))
(assert-claim
  (forall ((x list2))
    (= (msortbu (cons2 zero x)) (cons2 zero (msortbu x)))))
(assert-claim
  (forall ((x list2)) (= (pairwise (cons x nil)) (cons x nil))))
(assert-claim (forall ((x list)) (= (map3 lam7 x) x)))
(assert-claim
  (forall ((x list))
    (= (mergingbu (map3 lam8 x)) (msortbu (mergingbu x)))))
(assert-claim
  (forall ((x list2))
    (= (msortbu (map5 lam9 x)) (map5 lam10 (msortbu x)))))
(assert-claim
  (forall ((x list))
    (= (pairwise (map3 lam11 x)) (map3 lam12 (pairwise x)))))
(assert-claim
  (forall ((x list2)) (= (apply17 lam13 x) (apply17 lam14 x))))
(assert-claim
  (forall ((y sk) (z list3))
    (= (count3 y (cons3 y z)) (succ (count3 y z)))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (count (lmerge y x) z) (count (lmerge x y) z))))
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
  (forall ((x list2) (y list2) (z list2))
    (= (lmerge (lmerge x y) z) (lmerge x (lmerge y z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (plus (plus x y) z) (plus x (plus y z)))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count3 z (cons3 y nil3)) (count3 y (cons3 z nil3)))))
(assert-claim
  (forall ((x Nat) (y Nat)) (= (leq (succ x) (succ y)) (leq x y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y) (= (leq (plus x y) zero) (leq y zero)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge x (cons2 zero y)) (cons2 zero (lmerge x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (cons2 zero x) y) (cons2 zero (lmerge x y)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (msortbu x) (msortbu y)) (msortbu (lmerge x y)))))
(assert-claim
  (forall ((z fun15) (x2 sk))
    (= (map8 z (cons3 x2 nil3)) (cons3 (apply15 z x2) nil3))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (msortbu (cons2 x (msortbu y))) (msortbu (cons2 x y)))))
(assert-claim
  (forall ((x fun1) (y list2))
    (= (msortbu (map5 x (msortbu y))) (msortbu (map5 x y)))))
(assert-claim
  (forall ((x list))
    (= (pairwise (pairwise (pairwise (pairwise x))))
      (pairwise (pairwise (pairwise x))))))
(assert-claim
  (forall ((x list2) (y list) (z list2))
    (= (apply16 (lam15 x y) z) (apply16 (lam16 x y) z))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count x (map3 lam17 y)) (count (msortbu x) y))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (msortbu (map5 (lam18 x) y)) (map5 (lam19 x) (msortbu y)))))
(assert-claim
  (forall ((x list2)) (= (count2 zero (map5 lam20 x)) zero)))
(assert-claim
  (forall ((x Nat))
    (= (map5 lam21 (cons2 x nil2)) (cons2 (succ x) nil2))))
(assert-claim
  (forall ((x list)) (= (map3 lam22 (map3 lam23 x)) (map3 lam24 x))))
(assert-claim
  (forall ((x list))
    (= (mergingbu (map3 lam26 x)) (map5 lam27 (mergingbu x)))))
(assert-claim
  (forall ((x list))
    (= (pairwise (map3 lam29 x)) (map3 lam31 (pairwise x)))))
(assert-claim
  (forall ((x fun17) (y list2) (z list))
    (= (count (msortbu (apply17 x y)) z) (count (apply17 x y) z))))
(assert-claim
  (forall ((y sk) (z fun12) (x2 list2))
    (= (count3 y (map6 z (msortbu x2))) (count3 y (map6 z x2)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (count2 x (cons2 (succ x) y)) (count2 x y))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (count2 (succ x) (cons2 x y)) (count2 (succ x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list2))
    (=> (leq x y)
      (= (count2 (succ y) (cons2 x z)) (count2 (succ y) z)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list2))
    (=> (leq y x) (= (count2 y (cons2 (succ x) z)) (count2 y z)))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (count x (cons (msortbu y) z)) (count x (cons y z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count (cons2 x (mergingbu y)) y) zero)))
(assert-claim
  (forall ((x fun16) (y list))
    (= (count (msortbu (map4 x y)) y)
      (count (map4 x y) (pairwise y)))))
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
  (forall ((x Nat) (y Nat) (z Nat) (x2 list2))
    (=> (leq z x)
      (= (msortbu (cons2 z (cons2 y x2)))
        (msortbu (cons2 y (cons2 z x2)))))))
(assert-claim
  (forall ((x Nat) (y list2) (z list2))
    (= (msortbu (lmerge y (cons2 x z)))
      (msortbu (cons2 x (lmerge y z))))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (pairwise (cons x (cons y z)))
      (cons (lmerge x y) (pairwise z)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (leq (succ zero) (plus x y)) (leq (succ zero) y)))))
(assert-claim
  (forall ((x Nat)) (= (leq (plus x x) (succ zero)) (leq x zero))))
(assert-claim
  (forall ((x Nat))
    (= (msortbu (cons2 x (cons2 x nil2))) (cons2 x (cons2 x nil2)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (=> (leq x y)
      (= (msortbu (cons2 x (cons2 y nil2))) (cons2 x (cons2 y nil2))))))
(assert-claim
  (forall ((x fun13) (y list2))
    (= (msortbu (mergingbu (map2 x (msortbu y))))
      (msortbu (mergingbu (map2 x y))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (pairwise (pairwise (cons x y))))
      (cons (lmerge x (mergingbu y)) nil))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (count2 x (map5 (lam32 x) y)) (count2 zero y))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count x (map3 (lam33 x) y)) (count nil2 (map3 lam34 y)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (cons2 (succ x) (map5 lam35 y)) (map5 lam36 (cons2 x y)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (cons (msortbu x) (map3 lam37 y)) (map3 lam38 (cons x y)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (count2 (succ x) (map5 lam39 y)) (count2 x y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x) (= (count nil2 (map3 (lam40 y) z)) zero))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (map5 (lam41 x) (cons2 y nil2)) (cons2 (plus x y) nil2))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (cons2 x (map5 (lam42 x) y)) (map5 (lam43 x) (cons2 zero y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list2))
    (=> (leq y x)
      (= (map4 (lam44 y) (cons z nil)) (cons2 (count2 y z) nil2)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list2))
    (=> (leq y x)
      (= (map3 (lam45 y) (cons z nil)) (cons (cons2 y z) nil)))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (map3 (lam46 x) (cons y nil)) (cons (lmerge x y) nil))))
(assert-claim
  (forall ((x list2))
    (= (map5 lam47 x) (map5 lam48 (map5 lam49 x)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (map5 lam50 (map5 (lam51 x) y)) (map5 (lam52 x) y))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (map5 (lam53 x) (map5 lam54 y)) (map5 (lam55 x) y))))
(assert-claim
  (forall ((x Nat) (y Nat) (z list))
    (=> (leq y x)
      (= (map4 (lam56 y) (map3 lam57 z)) (map4 (lam58 y) z)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (mergingbu (map3 (lam60 x) y)) (map5 (lam61 x) (mergingbu y)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (pairwise (map3 (lam63 x) y)) (map3 (lam65 x) (pairwise y)))))
(assert-claim
  (forall ((x list))
    (= (count nil2 (map3 lam67 x)) (count nil2 (map3 lam68 x)))))
(assert-claim
  (forall ((x list))
    (= (map3 lam69 (map3 lam70 x)) (map3 lam71 (map3 lam72 x)))))
(assert-claim
  (forall ((x list))
    (= (map3 lam73 (map3 lam75 x)) (map3 lam77 (map3 lam78 x)))))
(assert-claim
  (forall ((z fun15) (x2 sk) (x3 list3))
    (= (cons3 (apply15 z x2) (map8 z x3)) (map8 z (cons3 x2 x3)))))
(assert-claim
  (forall ((x Nat) (y fun1))
    (= (leq (plus x (apply1 y x)) zero)
      (leq (plus x (apply1 y zero)) zero))))
(assert-claim
  (forall ((y sk) (z sk) (x2 sk) (x3 list3))
    (= (count3 y (cons3 x2 (cons3 z x3)))
      (count3 y (cons3 z (cons3 x2 x3))))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (count2 x (cons2 (plus x x) y)) (count2 x (cons2 zero y)))))
(assert-claim
  (forall ((x fun1) (y fun1) (z list2) (x2 list))
    (= (count (lmerge z (map5 x z)) x2)
      (count (lmerge z (map5 y z)) x2))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (leq x (count2 (plus x x) y)) (leq x (count2 (succ x) y)))))
(assert-claim
  (forall ((x Nat) (y Nat) (z Nat))
    (= (leq (plus y x) (plus z x)) (leq y z))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus x x) (plus y y)) (leq x y))))
(assert-claim
  (forall ((x list2) (y Nat) (z list2))
    (= (lmerge (cons2 y x) (cons2 y z))
      (cons2 y (lmerge x (cons2 y z))))))
(assert-claim
  (forall ((x list) (y list2))
    (= (lmerge (cons2 (count y x) y) y)
      (lmerge y (cons2 (count y x) y)))))
(assert-claim
  (forall ((x Nat) (y list2) (z list2))
    (= (plus (count2 x y) (count2 x z)) (count2 x (lmerge y z)))))
(assert-claim
  (forall ((y sk) (z sk))
    (= (count3 z (cons3 y (cons3 y nil3)))
      (count3 y (cons3 z (cons3 z nil3))))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (count2 x (cons2 (plus y x) nil2))
      (count2 y (cons2 zero nil2)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (count2 zero (cons2 (plus x x) y)) (count2 zero (cons2 x y)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (count2 (plus x x) (cons2 zero y))
      (count2 (plus x x) (cons2 x y)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count x (cons (cons2 zero x) y)) (count x y))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (count x (cons (lmerge y x) nil))
      (count nil2 (cons (msortbu y) nil)))))
(assert-claim
  (forall ((x Nat) (y list2) (z list))
    (= (count (cons2 (succ x) y) (pairwise z))
      (count (cons2 (succ x) y) z))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count (cons2 zero x) (cons x y)) (count (cons2 zero x) y))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count nil2 (cons (lmerge x x) y))
      (count nil2 (cons (msortbu x) y)))))
(assert-claim
  (forall ((x list))
    (= (count (lmerge (mergingbu x) (mergingbu x)) x)
      (count (map5 lam79 (mergingbu x)) x))))
(assert-claim
  (forall ((x fun16) (y list))
    (= (count (map4 x y) (pairwise (pairwise y)))
      (count (map4 x y) (pairwise y)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (leq x (count2 zero (cons2 x y))) (leq x (count2 zero y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (succ (succ x)) (plus y x)) (leq (succ (succ zero)) y))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (count2 x (cons2 y nil2)) x)
      (leq (succ zero) (plus x y)))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (plus y x) (succ (succ x))) (leq y (succ (succ zero))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (lmerge (cons2 (count x y) nil2) x)
      (lmerge x (cons2 (count x y) nil2)))))
(assert-claim
  (forall ((y fun14) (z fun12) (x2 list2))
    (= (msortbu (map7 y (map6 z (msortbu x2))))
      (msortbu (map7 y (map6 z x2))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count nil2 (cons (cons2 zero x) y))
      (count nil2 (map3 lam80 y)))))
(assert-claim
  (forall ((x Nat))
    (= (leq (succ (succ zero)) (plus x x)) (leq (succ zero) x))))
(assert-claim
  (forall ((x Nat) (y Nat))
    (= (leq (count2 x (cons2 zero nil2)) y)
      (leq (succ zero) (plus x y)))))
(assert-claim
  (forall ((x Nat))
    (= (leq (plus x x) (succ (succ zero))) (leq x (succ zero)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (leq (plus x (count2 x y)) zero)
      (leq (plus x (count2 zero y)) zero))))
(assert-claim
  (forall ((x fun16) (y list))
    (= (msortbu (map4 x (pairwise (pairwise (pairwise y)))))
      (map4 x (pairwise (pairwise (pairwise y)))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (cons x (pairwise (pairwise (pairwise y)))))
      (cons (lmerge x (mergingbu y)) nil))))
(assert-claim
  (forall ((x fun17) (y list))
    (= (pairwise (map3 x (pairwise (pairwise (pairwise y)))))
      (map3 x (pairwise (pairwise (pairwise y)))))))
(assert-claim
  (forall ((x list2) (y list))
    (= (pairwise (pairwise (cons x (pairwise (pairwise y)))))
      (cons (lmerge x (mergingbu y)) nil))))
(assert-claim
  (forall ((x fun17) (y list))
    (= (pairwise (pairwise (map3 x (pairwise (pairwise y)))))
      (pairwise (map3 x (pairwise (pairwise y)))))))
(assert-claim
  (forall ((x fun17) (y list))
    (= (pairwise (pairwise (pairwise (map3 x (pairwise y)))))
      (pairwise (pairwise (map3 x (pairwise y)))))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (count2 (succ x) (map5 (lam81 x) y)) (count2 (succ zero) y))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count x (cons (map5 lam82 x) y))
      (count x (cons (lmerge x x) y)))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (count x (map3 (lam83 y) z)) (count x (map3 (lam84 y) z)))))
(assert-claim
  (forall ((x Nat) (y list2) (z list))
    (= (count (cons2 x (map5 lam85 y)) z)
      (count (cons2 x (lmerge y y)) z))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count (map5 lam86 (lmerge x x)) y)
      (count nil2 (map3 (lam87 x) y)))))
(assert-claim
  (forall ((x fun1) (y list2) (z list))
    (= (count (map5 lam88 (lmerge y y)) z)
      (count (lmerge y (map5 x y)) z))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count (mergingbu (map3 (lam89 x) y)) y)
      (count (lmerge x (mergingbu y)) y))))
(assert-claim
  (forall ((x list2) (y Nat))
    (= (count2 zero (cons2 y (map5 lam90 x)))
      (count2 y (cons2 zero nil2)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (count nil2 (cons (map5 lam91 x) y))
      (count nil2 (cons (msortbu x) y)))))
(assert-claim
  (forall ((x Nat) (y list2))
    (= (cons2 (succ x) (map5 (lam92 x) y))
      (map5 (lam93 x) (cons2 (succ zero) y)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (msortbu (mergingbu (map3 (lam94 x) y)))
      (msortbu (mergingbu (map3 (lam95 x) y))))))
(assert-claim
  (forall ((x list))
    (= (count nil2 (pairwise (map3 lam96 x))) zero)))
(assert-claim
  (forall ((x Nat) (y Nat) (z list2))
    (= (map5 (lam97 x) (map5 (lam98 y) z)) (map5 (lam99 x y) z))))
(assert-claim
  (forall ((x list2) (y list2) (z list))
    (= (map3 (lam100 x) (map3 (lam101 y) z)) (map3 (lam102 x y) z))))
(assert-claim
  (forall ((x list) (y list2))
    (= (apply16 (lam104 x) y) (apply16 lam105 y))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (count nil2 (map3 (lam107 x) y)) (count nil2 (map3 lam108 y)))))
(assert-claim
  (forall ((x list))
    (= (count (mergingbu x) (map3 lam110 x))
      (count (map5 lam111 (mergingbu x)) x))))
(assert-claim
  (forall ((x list2) (y list2))
    (= (lmerge (map5 lam112 x) (map5 lam113 y))
      (map5 lam114 (lmerge x y)))))
(assert-claim
  (forall ((x list2) (y list))
    (= (map3 (lam115 x) (map3 lam116 y))
      (map3 lam117 (map3 (lam118 x) y)))))
(assert-claim
  (forall ((x list))
    (= (map4 lam119 (map3 lam120 x)) (map5 lam121 (map4 lam122 x)))))
(assert-claim
  (forall ((x Nat) (y list))
    (= (map3 lam123 (map3 (lam125 x) y))
      (map3 (lam127 x) (map3 lam128 y)))))
(assert-claim
  (forall ((x list))
    (= (map3 lam130 (map3 lam132 x)) (map3 lam134 x))))
