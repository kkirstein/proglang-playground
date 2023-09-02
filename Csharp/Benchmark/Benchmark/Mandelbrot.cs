using System.Numerics;
using SkiaSharp;

namespace Benchmark.Tasks
{

    public enum MandelbrotMethod
    {
        Sequential,
        Parallel
    }

    /// <summary>
    /// Generate Mandelbrot sets
    /// </summary>
    public class Mandelbrot
    {

        #region properties

        int Width { init; get; }
        int Height { init; get; }
        double XCenter { init; get; }
        double YCenter { init; get; }
        double Scale { init; get; }

        #endregion

        #region private members

        private static readonly double R_MAX = 2.0;
        private static readonly byte N_MAX = 255;

        private SKImage img;
        //private SKBitmap bm;

        #endregion

        #region static members

        /// <summary>
        /// Calculate pixel value for given complex number
        /// </summary>
        /// <param name="z"></param>
        /// <returns>Pixel value</returns>
        public static byte PixelValue(Complex z)
        {
            var n = N_MAX;
            var z0 = z;

            while (z.Magnitude < R_MAX && n > 0)
            {
                z = z * z + z0;
                --n;
            }

            return n;
        }

        /// <summary>
        /// Calculate pixel value for given coordinates
        /// </summary>
        /// <param name="x">Horizontal coordinate</param>
        /// <param name="y">Vertical coordinate</param>
        /// <returns>Pixel value</returns>
        public static byte PixelValue(double x, double y)
        {
            return PixelValue(new Complex(x, y));
        }

        /// <summary>
        /// Convert pixel value to RGB values
        /// </summary>
        /// <param name="value">Pixel value</param>
        /// <returns>Byte array with RGB values</returns>
        public static byte[] PixelToRgb(byte value)
        {
            var r = (byte)(15 * (value % 15));
            var g = (byte)(32 * (value % 7));
            var b = (byte)(8 * (value % 31));
            var rgb = new byte[] { r, g, b };

            return rgb;
        }

        #endregion

        #region constructor

        /// <summary>
        /// Construct a Mandelbrot set
        /// </summary>
        /// <param name="width">Image width of Mandelbrot set</param>
        /// <param name="height">Image height of Mandelbrot set</param>
        /// <param name="xCenter">Horizontal center coordinate of Mandelbrot set</param>
        /// <param name="yCenter">Vertical center coordinate of Mandelbrot set</param>
        /// <param name="scale">Pixel size scaling</param>
        public Mandelbrot(int width, int height, double xCenter, double yCenter, double scale, MandelbrotMethod method)
        {
            Width = width;
            Height = height;
            XCenter = xCenter;
            YCenter = yCenter;
            Scale = scale;

            var info = new SKImageInfo(Width, Height, SKColorType.Rgb888x);

            var buf = method switch
            {
                MandelbrotMethod.Sequential => CalcPixelSeq(),
                MandelbrotMethod.Parallel => CalcPixelPar()
            };

            img = SKImage.FromPixelCopy(info, buf);
        }

        #endregion

        #region methods

        /// <summary>
        /// Calculate Mandelbrot set sequentially
        /// </summary>
        /// <param name="data">Byte array of RGB pixel data</param>
        public Span<byte> CalcPixelSeq()
        {
            var xOffset = XCenter - 0.5 * Scale * Width;
            var yOffset = YCenter + 0.5 * Scale * Width;

            byte[] buf = new byte[4 * Width * Height];

            for (int y = 0; y < Height; y++)
            {
                for (int x = 0; x < Width; x++)
                {
                    var xCoord = x * Scale + xOffset;
                    var yCoord = y * Scale - yOffset;

                    var pixel = PixelValue(xCoord, yCoord);
                    var rgb = PixelToRgb(pixel);

                    // set RGB values, leave alpha out
                    var baseIdx = 4 * x + 4 * Width * y;
                    buf[baseIdx] = rgb[0];
                    buf[baseIdx + 1] = rgb[1];
                    buf[baseIdx + 2] = rgb[2];
                }
            }
            return buf;
        }

        public Span<byte> CalcPixelPar()
        {
            var xOffset = XCenter - 0.5 * Scale * Width;
            var yOffset = YCenter + 0.5 * Scale * Width;

            byte[] buf = new byte[4 * Width * Height];

            Parallel.For(0, Height, y =>
            {
                for (int x = 0; x < Width; x++)
                {
                    var xCoord = x * Scale + xOffset;
                    var yCoord = y * Scale - yOffset;

                    var pixel = PixelValue(xCoord, yCoord);
                    var rgb = PixelToRgb(pixel);

                    // set RGB values, leave alpha out
                    var baseIdx = 4 * x + 4 * Width * y;
                    buf[baseIdx] = rgb[0];
                    buf[baseIdx + 1] = rgb[1];
                    buf[baseIdx + 2] = rgb[2];
                }
            });
            return buf;
        }

        /// <summary>
        /// Save Mandelbrot image to file
        /// </summary>
        /// <param name="filename">File path to be written</param>
        public void Save(string filename)
        {
            using (Stream s = File.Create(filename))
            {
                var d = img.Encode(SKEncodedImageFormat.Png, 100);
                d.SaveTo(s);
            }
        }

        #endregion
    }
}
