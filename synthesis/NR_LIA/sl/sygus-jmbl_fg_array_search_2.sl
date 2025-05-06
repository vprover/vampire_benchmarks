;; From [SyGuS competition: https://github.com/SyGuS-Org/benchmarks/tree/7e52de6/comp/2019/CLIA_Track/from_2018]

(set-logic LIA)

(synth-fun findIdx ((y1 Int) (y2 Int) (k1 Int)) Int)

(declare-var x1 Int)
(declare-var x2 Int)
(declare-var k Int)
(constraint (=> (< x1 x2) (=> (< k x1) (= (findIdx x1 x2 k) 0))))
(constraint (=> (< x1 x2) (=> (> k x2) (= (findIdx x1 x2 k) 2))))
(constraint (=> (< x1 x2) (=> (and (> k x1) (< k x2)) (= (findIdx x1 x2 k) 1))))

(check-synth)

