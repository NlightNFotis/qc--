backend = Backend.x86
backend.ralloc = backend.ralloc or Ralloc.color

-- compare results with files in x86
Test.results = Test.results or "x86"

Ld.rtend = ""  --- don't need the run-time system
-- source files live in src directory
Test.source  = "src"
Test.files = { "eqasolve-000.c--"
             , "exp-002.c--"
             , "exp-003.c--"
	     , "unwind.c--"
	     , "err-001.c--"
             , "err-000.c--"
             , "err-002.c--"
             }

function norun(file) return { source = file, runnable="false" } end

i = 1
while Test.files[i] do
  Test.files[i] = norun(Test.files[i])
  i = i + 1
end

print('# these tests pass if they assemble successfully (diffs in .s only)')
Test.different_asm_ok = 1