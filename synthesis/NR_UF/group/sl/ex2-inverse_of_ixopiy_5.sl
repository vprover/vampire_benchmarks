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

(assume (forall ((x s)) (= (op (inv x) x) e)))
(assume (forall ((x s)) (= (op e x) x)))
(assume (forall ((x s) (y s) (z s)) (= (op x (op y z)) (op (op x y) z))))

(synth-fun fz ((op (-> s s s)) (e s) (x0 s) (x1 s) (x2 s) (x3 s) (x4 s)) s)

(constraint (= (op (fz op e x0 x1 x2 x3 x4) (op (op (op (op (inv x0) (inv x1)) (inv x2)) (inv x3)) (inv x4))) e))

(check-synth)
