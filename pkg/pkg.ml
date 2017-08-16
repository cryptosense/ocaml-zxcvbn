#use "topfind"
#require "topkg"
open Topkg

let () =
  Pkg.describe "zxcvbn" @@ fun c ->
  Ok [ Pkg.mllib "src/zxcvbn.mllib"
     ; Pkg.clib "src/libzxcvbn_stubs.clib"
     ; Pkg.test "test/test"
     ; Pkg.test ~run:false "test/test_memory"
     ]
