-- vim: ft=elm sw=2 ts=2 et

{--
	InputDialog.elm
	Generate a simple dialog for data input
--}

import Graphics.Input as Input
import Graphics.Input.Field as Field

-- Signals & Inputs
arg1 = Input.input Field.noContent
arg2 = Input.input Field.noContent


textinput : String -> Input.Handle Field.Content -> Field.Content -> Element
textinput label handle content =
  flow right
  [ container 120 36 midRight <| plainText label
  , container 220 36 middle <| size 180 26 <| 
    Field.field Field.defaultStyle handle id "" content
  ]
  
-- Display
--scene: Signal Element


logArea : Element
logArea = plainText "Nothing to log yet."

space : Element
space = (spacer 30 30)

scene : Element -> Element
scene arg1' arg2' = color charcoal <| flow down
  [ textinput "Label 1:" arg1.handle arg1'
  , textinput "Label 2:" arg2.handle arg2'
  , space
  , logArea]

main : Signal Element
main = lift2 scene arg1.signal arg2.signal
  
