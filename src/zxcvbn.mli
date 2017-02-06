(** Bindings to the zxcvbn password strength estimation library *)

module Match : sig
  type typ =
    | Non_match
    | Brute_match
    | Dictionnary_match
    | Dict_leet_match
    | User_match
    | User_leet_match
    | Repeats_match
    | Sequence_match
    | Spatial_match
    | Date_match
    | Year_match
    | Unknown_match of int
  [@@deriving eq, ord, show]

  type t =
    { beginning: int
    ; length: int
    ; entropy: float
    ; typ: typ
    ; multipart: bool
    ; multipart_entropy: float
    }
  [@@deriving eq, ord, show]
end

(** Return the overall password entropy estimation and the list of match *)
val matches : string -> float * Match.t list
