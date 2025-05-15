(set-logic HO_UF)
(set-feature :recursion true)

(declare-sort s 0)

(declare-var inv (-> s s))
(declare-var op (-> s s s))
(declare-var e s)
(declare-var x0 s)
(declare-var x1 s)
(declare-var x2 s)
(declare-var x3 s)
(declare-var x4 s)
(declare-var x5 s)
(declare-var x6 s)
(declare-var x7 s)
(declare-var x8 s)
(declare-var x9 s)
(declare-var x10 s)
(declare-var x11 s)
(declare-var x12 s)
(declare-var x13 s)
(declare-var x14 s)

(assume (forall ((x s)) (= (op (inv x) x) e)))
(assume (forall ((x s)) (= (op e x) x)))
(assume (forall ((x s) (y s) (z s)) (= (op x (op y z)) (op (op x y) z))))

(synth-fun fz ((op (-> s s s)) (e s) (x0 s) (x1 s) (x2 s) (x3 s) (x4 s) (x5 s) (x6 s) (x7 s) (x8 s) (x9 s) (x10 s) (x11 s) (x12 s) (x13 s) (x14 s)) s)

(constraint (= (op (fz op e x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14) (op (op (op (op (op (op (op (op (op (op (op (op (op (op (inv x0) (inv x1)) (inv x2)) (inv x3)) (inv x4)) (inv x5)) (inv x6)) (inv x7)) (inv x8)) (inv x9)) (inv x10)) (inv x11)) (inv x12)) (inv x13)) (inv x14))) e))

(check-synth)
