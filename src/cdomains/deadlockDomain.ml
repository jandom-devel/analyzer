open Cil
open Pretty
open Printf

type myowntypeEntry = {addr : ValueDomain.Addr.t ; loc : location}
type myowntype = myowntypeEntry list

let forbiddenList : ( (myowntypeEntry*myowntypeEntry) list ref) = ref []
let availableLocks : (myowntypeEntry list ref) = ref []

module Lockset = 
struct
  type t = myowntype

  let leq a b = (* a subset of b? *)
    let isElemInB e = List.exists (fun x -> ValueDomain.Addr.equal (x.addr) (e.addr)) b in
    List.for_all (fun x -> isElemInB x) a

  let rec join a b = (* union of a and b without duplicates *)
    let isElemInA e = List.exists (fun x -> ValueDomain.Addr.equal (x.addr) (e.addr)) a in
    if (List.length b) == 0 then a
    else join (a@(if (isElemInA (List.hd b)) == true then [] else [List.hd b])) (List.tl b)

  let oldjoin a b = a@b (* ? *)

  let meet a b = (* intersection of a and b *)
    let isElemInB e = List.exists (fun x -> ValueDomain.Addr.equal (x.addr) (e.addr)) b in
    List.filter (fun e -> isElemInB e) a

  let equal a b = (* a and b equal? *)
    (leq a b) && (leq b a)

  let top () = !availableLocks
  let is_top x = equal (!availableLocks) x
  let bot () = []
  let is_bot x = (List.length x) == 0
  let empty () = []

  let widen x y = y
  let narrow x y = x

  let hash i = 986713477
  let pretty () _ = text ""
  let short _ _ = ""
  let toXML x =
    let lockAddrName e = (ValueDomain.Addr.short () e.addr) in
    let lockListStr = List.fold_left (fun s v -> if ((String.length s) == 0) then (lockAddrName v) else s^", "^(lockAddrName v)) "" x in    
    Xml.Element ("Leaf", [("text", "Locks: ["^lockListStr^"]")], [])
  let isSimple _ = true
  let pretty_f _ = pretty
  let toXML_f _ = toXML
  let name () = "Deadlock Domain"
  let pretty_diff () (x,y) = text ""

  let compare = Pervasives.compare
  
  let printXml f xs =
    let print_one x = 
      BatPrintf.fprintf f "%s" (ValueDomain.Addr.short () x.addr)
    in
    BatPrintf.fprintf f "<value>\n<set>";
    List.iter print_one xs;
    BatPrintf.fprintf f "</set></value>\n"
end
