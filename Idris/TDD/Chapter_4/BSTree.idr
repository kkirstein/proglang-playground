-- BSTree.idr
--
-- Demonstates generic data types

module BSTree

||| A binary tree
public export
data BSTree : Type -> Type where
  Empty : Ord elem => BSTree elem
  Node : Ord elem => (left : BSTree elem) -> (val : elem) ->
                     (right : BSTree elem) -> BSTree elem

%name BSTree tree, tree1

||| Inserts a new element into a binary search tree
export
insert : elem -> BSTree elem -> BSTree elem
insert x Empty = Node Empty x Empty
insert x (Node left val right) = case compare x val of
                                      LT => Node (insert x left) val right
                                      EQ => Node left val right
                                      GT => Node left val (insert x right)



