(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T))
  (f3 (proj0f3 T) (proj1f3 T)))))
(assert (exists ((y16143 T) (y16142 T) (y16141 T) (y16140 T) (y16145 T) (y16144 T) (y16138 T) (y16139 T) (y16136 T) (y16137 T) (y16134 T) (y16135 T) (y16132 T) (y16133 T)) (forall ((x16151 T) (x16150 T) (x16157 T) (x16156 T) (x16155 T) (x16158 T)) 
  (or 
    (and (= y16132 (f1 y16133)) (= y16133 (f3 y16132 x16157))) 
    (and (= y16134 (f1 y16135)) (= y16135 (f1 y16136)) (= y16136 (f2 y16134 x16157 x16157 x16157))) (= y16137 (f2 (f2 (f2 (f3 (f2 y16137 x16157 x16157 x16157) (f3 x16157 x16157)) (f1 (f3 x16157 x16157)) x16157 (f1 (f3 x16157 x16157))) (f1 y16137) (f1 (f3 x16157 (f2 x16157 x16157 x16157 x16157))) (f2 x16157 x16157 (f2 x16157 (f3 x16157 x16157) x16157 x16157) (f2 x16157 x16157 x16157 x16157))) x16157 (f3 x16157 x16157) (f3 (f2 x16157 x16157 x16157 x16157) x16157))) 
    (and (= y16138 (f3 (f3 (f2 (f1 y16138) (f2 x16157 x16157 x16157 x16157) y16139 x16157) (f2 (f1 x16157) x16157 (f2 x16157 x16157 x16157 x16157) (f2 x16157 x16157 x16157 x16157))) x16157)) (= y16139 (f2 y16138 x16157 x16157 x16157))) 
    (and (= y16140 (f2 y16141 (f3 x16157 x16157) (f2 x16157 x16157 x16157 x16157) (f3 x16157 x16157))) (= y16141 (f3 y16140 x16157))) 
    (and (= y16142 (f2 y16143 (f3 (f1 (f2 x16157 x16157 x16157 x16157)) (f1 x16157)) x16157 (f2 (f2 x16157 x16157 x16157 x16157) (f1 (f2 x16157 x16157 x16157 x16157)) (f1 x16157) x16157))) (= y16143 x16156) (= y16144 (f2 (f1 y16142) y16145 y16142 (f1 x16157))) (= y16145 (f2 y16142 x16157 x16157 x16157))) (= x16150 (f3 x16150 x16157)) 
    (and (= x16151 x16155) (= x16158 (f3 x16151 x16157)))))))
(check-sat)
