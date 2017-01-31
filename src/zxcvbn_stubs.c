#include "../vendor/zxcvbn.h"

#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/mlvalues.h>

CAMLprim value zxcvbn_match_caml(value pwd) {
  return caml_copy_double(ZxcvbnMatch(String_val(pwd), NULL, NULL));
}
