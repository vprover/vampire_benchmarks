(set-info :status unsat)
(declare-datatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T) (proj1f1 T) (proj2f1 T) (proj3f1 T))
  (f2 (proj0f2 T) (proj1f2 T) (proj2f2 T) (proj3f2 T)))))
(assert (exists ((y9173 T) (y9172 T) (y9170 T) (y9168 T) (y9176 T) (y9175 T) (y9174 T) (y9164 T) (y9165 T) (y9166 T) (y9167 T) (y9163 T) (y9190 T) (y9192 T) (y9193 T) (y9182 T) (y9183 T) (y9180 T) (y9181 T) (y9186 T) (y9184 T) (y9185 T) (y9188 T) (y9189 T) (y9169 T)) (forall ((x9198 T) (x9199 T) (x9194 T) (x9200 T) (x9201 T) (x9202 T) (x9195 T) (x9196 T) (x9203 T)) 
  (or 
    (and (= y9163 (f1 y9164 x9194 (f1 (f2 (f1 x9194 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194) x9194 x9194) (f2 x9194 x9194 x9194 x9194) (f1 (f1 x9194 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194) x9194) (f2 x9194 x9194 x9194 x9194)) (f1 x9194 x9194 x9194 x9194))) (= y9164 (f2 y9165 (f2 x9194 x9194 (f1 x9194 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194)) (f2 (f2 x9194 x9194 x9194 x9194) x9194 (f2 x9194 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194)) x9194)) (= y9165 (f1 y9166 x9194 (f2 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194))) (= y9166 (f1 y9163 x9194 x9194 x9194))) 
    (and (= y9167 (f2 y9167 x9194 (f1 (f1 (f2 y9167 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194) x9194 x9194) x9194 y9168 x9194) x9194)) (= y9168 (f2 y9169 x9194 x9194 (f2 (f1 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194) x9194 (f1 x9194 x9194 x9194 x9194)))) (= y9169 (f2 y9170 (f1 x9194 x9194 x9194 x9194) x9194 (f2 x9194 x9194 x9194 x9194))) (= y9170 (f2 y9167 x9194 x9194 x9194))) (= x9195 (f1 (f2 (f1 (f1 x9195 (f2 x9195 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194) x9194) (f2 x9194 x9194 x9194 x9194) x9194 (f2 x9194 x9194 x9194 x9194)) (f1 (f1 x9194 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194) x9194) (f2 x9194 x9194 x9194 x9194) x9194) (f1 (f1 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194) x9194) (f2 x9194 (f2 (f1 x9194 (f1 x9194 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194)) (f1 x9194 (f2 x9194 x9194 x9194 x9194) x9194 x9194) (f2 (f2 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194) x9194 (f2 x9194 x9194 x9194 x9194)) (f1 x9194 x9194 (f1 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194))) (f2 x9194 x9194 x9194 x9194) (f1 (f2 x9194 x9194 x9194 x9194) x9194 (f1 (f2 x9194 x9194 x9194 x9194) x9194 (f2 x9194 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194)) (f2 (f1 x9194 x9194 x9194 x9194) x9194 (f2 x9194 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194)))) (f1 (f1 x9194 x9194 x9194 x9194) x9194 x9194 (f1 x9194 x9194 x9194 x9194)))) (= y9172 (f1 y9172 x9194 x9194 x9194)) 
    (and (= y9173 (f2 y9174 (f1 x9194 (f1 x9194 x9194 x9194 x9194) x9194 (f2 x9194 x9194 x9194 x9194)) (f1 x9194 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194))) (= y9174 x9203) (= y9175 (f2 y9173 x9194 x9194 x9194))) 
    (and (= y9176 (f1 (f2 (f1 (f2 (f1 y9176 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194) x9194) x9194 (f2 x9194 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194)) (f1 (f1 (f2 y9176 x9194 x9194 x9194) x9194 (f1 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194)) x9194 x9194 (f2 x9194 (f2 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194) x9194)) x9196 x9194) x9194 (f2 x9194 x9194 x9194 x9194) (f2 x9194 (f1 x9194 x9194 x9194 x9194) (f2 (f2 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194) x9194 (f2 x9194 x9194 x9194 x9194)) (f2 (f2 x9194 x9194 x9194 x9194) x9194 x9194 x9194)))) (= x9196 (f1 x9199 (f1 x9194 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194) (f2 x9194 (f2 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194)))) (= x9199 (f1 x9198 (f1 x9194 x9194 x9194 x9194) x9194 x9194)) (= x9198 (f1 y9176 x9194 x9194 x9194))) 
    (and (= y9180 (f1 (f2 y9181 (f2 x9194 x9194 x9194 x9194) (f1 x9194 (f2 x9194 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194) x9194) (f2 x9194 x9194 x9194 x9194)) (f2 (f2 x9194 (f2 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194)) (f1 (f2 (f1 x9194 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194) x9194 (f2 x9194 x9194 x9194 x9194)) x9194 (f2 x9194 x9194 (f1 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194)) (f2 x9194 (f2 x9194 x9194 x9194 x9194) x9194 (f2 x9194 x9194 x9194 x9194))) x9194 (f2 x9194 x9194 (f1 x9194 x9194 (f1 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194)) x9194)) x9194 (f2 (f2 x9194 (f2 x9194 x9194 x9194 x9194) x9194 (f1 x9194 x9194 x9194 x9194)) x9194 x9194 (f2 x9194 x9194 (f2 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194))))) (= y9181 (f1 y9182 y9180 x9194 (f1 x9194 x9194 (f2 x9194 x9194 x9194 x9194) x9194))) (= y9182 (f2 y9183 (f2 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194))) (= y9183 x9202)) 
    (and (= y9184 (f2 y9185 x9194 (f2 x9194 (f2 x9194 x9194 x9194 x9194) x9194 (f2 x9194 x9194 x9194 x9194)) (f1 x9194 x9194 x9194 x9194))) (= y9185 (f2 y9186 x9194 x9194 (f1 x9194 x9194 x9194 x9194))) (= y9186 (f2 y9184 x9194 x9194 x9194))) 
    (and (= x9200 (f1 y9188 x9194 (f1 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194))) (= y9188 (f2 (f1 (f1 x9200 x9194 x9194 x9194) x9194 (f1 x9194 x9194 x9194 x9194) x9194) (f2 (f2 x9194 x9194 x9194 x9194) x9194 (f2 x9194 x9194 x9194 x9194) (f1 x9194 x9194 x9194 x9194)) y9189 (f2 (f2 x9194 x9194 x9194 x9194) x9194 (f1 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194)))) (= y9189 (f2 y9190 x9194 x9194 (f2 x9194 x9194 x9194 x9194))) (= y9190 (f1 x9200 x9194 x9194 x9194))) 
    (and (= x9201 (f1 y9192 (f1 x9194 x9194 x9194 x9194) (f2 (f1 x9194 x9194 x9194 x9194) (f2 x9194 x9194 x9194 x9194) x9194 (f2 x9194 x9194 x9194 x9194)) x9194)) (= y9192 (f1 y9193 (f2 x9194 x9194 x9194 x9194) x9194 x9194)) (= y9193 (f2 x9201 x9194 x9194 x9194)))))))
(check-sat)