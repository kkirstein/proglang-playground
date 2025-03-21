# mandelbrot_colormap.nim
# color map for mandelbrot sets
#
# vim: ft=nim sw=4 ts=4 et
#

# define RGB ype for pixel values
type
    Color* = tuple[red, green, blue : uint8]

proc toString* (color : Color) : string =
    result = $int(color.red) & " " & $int(color.green) & " " & $int(color.blue)

# define some colors
const Black* : Color = (red: 0'u8, green: 0'u8, blue: 0'u8)

# define color map
const color_map* : array[217, Color] = [
  (0'u8, 0'u8, 0'u8), (0'u8, 0'u8, 252'u8), (64'u8, 0'u8, 252'u8), (124'u8, 0'u8, 252'u8), (188'u8, 0'u8, 252'u8),
  (252'u8, 0'u8, 252'u8), (252'u8, 0'u8, 188'u8), (252'u8, 0'u8, 124'u8), (252'u8, 0'u8, 64'u8), (252'u8, 0'u8, 0'u8),
  (252'u8, 64'u8, 0'u8), (252'u8, 124'u8, 0'u8), (252'u8, 188'u8, 0'u8), (252'u8, 252'u8, 0'u8), (188'u8, 252'u8, 0'u8),
  (124'u8, 252'u8, 0'u8), (64'u8, 252'u8, 0'u8), (0'u8, 252'u8, 0'u8), (0'u8, 252'u8, 64'u8), (0'u8, 252'u8, 124'u8),
  (0'u8, 252'u8, 188'u8), (0'u8, 252'u8, 252'u8), (0'u8, 188'u8, 252'u8), (0'u8, 124'u8, 252'u8), (0'u8, 64'u8, 252'u8),
  (124'u8, 124'u8, 252'u8), (156'u8, 124'u8, 252'u8), (188'u8, 124'u8, 252'u8), (220'u8, 124'u8, 252'u8), (252'u8, 124'u8, 252'u8),
  (252'u8, 124'u8, 220'u8), (252'u8, 124'u8, 188'u8), (252'u8, 124'u8, 156'u8), (252'u8, 124'u8, 124'u8), (252'u8, 156'u8, 124'u8),
  (252'u8, 188'u8, 124'u8), (252'u8, 220'u8, 124'u8), (252'u8, 252'u8, 124'u8), (220'u8, 252'u8, 124'u8), (188'u8, 252'u8, 124'u8),
  (156'u8, 252'u8, 124'u8), (124'u8, 252'u8, 124'u8), (124'u8, 252'u8, 156'u8), (124'u8, 252'u8, 188'u8), (124'u8, 252'u8, 220'u8),
  (124'u8, 252'u8, 252'u8), (124'u8, 220'u8, 252'u8), (124'u8, 188'u8, 252'u8), (124'u8, 156'u8, 252'u8), (180'u8, 180'u8, 252'u8),
  (196'u8, 180'u8, 252'u8), (216'u8, 180'u8, 252'u8), (232'u8, 180'u8, 252'u8), (252'u8, 180'u8, 252'u8), (252'u8, 180'u8, 232'u8),
  (252'u8, 180'u8, 216'u8), (252'u8, 180'u8, 196'u8), (252'u8, 180'u8, 180'u8), (252'u8, 196'u8, 180'u8), (252'u8, 216'u8, 180'u8),
  (252'u8, 232'u8, 180'u8), (252'u8, 252'u8, 180'u8), (232'u8, 252'u8, 180'u8), (216'u8, 252'u8, 180'u8), (196'u8, 252'u8, 180'u8),
  (180'u8, 252'u8, 180'u8), (180'u8, 252'u8, 196'u8), (180'u8, 252'u8, 216'u8), (180'u8, 252'u8, 232'u8), (180'u8, 252'u8, 252'u8),
  (180'u8, 232'u8, 252'u8), (180'u8, 216'u8, 252'u8), (180'u8, 196'u8, 252'u8), (0'u8, 0'u8, 112'u8), (28'u8, 0'u8, 112'u8),
  (56'u8, 0'u8, 112'u8), (84'u8, 0'u8, 112'u8), (112'u8, 0'u8, 112'u8), (112'u8, 0'u8, 84'u8), (112'u8, 0'u8, 56'u8),
  (112'u8, 0'u8, 28'u8), (112'u8, 0'u8, 0'u8), (112'u8, 28'u8, 0'u8), (112'u8, 56'u8, 0'u8), (112'u8, 84'u8, 0'u8),
  (112'u8, 112'u8, 0'u8), (84'u8, 112'u8, 0'u8), (56'u8, 112'u8, 0'u8), (28'u8, 112'u8, 0'u8), (0'u8, 112'u8, 0'u8),
  (0'u8, 112'u8, 28'u8), (0'u8, 112'u8, 56'u8), (0'u8, 112'u8, 84'u8), (0'u8, 112'u8, 112'u8), (0'u8, 84'u8, 112'u8),
  (0'u8, 56'u8, 112'u8), (0'u8, 28'u8, 112'u8), (56'u8, 56'u8, 112'u8), (68'u8, 56'u8, 112'u8), (84'u8, 56'u8, 112'u8),
  (96'u8, 56'u8, 112'u8), (112'u8, 56'u8, 112'u8), (112'u8, 56'u8, 96'u8), (112'u8, 56'u8, 84'u8), (112'u8, 56'u8, 68'u8),
  (112'u8, 56'u8, 56'u8), (112'u8, 68'u8, 56'u8), (112'u8, 84'u8, 56'u8), (112'u8, 96'u8, 56'u8), (112'u8, 112'u8, 56'u8),
  (96'u8, 112'u8, 56'u8), (84'u8, 112'u8, 56'u8), (68'u8, 112'u8, 56'u8), (56'u8, 112'u8, 56'u8), (56'u8, 112'u8, 68'u8),
  (56'u8, 112'u8, 84'u8), (56'u8, 112'u8, 96'u8), (56'u8, 112'u8, 112'u8), (56'u8, 96'u8, 112'u8), (56'u8, 84'u8, 112'u8),
  (56'u8, 68'u8, 112'u8), (80'u8, 80'u8, 112'u8), (88'u8, 80'u8, 112'u8), (96'u8, 80'u8, 112'u8), (104'u8, 80'u8, 112'u8),
  (112'u8, 80'u8, 112'u8), (112'u8, 80'u8, 104'u8), (112'u8, 80'u8, 96'u8), (112'u8, 80'u8, 88'u8), (112'u8, 80'u8, 80'u8),
  (112'u8, 88'u8, 80'u8), (112'u8, 96'u8, 80'u8), (112'u8, 104'u8, 80'u8), (112'u8, 112'u8, 80'u8), (104'u8, 112'u8, 80'u8),
  (96'u8, 112'u8, 80'u8), (88'u8, 112'u8, 80'u8), (80'u8, 112'u8, 80'u8), (80'u8, 112'u8, 88'u8), (80'u8, 112'u8, 96'u8),
  (80'u8, 112'u8, 104'u8), (80'u8, 112'u8, 112'u8), (80'u8, 104'u8, 112'u8), (80'u8, 96'u8, 112'u8), (80'u8, 88'u8, 112'u8),
  (0'u8, 0'u8, 64'u8), (16'u8, 0'u8, 64'u8), (32'u8, 0'u8, 64'u8), (48'u8, 0'u8, 64'u8), (64'u8, 0'u8, 64'u8), (64'u8, 0'u8, 48'u8),
  (64'u8, 0'u8, 32'u8), (64'u8, 0'u8, 16'u8), (64'u8, 0'u8, 0'u8), (64'u8, 16'u8, 0'u8), (64'u8, 32'u8, 0'u8), (64'u8, 48'u8, 0'u8),
  (64'u8, 64'u8, 0'u8), (48'u8, 64'u8, 0'u8), (32'u8, 64'u8, 0'u8), (16'u8, 64'u8, 0'u8), (0'u8, 64'u8, 0'u8), (0'u8, 64'u8, 16'u8),
  (0'u8, 64'u8, 32'u8), (0'u8, 64'u8, 48'u8), (0'u8, 64'u8, 64'u8), (0'u8, 48'u8, 64'u8), (0'u8, 32'u8, 64'u8), (0'u8, 16'u8, 64'u8),
  (32'u8, 32'u8, 64'u8), (40'u8, 32'u8, 64'u8), (48'u8, 32'u8, 64'u8), (56'u8, 32'u8, 64'u8), (64'u8, 32'u8, 64'u8),
  (64'u8, 32'u8, 56'u8), (64'u8, 32'u8, 48'u8), (64'u8, 32'u8, 40'u8), (64'u8, 32'u8, 32'u8), (64'u8, 40'u8, 32'u8),
  (64'u8, 48'u8, 32'u8), (64'u8, 56'u8, 32'u8), (64'u8, 64'u8, 32'u8), (56'u8, 64'u8, 32'u8), (48'u8, 64'u8, 32'u8),
  (40'u8, 64'u8, 32'u8), (32'u8, 64'u8, 32'u8), (32'u8, 64'u8, 40'u8), (32'u8, 64'u8, 48'u8), (32'u8, 64'u8, 56'u8),
  (32'u8, 64'u8, 64'u8), (32'u8, 56'u8, 64'u8), (32'u8, 48'u8, 64'u8), (32'u8, 40'u8, 64'u8), (44'u8, 44'u8, 64'u8),
  (48'u8, 44'u8, 64'u8), (52'u8, 44'u8, 64'u8), (60'u8, 44'u8, 64'u8), (64'u8, 44'u8, 64'u8), (64'u8, 44'u8, 60'u8),
  (64'u8, 44'u8, 52'u8), (64'u8, 44'u8, 48'u8), (64'u8, 44'u8, 44'u8), (64'u8, 48'u8, 44'u8), (64'u8, 52'u8, 44'u8),
  (64'u8, 60'u8, 44'u8), (64'u8, 64'u8, 44'u8), (60'u8, 64'u8, 44'u8), (52'u8, 64'u8, 44'u8), (48'u8, 64'u8, 44'u8),
  (44'u8, 64'u8, 44'u8), (44'u8, 64'u8, 48'u8), (44'u8, 64'u8, 52'u8), (44'u8, 64'u8, 60'u8), (44'u8, 64'u8, 64'u8),
  (44'u8, 60'u8, 64'u8), (44'u8, 52'u8, 64'u8), (44'u8, 48'u8, 64'u8)]

let n_max* : int = len(color_map)


