-- [factorial-tail.lua] Proc. [main] should print out 7 then 7! = 5040
-- Tests: recursive procedure tail-calls & default returns, some operators
--
--- ./regr "../interp $SELF" $REGRFLAGS -out $BASE.1 -err $BASE.2

CMM.exports({ "main" })

CMM.procedure("main", 0, 0)

   CMM.push_literal("7")
   CMM.push_arg()

   CMM.c_call("cmmprint")

   CMM.push_symbol("factorial")
   CMM.cmm_call({}, {}, {}, 0)

   CMM.c_call("cmmprint")

   CMM.cmm_return(0, 0)

CMM.procedure("factorial", 0, 0)

   CMM.pop_arg()
   CMM.push_literal("1")
   CMM.push_arg()
   CMM.push_arg()

   CMM.push_symbol("factorial-helper")
   CMM.cmm_call({}, {}, {}, 0)

   CMM.cmm_return(0, 0)

--running count, n
CMM.procedure("factorial-helper", 1, 0)

   CMM.pop_arg()
   CMM.store_local(0)
   CMM.fetch_local(0)
   CMM.push_literal("1")
   CMM.apply_operator("leu", "bits16,bits16:bits1")
   CMM.cbrancht("done")

   CMM.fetch_local(0)
   CMM.pop_arg()
   CMM.apply_operator("mulu", "bits16,bits16:bits16")
   CMM.push_arg()

   CMM.fetch_local(0)
   CMM.push_literal("1")
   CMM.apply_operator("sub", "bits16,bits16:bits16")
   CMM.push_arg()

   CMM.push_symbol("factorial-helper")
   CMM.cmm_tail_call()

   CMM.define_label("done")
      CMM.cmm_return(0, 0)