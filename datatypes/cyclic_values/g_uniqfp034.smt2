(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T)))))
(assert (exists ((y3683 T) (y3682 T) (y3687 T) (y3686 T) (y3685 T) (y3684 T)) 
    (and (= y3682 (f1 y3684 PLACEHOLDER (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (= y3684 (f1 y3685 PLACEHOLDER PLACEHOLDER)) (= y3685 (f1 y3682 PLACEHOLDER PLACEHOLDER)) (= y3683 (f1 y3686 PLACEHOLDER (f1 PLACEHOLDER (f1 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER))) (= y3686 (f1 y3687 PLACEHOLDER PLACEHOLDER)) (= y3687 (f1 y3683 PLACEHOLDER PLACEHOLDER)) (distinct y3682 y3683))))
(check-sat)