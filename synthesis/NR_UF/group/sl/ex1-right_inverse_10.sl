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

(assume (forall ((x s)) (= (op (inv x) x) e)))
(assume (forall ((x s)) (= (op e x) x)))
(assume (forall ((x s) (y s) (z s)) (= (op x (op y z)) (op (op x y) z))))

(synth-fun fy ((inv (-> s s)) (op (-> s s s)) (e s) (x0 s) (x1 s) (x2 s) (x3 s) (x4 s) (x5 s) (x6 s) (x7 s) (x8 s) (x9 s)) s)

(constraint (= (op (op (op (op (op (op (op (op (op (op x0 x1) x2) x3) x4) x5) x6) x7) x8) x9) (fy inv op e x0 x1 x2 x3 x4 x5 x6 x7 x8 x9)) e))

(check-synth)
