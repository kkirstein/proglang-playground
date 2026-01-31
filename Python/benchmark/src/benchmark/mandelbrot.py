# mandelbrot.py
# Generate Mandelbrot set images in Python (V3)

from PIL import Image


class Mandelbrot:
    """Class to generate Mandelbrot set images."""

    def __init__(
        self,
        width: int,
        height: int,
        center: tuple[float, float],
        pixel_size: float,
        max_iter: int,
    ):
        self.width = width
        self.height = height
        self.pixel_size = pixel_size
        self.x_offset = center[0] - 0.5 * pixel_size * self.width
        self.y_offset = center[1] + 0.5 * pixel_size * self.height
        self.max_iter = max_iter
        self.image = Image.new("RGB", (self.width, self.height))

    def _pixel_value(
        self,
        z0: complex,
    ) -> int:
        """Calculate the number of iterations for a point in the Mandelbrot set."""
        n = 0
        z = complex(0, 0)
        while abs(z) <= 2 and n < self.max_iter:
            z = z * z + z0
            n += 1
        return n

    def _get_color(self, n: int) -> tuple[int, int, int]:
        """Return a color based on the number of iterations."""
        if n >= self.max_iter:
            return (0, 0, 0)  # Black for points in the set
        # return (n % 8 * 32, n % 16 * 16, n % 32 * 8)  # Color based on iteration count
        return (
            5 * (n % 15),
            16 * (n % 7),
            8 * (n % 31),
        )  # Color based on iteration count

    def generate(self):
        """Generate the Mandelbrot set image."""
        for x in range(self.width):
            for y in range(self.height):
                x_scaled = x
                y_scaled = y
                z = complex(x_scaled, y_scaled)
                pix_val = self._pixel_value(z)
                color = self._get_color(pix_val)

                zx = (x / self.width) * 3.5 - 2.5
                zy = (y / self.height) * 2.0 - 1.0
                z0 = complex(zx, zy)
                n = self._pixel_value(z0)
                color = self._get_color(n)
                self.image.putpixel((x, y), color)  # slow, alternative: 'paste' method

    def save(self, filename: str):
        """Save the generated image to a file."""
        self.image.save(filename, "PNG")
