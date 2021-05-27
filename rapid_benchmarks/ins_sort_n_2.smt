(set-logic ALIA)
(set-info :status unsat)
(declare-datatypes ((struct_type_pointer_struct 0)) (((struct_type_pointer_struct (pointer_object Int) (pointer_offset Int)))))
(declare-datatypes ((struct_type_addr_space_type 0)) (((struct_type_addr_space_type (start Int) (end Int)))))
(declare-fun __ESBMC_ptr_obj_start_0 () Int)
(declare-fun __ESBMC_ptr_obj_end_0 () Int)
(declare-fun __ESBMC_ptr_obj_start_1 () Int)
(declare-fun __ESBMC_ptr_obj_end_1 () Int)
(declare-fun __ESBMC_ptr_addr_range_0 () struct_type_addr_space_type)
(declare-fun __ESBMC_ptr_addr_range_1 () struct_type_addr_space_type)
(declare-fun __ESBMC_addrspace_arr_2 () (Array Int struct_type_addr_space_type))
(declare-fun __ESBMC_addrspace_arr_1 () (Array Int struct_type_addr_space_type))
(declare-fun __ESBMC_addrspace_arr_3 () (Array Int struct_type_addr_space_type))
(declare-fun |0| () struct_type_pointer_struct)
(declare-fun NULL () struct_type_pointer_struct)
(declare-fun INVALID () struct_type_pointer_struct)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#1| () (Array Int Int))
(declare-fun |nondet$symex::nondet0| () Int)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#0| () (Array Int Int))
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#2| () (Array Int Int))
(declare-fun |nondet$symex::nondet1| () Int)
(declare-fun |c:loop_example.c@72@F@main@pivot?1!0&0#1| () Int)
(declare-fun |goto_symex::guard?0!0&0#1| () Bool)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#3| () (Array Int Int))
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#4| () (Array Int Int))
(declare-fun |c:loop_example.c@53@F@main@i?1!0&0#6| () Int)
(declare-fun |c:loop_example.c@72@F@main@a?1!0&0#5| () (Array Int Int))
(declare-fun |execution_statet::\\guard_exec?0!0| () Bool)
(assert (= __ESBMC_ptr_obj_start_0 0))
(assert (= __ESBMC_ptr_obj_end_0 0))
(assert (= __ESBMC_ptr_obj_start_1 1))
(assert (= __ESBMC_ptr_obj_end_1 18446744073709551615))
(assert (= __ESBMC_ptr_addr_range_0
   (struct_type_addr_space_type __ESBMC_ptr_obj_start_0 __ESBMC_ptr_obj_end_0)))
(assert (= __ESBMC_ptr_addr_range_1
   (struct_type_addr_space_type __ESBMC_ptr_obj_start_1 __ESBMC_ptr_obj_end_1)))
(assert (= (store __ESBMC_addrspace_arr_1
          0
          (struct_type_addr_space_type
            __ESBMC_ptr_obj_start_0
            __ESBMC_ptr_obj_end_0))
   __ESBMC_addrspace_arr_2))
(assert (= (store __ESBMC_addrspace_arr_2
          1
          (struct_type_addr_space_type
            __ESBMC_ptr_obj_start_1
            __ESBMC_ptr_obj_end_1))
   __ESBMC_addrspace_arr_3))
(assert (= |0| (struct_type_pointer_struct 0 0)))
(assert (= NULL (struct_type_pointer_struct 0 0)))
(assert (= INVALID (struct_type_pointer_struct 1 0)))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#0| 0 |nondet$symex::nondet0|)
   |c:loop_example.c@72@F@main@a?1!0&0#1|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#1| 1 |nondet$symex::nondet1|)
   |c:loop_example.c@72@F@main@a?1!0&0#2|))
(assert (= (select |c:loop_example.c@72@F@main@a?1!0&0#2| 1)
   |c:loop_example.c@72@F@main@pivot?1!0&0#1|))
(assert (= (> (select |c:loop_example.c@72@F@main@a?1!0&0#2| 0)
      |c:loop_example.c@72@F@main@pivot?1!0&0#1|)
   |goto_symex::guard?0!0&0#1|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#2|
          1
          (select |c:loop_example.c@72@F@main@a?1!0&0#2| 0))
   |c:loop_example.c@72@F@main@a?1!0&0#3|))
(assert (= (ite (not |goto_symex::guard?0!0&0#1|)
        |c:loop_example.c@72@F@main@a?1!0&0#2|
        |c:loop_example.c@72@F@main@a?1!0&0#3|)
   |c:loop_example.c@72@F@main@a?1!0&0#4|))
(assert (= (ite (not |goto_symex::guard?0!0&0#1|) 0 (- 1))
   |c:loop_example.c@53@F@main@i?1!0&0#6|))
(assert (= (store |c:loop_example.c@72@F@main@a?1!0&0#4|
          (+ |c:loop_example.c@53@F@main@i?1!0&0#6| 1)
          |c:loop_example.c@72@F@main@pivot?1!0&0#1|)
   |c:loop_example.c@72@F@main@a?1!0&0#5|))
(assert (let ((a!1 (=> true
               (=> |execution_statet::\\guard_exec?0!0|
                   (>= (+ |c:loop_example.c@53@F@main@i?1!0&0#6| 1) 0))))
      (a!2 (=> true
               (=> |execution_statet::\\guard_exec?0!0|
                   (< (+ |c:loop_example.c@53@F@main@i?1!0&0#6| 1) 2))))
      (a!3 (=> true
               (=> |execution_statet::\\guard_exec?0!0|
                   (<= (select |c:loop_example.c@72@F@main@a?1!0&0#5| 0)
                       (select |c:loop_example.c@72@F@main@a?1!0&0#5| 1))))))
  (or (not a!1) (not a!2) (not a!3))))
