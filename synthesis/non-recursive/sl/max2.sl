(set-logic LIA)
(synth-fun max ((x1 Int) (x2 Int)) Int)
(declare-var x1 Int)
(declare-var x2 Int)

(constraint
        (and
            (>= (max x1 x2) x1)
            (>= (max x1 x2) x2)
            (or (= (max x1 x2) x1) (= (max x1 x2) x2))
))

(check-synth)
