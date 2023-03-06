(set-logic LIA)
(synth-fun max (
  (x0 Int)
  (x1 Int)
  (x2 Int)
  (x3 Int)
  (x4 Int)
  ) Int)
(declare-var x0 Int)
(declare-var x1 Int)
(declare-var x2 Int)
(declare-var x3 Int)
(declare-var x4 Int)

(constraint
        (and
            (>= (max x0 x1 x2 x3 x4) x0)
            (>= (max x0 x1 x2 x3 x4) x1)
            (>= (max x0 x1 x2 x3 x4) x2)
            (>= (max x0 x1 x2 x3 x4) x3)
            (>= (max x0 x1 x2 x3 x4) x4)
            (or
              (= (max x0 x1 x2 x3 x4) x0)
              (= (max x0 x1 x2 x3 x4) x1)
              (= (max x0 x1 x2 x3 x4) x2)
              (= (max x0 x1 x2 x3 x4) x3)
              (= (max x0 x1 x2 x3 x4) x4)
            )
))

(check-synth)
