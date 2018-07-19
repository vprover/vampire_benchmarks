(reset)
(set-option :print-success false)
(set-info :smt-lib-version 2.0)
(set-info :status unsat)
(set-option :AUTO_CONFIG false)
(set-option :pp.bv_literals false)
(set-option :MODEL.V2 true)
(set-option :smt.PHASE_SELECTION 0)
(set-option :smt.RESTART_STRATEGY 0)
(set-option :smt.RESTART_FACTOR |1.5|)
(set-option :smt.ARITH.RANDOM_INITIAL_VALUE true)
(set-option :smt.CASE_SPLIT 3)
(set-option :smt.DELAY_UNITS true)
(set-option :NNF.SK_HACK true)
(set-option :smt.MBQI false)
(set-option :smt.QI.EAGER_THRESHOLD 100)
(set-option :TYPE_CHECK true)
(set-option :smt.BV.REFLECT true)
; done setting options


(declare-fun tickleBool (Bool) Bool)
(assert (and (tickleBool true) (tickleBool false)))
(declare-fun %lbl%+464 () Bool)
(declare-fun sortedFrom@1 () Int)
(declare-fun sortedFrom@0 () Int)
(declare-fun %lbl%@1882 () Bool)
(declare-fun bad@1 () Bool)
(declare-fun sortedUntil () Int)
(declare-fun n () Int)
(declare-fun %lbl%@1899 () Bool)
(declare-fun %lbl%@1920 () Bool)
(declare-fun a@5 () (Array Int Int))
(declare-fun %lbl%@1976 () Bool)
(declare-fun %lbl%@2021 () Bool)
(declare-fun %lbl%+462 () Bool)
(declare-fun a@2 () (Array Int Int))
(declare-fun %lbl%+460 () Bool)
(declare-fun t@1 () Int)
(declare-fun a@3 () (Array Int Int))
(declare-fun a@4 () (Array Int Int))
(declare-fun %lbl%+451 () Bool)
(declare-fun bad@0 () Bool)
(declare-fun %lbl%+449 () Bool)
(declare-fun %lbl%+447 () Bool)
(declare-fun sortedFrom () Int)
(declare-fun %lbl%+441 () Bool)
(declare-fun a () (Array Int Int))
(declare-fun %lbl%+439 () Bool)
(declare-fun t@0 () Int)
(declare-fun a@0 () (Array Int Int))
(declare-fun a@1 () (Array Int Int))
(declare-fun %lbl%+430 () Bool)
(declare-fun bad () Bool)
(declare-fun %lbl%+428 () Bool)
(declare-fun %lbl%+822 () Bool)
(push 1)
(set-info :boogie-vc-id main)
(assert (not
(let ((anon8_correct  (=> (! (and %lbl%+464 true) :lblpos +464) (=> (= sortedFrom@1 (- sortedFrom@0 1)) (and (! (or %lbl%@1882  (or bad@1 (and (< 0 sortedUntil) (<= sortedUntil n)))) :lblneg @1882) (=> (or bad@1 (and (< 0 sortedUntil) (<= sortedUntil n))) (and (! (or %lbl%@1899  (or bad@1 (and (<= (- 0 1) sortedFrom@1) (<= sortedFrom@1 (- sortedUntil 1))))) :lblneg @1899) (=> (or bad@1 (and (<= (- 0 1) sortedFrom@1) (<= sortedFrom@1 (- sortedUntil 1)))) (and (! (or %lbl%@1920  (or bad@1 (forall ((k Int) (m Int) ) (!  (=> (and (and (and (<= 0 k) (< k (+ sortedFrom@1 1))) (< (+ sortedFrom@1 1) m)) (<= m sortedUntil)) (<= (select a@5 k) (select a@5 m)))
 :qid |insertio.27:26|
 :skolemid |5|
)))) :lblneg @1920) (=> (or bad@1 (forall ((k@@0 Int) (m@@0 Int) ) (!  (=> (and (and (and (<= 0 k@@0) (< k@@0 (+ sortedFrom@1 1))) (< (+ sortedFrom@1 1) m@@0)) (<= m@@0 sortedUntil)) (<= (select a@5 k@@0) (select a@5 m@@0)))
 :qid |insertio.27:26|
 :skolemid |5|
))) (and (! (or %lbl%@1976  (or bad@1 (forall ((k@@1 Int) (m@@1 Int) ) (!  (=> (and (and (<= 0 k@@1) (< k@@1 m@@1)) (< m@@1 (+ sortedFrom@1 1))) (<= (select a@5 k@@1) (select a@5 m@@1)))
 :qid |insertio.28:26|
 :skolemid |6|
)))) :lblneg @1976) (=> (or bad@1 (forall ((k@@2 Int) (m@@2 Int) ) (!  (=> (and (and (<= 0 k@@2) (< k@@2 m@@2)) (< m@@2 (+ sortedFrom@1 1))) (<= (select a@5 k@@2) (select a@5 m@@2)))
 :qid |insertio.28:26|
 :skolemid |6|
))) (! (or %lbl%@2021  (or bad@1 (forall ((k@@3 Int) (m@@3 Int) ) (!  (=> (and (and (<= (+ sortedFrom@1 1) k@@3) (< k@@3 m@@3)) (<= m@@3 sortedUntil)) (<= (select a@5 k@@3) (select a@5 m@@3)))
 :qid |insertio.29:26|
 :skolemid |7|
)))) :lblneg @2021)))))))))))))
(let ((anon12_Else_correct  (=> (! (and %lbl%+462 true) :lblpos +462) (=> (and (>= (select a@2 (+ sortedFrom@0 1)) (select a@2 sortedFrom@0)) (= a@5 a@2)) anon8_correct))))
(let ((anon12_Then_correct  (=> (! (and %lbl%+460 true) :lblpos +460) (=> (> (select a@2 sortedFrom@0) (select a@2 (+ sortedFrom@0 1))) (=> (and (and (= t@1 (select a@2 sortedFrom@0)) (= a@3 (store a@2 sortedFrom@0 (select a@2 (+ sortedFrom@0 1))))) (and (= a@4 (store a@3 (+ sortedFrom@0 1) t@1)) (= a@5 a@4))) anon8_correct)))))
(let ((anon11_Else_correct  (=> (! (and %lbl%+451 true) :lblpos +451) (=> (>= sortedFrom@0 0) (=> (and (=> bad@1 bad@0) (=> bad@0 bad@1)) (and anon12_Then_correct anon12_Else_correct))))))
(let ((anon11_Then_correct  (=> (! (and %lbl%+449 true) :lblpos +449) (=> (not (>= sortedFrom@0 0)) (=> (and (=> bad@1 true) (=> true bad@1)) (and anon12_Then_correct anon12_Else_correct))))))
(let ((anon4_correct  (=> (! (and %lbl%+447 true) :lblpos +447) (=> (= sortedFrom@0 (- sortedFrom 1)) (and anon11_Then_correct anon11_Else_correct)))))
(let ((anon10_Else_correct  (=> (! (and %lbl%+441 true) :lblpos +441) (=> (and (>= (select a (+ sortedFrom 1)) (select a sortedFrom)) (= a@2 a)) anon4_correct))))
(let ((anon10_Then_correct  (=> (! (and %lbl%+439 true) :lblpos +439) (=> (> (select a sortedFrom) (select a (+ sortedFrom 1))) (=> (and (and (= t@0 (select a sortedFrom)) (= a@0 (store a sortedFrom (select a (+ sortedFrom 1))))) (and (= a@1 (store a@0 (+ sortedFrom 1) t@0)) (= a@2 a@1))) anon4_correct)))))
(let ((anon9_Else_correct  (=> (! (and %lbl%+430 true) :lblpos +430) (=> (>= sortedFrom 0) (=> (and (=> bad@0 bad) (=> bad bad@0)) (and anon10_Then_correct anon10_Else_correct))))))
(let ((anon9_Then_correct  (=> (! (and %lbl%+428 true) :lblpos +428) (=> (not (>= sortedFrom 0)) (=> (and (=> bad@0 true) (=> true bad@0)) (and anon10_Then_correct anon10_Else_correct))))))
(let ((anon0_correct  (=> (! (and %lbl%+822 true) :lblpos +822) (=> (> n 0) (=> (and (< 0 sortedUntil) (<= sortedUntil n)) (=> (and (and (forall ((k@@4 Int) (m@@4 Int) ) (!  (=> (and (and (<= 0 k@@4) (< k@@4 m@@4)) (< m@@4 sortedUntil)) (<= (select a k@@4) (select a m@@4)))
 :qid |insertio.16:20|
 :skolemid |0|
)) (forall ((k@@5 Int) ) (!  (=> (and (<= 0 k@@5) (< k@@5 (- sortedUntil 1))) (<= (select a k@@5) (select a (- sortedUntil 1))))
 :qid |insertio.17:20|
 :skolemid |1|
))) (and (< 0 sortedUntil) (<= sortedUntil n))) (=> (and (and (and (<= (- 0 1) sortedFrom) (<= sortedFrom (- sortedUntil 1))) (forall ((k@@6 Int) (m@@5 Int) ) (!  (=> (and (and (and (<= 0 k@@6) (< k@@6 (+ sortedFrom 1))) (< (+ sortedFrom 1) m@@5)) (<= m@@5 sortedUntil)) (<= (select a k@@6) (select a m@@5)))
 :qid |insertio.21:20|
 :skolemid |2|
))) (and (forall ((k@@7 Int) (m@@6 Int) ) (!  (=> (and (and (<= 0 k@@7) (< k@@7 m@@6)) (< m@@6 (+ sortedFrom 1))) (<= (select a k@@7) (select a m@@6)))
 :qid |insertio.22:20|
 :skolemid |3|
)) (forall ((k@@8 Int) (m@@7 Int) ) (!  (=> (and (and (<= (+ sortedFrom 1) k@@8) (< k@@8 m@@7)) (<= m@@7 sortedUntil)) (<= (select a k@@8) (select a m@@7)))
 :qid |insertio.23:20|
 :skolemid |4|
)))) (and anon9_Then_correct anon9_Else_correct))))))))
anon0_correct)))))))))))
))
(get-info :name)
(check-sat)
(get-info :name)
(pop 1)
; Valid
