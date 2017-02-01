open Ocamlbuild_plugin
open Command

let headers = ["vendor/zxcvbn.h"; "vendor/dict-src.h"]

let () =
  dispatch begin function
    | After_rules ->
        pflag ["c"; "compile"] "ccopt" (fun param -> S [A "-ccopt"; A param]);
        pflag ["c"; "link"] "ccopt" (fun param -> S [A "-ccopt"; A param]);
        flag ["library"; "link"; "byte"; "use_zxcvbn"]
          (S ([A "-dllib"; A "-lzxcvbn_stubs"]));
        flag ["library"; "link"; "native"; "use_zxcvbn"]
          (S ([A "-cclib"; A "-lzxcvbn_stubs"]));
        flag ["link"; "ocaml"; "link_zxcvbn"]
          (A "src/libzxcvbn_stubs.a");
        dep ["link"; "ocaml"; "use_zxcvbn"]
          ["src/libzxcvbn_stubs.a"];
        dep ["compile"; "c"] headers;
    | _ -> ()
  end
