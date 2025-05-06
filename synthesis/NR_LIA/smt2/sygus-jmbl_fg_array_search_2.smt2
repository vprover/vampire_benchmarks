;; From [SyGuS competition: https://github.com/SyGuS-Org/benchmarks/tree/7e52de6/comp/2019/CLIA_Track/from_2018]

(assert-synth ((x1 Int) (x2 Int) (k Int)) ((y Int))
  (and
    (=> (< x1 x2) (=> (< k x1) (= y 0)))
    (=> (< x1 x2) (=> (> k x2) (= y 2)))
    (=> (< x1 x2) (=> (and (> k x1) (< k x2)) (= y 1)))
  )
)
