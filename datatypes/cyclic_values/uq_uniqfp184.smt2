(set-info :status unsat)
(declare-codatatypes ((T 0)) ((
  (f0)
  (f1 (proj0f1 T))
  (f2 (proj0f2 T) (proj1f2 T))
  (f3 (proj0f3 T) (proj1f3 T) (proj2f3 T)))))
(assert (exists ((y19602 T) (y19585 T) (y19603 T) (y19597 T) (y19606 T) (y19590 T) (y19605 T) (y19570 T) (y19593 T) (y19601 T) (y19592 T) (y19589 T) (y19599 T) (y19608 T) (y19573 T) (y19572 T) (y19571 T) (y19567 T) (y19577 T) (y19576 T) (y19575 T) (y19574 T) (y19586 T) (y19594 T) (y19579 T) (y19578 T) (y19591 T) (y19583 T) (y19580 T) (y19581 T) (y19595 T) (y19604 T) (y19596 T) (y19607 T) (y19584 T) (y19609 T) (y19588 T)) (forall ((x19615 T) (x19617 T) (x19616 T) (x19611 T) (x19610 T) (x19612 T) (x19619 T) (x19618 T)) 
  (or 
    (and (= y19567 (f1 x19616)) (= x19616 (f3 y19567 PLACEHOLDER PLACEHOLDER)) (= x19615 (f1 x19610)) (distinct y19567 x19615)) 
    (and (= y19570 (f1 y19572)) (= y19572 (f1 y19573)) (= y19573 (f1 y19570)) (= y19571 (f1 (f1 (f1 y19571)))) (distinct y19570 y19571)) 
    (and (= y19574 (f3 (f1 (f3 (f2 y19574 PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER))) y19576 PLACEHOLDER)) (= y19576 (f2 y19577 (f2 PLACEHOLDER PLACEHOLDER))) (= y19577 (f1 y19578)) (= y19578 (f2 y19574 PLACEHOLDER)) (= y19575 (f3 (f1 (f3 (f2 y19575 PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER) (f2 PLACEHOLDER PLACEHOLDER))) y19579 PLACEHOLDER)) (= y19579 (f2 y19580 (f2 PLACEHOLDER PLACEHOLDER))) (= y19580 (f1 y19581)) (= y19581 (f2 y19575 PLACEHOLDER)) (distinct y19574 y19575)) 
    (and (= x19612 (f1 (f1 y19584))) (= y19584 (f3 y19585 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y19585 (f1 y19586)) (= y19586 (f1 x19612)) (= y19583 (f1 x19618)) (= x19618 (f1 y19588)) (= y19588 (f3 y19589 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER) PLACEHOLDER)) (= y19589 (f1 y19590)) (= y19590 (f1 y19583)) (distinct x19612 y19583)) 
    (and (= y19591 (f2 y19593 PLACEHOLDER)) (= y19593 (f2 y19594 (f2 PLACEHOLDER PLACEHOLDER))) (= y19594 (f2 y19595 (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER))) (= y19595 (f2 y19596 PLACEHOLDER)) (= y19596 (f2 y19591 PLACEHOLDER)) (= y19592 (f2 (f2 (f2 (f2 y19597 PLACEHOLDER) (f3 PLACEHOLDER PLACEHOLDER PLACEHOLDER)) (f2 PLACEHOLDER PLACEHOLDER)) PLACEHOLDER)) (= y19597 (f2 y19592 PLACEHOLDER)) (distinct y19591 y19592)) 
    (and (= x19617 (f1 x19611)) (= x19611 (f1 y19601)) (= y19601 (f1 y19602)) (= y19602 (f3 x19617 PLACEHOLDER PLACEHOLDER)) (= y19599 (f1 y19603)) (= y19603 (f1 y19604)) (= y19604 (f1 y19605)) (= y19605 (f3 y19599 PLACEHOLDER PLACEHOLDER)) (distinct x19617 y19599)) 
    (and (= y19606 x19619) (= y19607 (f1 y19607)) (distinct y19606 y19607)) 
    (and (= y19608 (f2 y19608 PLACEHOLDER)) (= y19609 (f2 y19609 PLACEHOLDER)) (distinct y19608 y19609))))))
(check-sat)
