(:Let try to see how to count the number of meuseum in the   museums with a given name:)
declare function local:treeCount( $db, $name)
 as xs:integer { 
let $i := 0 
let $result := fn:collection($db)
let $x := count(for $r in $result 
                where $r//trees/tree/kind= $name
                 return $r )
      return $x
};
(: Lets suppose we want to select all  the trees available in the data :)
declare function local:select($db) {
  
   let $selection  := 
                  for $element in fn:collection($db) 
                       let $str := string-join($element , ",")
                       return $str
   return $selection
};
(: There exist also normal selection where it would display the elements accompanied with their tag in an xml format such that :)
declare function local:simpleSelect($db) { 
  let $simple_selection := for $element in fn:collection($db) 
                             return $element
      return $simple_selection 
};

let $db := "XMLData" 
let $sum := local:treeCount($db , "Maclura")
let $selection:= local:select($db)
let $simple_selection := local:simpleSelect($db)
return $simple_selection

