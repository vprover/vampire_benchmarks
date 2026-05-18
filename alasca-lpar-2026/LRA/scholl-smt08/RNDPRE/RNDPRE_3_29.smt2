(set-info :smt-lib-version 2.6)
(set-logic LRA)
(set-info :source |
   Scholl, Christoph; Disch, Stefan; Pigorsch, Florian and Kupferschmid, 
   Stefan; Using an SMT Solver and Craig Interpolation to Detect and Remove 
   Redundant Linear Constraints in Representations of Non-Convex Polyhedra.
   Proceedings of 6th International Workshop on Satisfiability Modulo
   Theories, Princeton, USA, July 2008.
   <http://abs.informatik.uni-freiburg.de/smtbench/>
|)
(set-info :category "random")
(set-info :status sat)
(declare-fun x1 () Real)
(declare-fun x2 () Real)
(declare-fun x3 () Real)
(assert (exists ((?x1 Real)) (forall ((?x2 Real)) (exists ((?x3 Real)) (let ((?v_2 (* 28 ?x1)) (?v_4 (* 2 ?x1)) (?v_3 (* 85 ?x1)) (?v_0 (* (- 86) ?x3)) (?v_6 (* (- 29) ?x3)) (?v_5 (* (- 5) ?x1)) (?v_7 (* (- 60) ?x2)) (?v_1 (* (- 100) ?x3))) (and (and (or (or (or (>= (+ (+ (* (- 83) ?x1) (* 39 ?x2)) (* (- 95) ?x3)) (- 62)) (= (+ (* (- 93) ?x2) (* 62 ?x3)) 0)) (and (= (+ (* (- 19) ?x2) (* (- 67) ?x3)) (- 94)) (<= (+ (* 83 ?x2) (* (- 59) ?x3)) 44))) (or (or (or (not (= (* 56 ?x1) 93)) (<= (+ (+ ?v_2 (* 33 ?x2)) (* 20 ?x3)) 26)) (and (> (+ (+ (* 76 ?x1) (* (- 57) ?x2)) ?v_0) 0) (not (= (+ (* (- 41) ?x1) (* 91 ?x3)) (- 90))))) (and (or (not (= (+ (* (- 67) ?x1) (* 64 ?x2)) 3)) (> (+ (+ (* 84 ?x1) (* (- 54) ?x2)) ?v_6) 0)) (< (+ (* 58 ?x2) (* (- 41) ?x3)) 7)))) (or (or (or (< (+ (+ (* (- 92) ?x1) (* 2 ?x2)) (* 27 ?x3)) 4) (and (> (+ (+ (* 16 ?x1) (* 43 ?x2)) ?v_0) 0) (= (* 4 ?x3) 0))) (or (or (> (+ (+ (* (- 59) ?x1) (* 46 ?x2)) (* 38 ?x3)) 57) (<= (* 54 ?x2) (- 94))) (not (= (+ (+ (* 29 ?x1) (* (- 79) ?x2)) (* (- 70) ?x3)) 0)))) (or (and (< (+ (+ (* (- 76) ?x1) (* 19 ?x2)) (* 63 ?x3)) (- 2)) (and (< (+ ?v_4 (* (- 74) ?x2)) 0) (>= (+ (* 65 ?x1) (* 67 ?x2)) 22))) (and (= (+ (* (- 100) ?x2) (* (- 19) ?x3)) (- 12)) (or (>= (+ (* 75 ?x1) (* (- 12) ?x2)) 67) (>= (+ (+ ?v_5 (* (- 52) ?x2)) (* (- 90) ?x3)) 88)))))) (or (and (and (and (and (<= (+ (+ (* (- 77) ?x1) (* 23 ?x2)) (* (- 76) ?x3)) (- 91)) (not (= (+ (+ ?v_3 ?v_7) (* (- 32) ?x3)) (- 3)))) (and (<= ?v_1 98) (not (= (* (- 48) ?x2) 0)))) (and (or (= (+ (* 96 ?x1) (* (- 97) ?x3)) (- 58)) (= (+ (* (- 4) ?x1) (* 6 ?x3)) (- 19))) (or (not (= (* (- 94) ?x1) (- 15))) (<= (+ (+ (* (- 27) ?x1) (* (- 31) ?x2)) (* 95 ?x3)) 62)))) (or (and (and (not (= (+ (* 3 ?x1) ?v_1) (- 54))) (>= (+ (+ ?v_2 (* (- 68) ?x2)) (* (- 4) ?x3)) (- 11))) (or (>= (+ (* (- 11) ?x1) (* 34 ?x3)) (- 32)) (< (* 46 ?x1) 0))) (and (and (> (+ (* 69 ?x1) (* 76 ?x2)) 0) (= (+ ?v_3 (* (- 64) ?x3)) 71)) (and (<= (+ (* 77 ?x1) (* 72 ?x3)) 95) (< (+ (* 30 ?x1) (* (- 1) ?x2)) 0))))) (or (and (and (not (= (+ (+ ?v_4 (* 27 ?x2)) (* 31 ?x3)) 0)) (<= (+ ?v_5 (* (- 17) ?x3)) 0)) (and (<= (+ (+ (* 15 ?x1) (* (- 82) ?x2)) ?v_6) (- 78)) (> (+ (* 81 ?x1) (* (- 35) ?x2)) (- 13)))) (or (or (<= (+ (* 20 ?x1) (* 32 ?x3)) 36) (= (+ (+ (* 11 ?x1) ?v_7) (* (- 9) ?x3)) 96)) (and (< (+ (* 97 ?x2) (* 88 ?x3)) 61) (not (= (+ (* (- 67) ?x2) (* (- 34) ?x3)) 0))))))))))))
(check-sat)
(exit)
