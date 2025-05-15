(set-logic HO_UF)
(set-feature :recursion true)

(declare-sort s 0)

(declare-var inv (-> s s))
(declare-var op (-> s s s))
(declare-var e s)
(declare-var x s)
(declare-var y s)

(assume (forall ((x s)) (= (op (inv x) x) e)))
(assume (forall ((x s)) (= (op e x) x)))
(assume (forall ((x s) (y s) (z s)) (= (op x (op y z)) (op (op x y) z))))

(synth-fun fz ((inv (-> s s)) (op (-> s s s)) (e s) (x s) (y s)) s)

(constraint (=> (distinct (op x y) (op y x)) (distinct (op (fz inv op e x y) (fz inv op e x y)) e)))

(check-synth)
