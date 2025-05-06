;; From [SyGuS competition: https://github.com/SyGuS-Org/benchmarks/tree/7e52de6/comp/2019/CLIA_Track/from_2018]

(assert-synth ((x1 Int) (x2 Int)) ((y Int))
  (and
    (=> (> (+ x1 x2) 5) (= y (+ x1 x2)))
    (=> (<= (+ x1 x2) 5) (= y 0))
  )
)
