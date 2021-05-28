;int main() {
;  int* a = malloc(sizeof(int));
;  int* b = malloc(sizeof(int));
;  *b = 3;
;  *a = 5;
;}

(set-logic UFDTLIA)

(declare-nat Nat zero s p Sub)
(declare-sort Time 0)
(declare-sort Trace 0)
(declare-sort Loc 0)
(declare-const a Loc)
(declare-const b Loc)
(declare-const l0 Time)
(declare-const l1 Time)
(declare-const l2 Time)
(declare-const l3 Time)
(declare-const l4 Time)
(declare-const junk Loc)
(declare-fun deref (Loc Time) Loc)
(declare-fun val (Loc Time) Int)
(declare-const main_end Time)
(declare-const t1 Trace)
(declare-const tp Time)

; Axiom: Semantics of function main
(assert
   (and
      ;memory is empty 
      (forall ((l Loc)) 
        (= (deref l l0) junk)
      )
      (= (val (deref a l1) l1) 1)
      (= (val (deref b l2) l2) 1)

      (= (val (deref b l3) l3) 3)
      (= (val (deref a l3) l3) (val (deref a l1) l1))      
      (= (deref a l3) (deref a l1))
      (= (deref b l3) (deref b l2))

      (= (val (deref a l4) l4) 5)
      (= (val (deref b l4) l4) (val (deref b l3) l3))
      (= (deref a l4) (deref a l3))
      (= (deref b l4) (deref b l3))

      (= (val (deref a main_end) main_end) (val (deref a l4) l4))
      (= (val (deref b main_end) main_end) (val (deref b l4) l4))
      (= (deref a main_end) (deref a l4))
      (= (deref b main_end) (deref b l4))
   )
)

; Conjecture: user-conjecture-0
(assert-not
   (=
     (val (deref b main_end) main_end) 3
   )
)

(check-sat)

