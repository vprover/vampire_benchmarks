(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T))
  (f4 (proj0f4 T) (proj1f4 T) (proj2f4 T)))))
(assert (exists ((y7103 T) (y7144 T) (y7131 T) (y7130 T) (y7133 T) (y7132 T) (y7135 T) (y7134 T) (y7119 T) (y7136 T) (y7117 T) (y7138 T) (y7115 T) (y7114 T) (y7112 T) (y7111 T) (y7137 T) (y7108 T) (y7099 T) (y7145 T) (y7121 T) (y7124 T) (y7141 T) (y7122 T) (y7123 T) (y7120 T) (y7109 T) (y7126 T) (y7127 T) (y7142 T) (y7143 T) (y7100 T) (y7101 T) (y7128 T) (y7129 T) (y7104 T) (y7105 T) (y7106 T) (y7139 T) (y7125 T) (y7116 T) (y7102 T)) (forall ((x7156 T) (x7154 T) (x7155 T) (x7152 T) (x7153 T) (x7150 T) (x7151 T) (x7149 T)) 
  (or 
    (and (= x7149 (f3 y7100 (f3 x7152 x7152 x7152) (f1 (f1 x7152 x7152) (f2 x7152 x7152)))) (= y7100 (f4 y7101 (f1 x7152 x7152) (f1 x7152 x7152))) (= y7101 (f2 y7102 x7152)) (= y7102 (f1 x7149 x7152)) (= y7099 (f3 y7103 (f3 x7152 x7152 x7152) (f1 (f1 x7152 x7152) (f2 x7152 x7152)))) (= y7103 (f4 y7104 (f1 x7152 x7152) (f1 x7152 x7152))) (= y7104 (f2 y7105 x7152)) (= y7105 (f1 y7099 x7152)) (distinct x7149 y7099)) 
    (and (= y7106 (f2 y7108 x7152)) (= y7108 (f1 y7106 x7152)) (= x7150 (f2 y7109 x7152)) (= y7109 (f1 x7150 x7152)) (distinct y7106 x7150)) 
    (and (= x7151 (f1 y7112 x7152)) (= y7112 (f1 x7151 x7152)) (= y7111 (f1 x7155 x7152)) (= x7155 (f1 y7111 x7152)) (distinct x7151 y7111)) 
    (and (= y7114 (f2 y7116 (f4 (f2 x7152 x7152) (f2 x7152 x7152) (f3 x7152 x7152 x7152)))) (= y7116 (f1 y7117 x7152)) (= y7117 (f2 y7114 x7152)) (= y7115 (f2 (f1 (f2 y7115 x7152) x7152) (f4 (f2 x7152 x7152) (f2 x7152 x7152) (f3 x7152 x7152 x7152)))) (distinct y7114 y7115)) 
    (and (= x7154 (f4 (f2 y7120 (f4 x7152 x7152 x7152)) (f4 x7154 x7152 x7152) x7152)) (= y7120 (f2 x7154 x7152)) (= y7119 (f4 y7121 (f4 y7119 x7152 x7152) x7152)) (= y7121 (f2 y7122 (f4 x7152 x7152 x7152))) (= y7122 (f2 y7119 x7152)) (distinct x7154 y7119)) 
    (and (= y7123 (f3 y7125 x7152 (f4 x7152 x7152 x7152))) (= y7125 (f1 y7123 x7152)) (= y7124 (f3 y7126 x7152 (f4 x7152 x7152 x7152))) (= y7126 (f1 y7124 x7152)) (distinct y7123 y7124)) 
    (and (= y7127 (f2 (f3 (f4 y7127 x7152 x7152) (f3 x7152 x7152 x7152) (f1 x7152 x7152)) x7152)) (= y7128 (f2 (f3 (f4 y7128 x7152 x7152) (f3 x7152 x7152 x7152) (f1 x7152 x7152)) x7152)) (distinct y7127 y7128)) 
    (and (= y7129 (f2 (f1 (f4 (f4 y7131 (f2 x7152 x7152) (f1 x7152 x7152)) x7152 (f3 (f1 x7152 x7152) x7152 (f1 x7152 x7152))) (f2 (f4 x7152 x7152 x7152) (f4 x7152 x7152 x7152))) (f4 (f4 x7152 x7152 x7152) (f4 (f1 x7152 x7152) x7152 x7152) x7152))) (= y7131 (f3 y7129 x7152 x7152)) (= y7130 (f2 y7132 (f4 (f4 x7152 x7152 x7152) (f4 (f1 x7152 x7152) x7152 x7152) x7152))) (= y7132 (f1 y7133 (f2 (f4 x7152 x7152 x7152) (f4 x7152 x7152 x7152)))) (= y7133 (f4 y7134 x7152 (f3 (f1 x7152 x7152) x7152 (f1 x7152 x7152)))) (= y7134 (f4 y7135 (f2 x7152 x7152) (f1 x7152 x7152))) (= y7135 (f3 y7130 x7152 x7152)) (distinct y7129 y7130)) 
    (and (= y7136 (f1 y7138 (f4 (f3 (f1 x7152 x7152) (f2 x7152 x7152) (f1 x7152 x7152)) (f1 (f3 x7152 x7152 x7152) (f3 x7152 x7152 x7152)) (f3 x7152 (f3 x7152 x7152 x7152) (f4 x7152 x7152 x7152))))) (= y7138 (f2 y7139 (f4 (f3 x7152 x7152 x7152) (f2 x7152 x7152) (f4 x7152 x7152 x7152)))) (= y7139 (f2 x7153 (f2 x7152 x7152))) (= x7153 (f1 y7136 x7152)) (= y7137 (f1 (f2 y7141 (f4 (f3 x7152 x7152 x7152) (f2 x7152 x7152) (f4 x7152 x7152 x7152))) (f4 (f3 (f1 x7152 x7152) (f2 x7152 x7152) (f1 x7152 x7152)) (f1 (f3 x7152 x7152 x7152) (f3 x7152 x7152 x7152)) (f3 x7152 (f3 x7152 x7152 x7152) (f4 x7152 x7152 x7152))))) (= y7141 (f2 y7142 (f2 x7152 x7152))) (= y7142 (f1 y7137 x7152)) (distinct y7136 y7137)) 
    (and (= y7143 (f1 y7145 (f4 x7152 x7152 x7152))) (= y7145 (f2 y7143 x7152)) (= y7144 (f1 x7156 (f4 x7152 x7152 x7152))) (= x7156 (f2 y7144 x7152)) (distinct y7143 y7144))))))
(check-sat)
