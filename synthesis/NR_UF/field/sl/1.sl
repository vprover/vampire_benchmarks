(set-logic HO_UF)
(set-feature :recursion true)

(declare-sort s 0)

(declare-var inv1 (-> s s))
(declare-var inv2 (-> s s))
(declare-var op1 (-> s s s))
(declare-var op2 (-> s s s))
(declare-var e1 s)
(declare-var e2 s)
(declare-var a s)
(declare-var b s)

(assume (forall ((x s)) (= (op1 (inv1 x) x) e1)))
(assume (forall ((x s)) (= (op1 x (inv1 x)) e1)))
(assume (forall ((x s)) (= (op1 e1 x) x)))
(assume (forall ((x s)) (= x (op1 e1 x))))
(assume (forall ((x s) (y s) (z s)) (= (op1 x (op1 y z)) (op1 (op1 x y) z))))
(assume (forall ((x s) (y s)) (= (op1 x y) (op1 y x))))
(assume (forall ((x s)) (=> (distinct x e1) (= (op2 (inv2 x) x) e2))))
(assume (forall ((x s)) (=> (distinct x e1) (= (op2 x (inv2 x)) e2))))
(assume (forall ((x s)) (=> (distinct x e1) (= (op2 e2 x) x))))
(assume (forall ((x s)) (=> (distinct x e1) (= x (op2 e2 x)))))
(assume (forall ((x s) (y s) (z s)) (=> (and (distinct x e1) (distinct y e1) (distinct z e1)) (= (op2 x (op2 y z)) (op2 (op2 x y) z)))))
(assume (forall ((x s) (y s)) (=> (and (distinct x e1) (distinct y e1)) (= (op2 x y) (op2 y x)))))
(assume (forall ((a s) (b s) (c s) (d s)) (= (op2 a (op1 b c)) (op1 (op2 a b) (op2 a c)))))
(assume (forall ((a s) (b s) (c s) (d s)) (= (op2 (op1 a b) c) (op1 (op2 a c) (op2 b c)))))

(synth-fun fz ((inv2 (-> s s)) (op1 (-> s s s)) (op2 (-> s s s)) (e1 s) (e2 s) (a s) (b s)) s)

(constraint (= (op2 (inv1 a) b) (inv1 (fz inv2 op1 op2 e1 e2 a b))))

(check-synth)
