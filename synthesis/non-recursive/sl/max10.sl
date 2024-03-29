(set-logic LIA)
(synth-fun max (
  (x0 Int)
  (x1 Int)
  (x2 Int)
  (x3 Int)
  (x4 Int)
  (x5 Int)
  (x6 Int)
  (x7 Int)
  (x8 Int)
  (x9 Int)
  ) Int)
(declare-var x0 Int)
(declare-var x1 Int)
(declare-var x2 Int)
(declare-var x3 Int)
(declare-var x4 Int)
(declare-var x5 Int)
(declare-var x6 Int)
(declare-var x7 Int)
(declare-var x8 Int)
(declare-var x9 Int)

(constraint
        (and
            (>= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x0)
            (>= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x1)
            (>= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x2)
            (>= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x3)
            (>= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x4)
            (>= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x5)
            (>= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x6)
            (>= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x7)
            (>= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x8)
            (>= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x9)
            (or
              (= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x0)
              (= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x1)
              (= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x2)
              (= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x3)
              (= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x4)
              (= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x5)
              (= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x6)
              (= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x7)
              (= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x8)
              (= (max x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) x9)
            )
))

(check-synth)
