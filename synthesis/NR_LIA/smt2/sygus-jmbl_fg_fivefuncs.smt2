;; From [SyGuS competition: https://github.com/SyGuS-Org/benchmarks/tree/7e52de6/comp/2019/CLIA_Track/from_2018]

(assert-synth ((x Int) (y Int)) ((f1 Int) (f2 Int) (f3 Int) (f4 Int) (f5 Int))
  (and
    (= (+ f1 f1) f2)
    (= (- (+ f1 f2) y) f3)
    (= (+ f2 f2) f4)
    (= (+ f4 f1) f5)
  )
)
