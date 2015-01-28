-- text_input.elm
-- demonstrates text input fields
--
-- vim: ft=elm sw=2 ts=2
-- 
-- taken from the book
-- Seven More Languages in Seven Weeks
-- http://pragprog.com/book/7lang/seven-more-languages-in-seven-weeks 
--

import String
import Graphics.Input as Input
import Graphics.Input.Field as Field

-- define the test signal
content = Input.input Field.noContent

-- some text manipulataion functions
-- (the "business logic")
shout text = String.toUpper text
whisper text = String.toLower text
echo text = (shout text) ++  " " ++ (whisper text)

-- define scene
scene fieldContent =
  flow down
  [ Field.field Field.defaultStyle content.handle id "Speak, Babe!" fieldContent
  , plainText (echo fieldContent.string)
  ]

main = lift scene content.signal


