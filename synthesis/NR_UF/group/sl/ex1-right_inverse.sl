(set-logic HO_UF)
(set-feature :recursion true)

(declare-sort s 0)

(declare-var inv (-> s s))
(declare-var op (-> s s s))
(declare-var e s)
(declare-var x s)

(assume (forall ((x s)) (= (op (inv x) x) e)))
(assume (forall ((x s)) (= (op e x) x)))
(assume (forall ((x s) (y s) (z s)) (= (op x (op y z)) (op (op x y) z))))

(synth-fun fy ((inv (-> s s)) (op (-> s s s)) (e s) (x s)) s)

(constraint (= (op x (fy inv op e x)) e))

(check-synth)
