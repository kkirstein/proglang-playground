using System;
using System.Collections.Generic;
using System.Linq;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;
using System.Drawing.Imaging;
using System.Runtime.InteropServices;
using System.Xml.Linq;

namespace Benchmark.Tasks
{
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

        private Bitmap img;
        private int stride;

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
        public Mandelbrot(int width, int height, double xCenter, double yCenter, double scale)
        {
            Width = width;
            Height = height;
            XCenter = xCenter;
            YCenter = yCenter;
            Scale = scale;

            img = new Bitmap(width, height, PixelFormat.Format24bppRgb);

            var bData = img.LockBits(new Rectangle(0, 0, width, height),
                ImageLockMode.WriteOnly,
                PixelFormat.Format24bppRgb);

            var byteCount = bData.Stride * height;
            stride = bData.Stride;

            byte[] data = new byte[byteCount];

            CalcPixelSeq(ref data);

            Marshal.Copy(data, 0, bData.Scan0, data.Length);

            img.UnlockBits(bData);
        }

        #endregion

        #region methods

        /// <summary>
        /// Calculate Mandelbrot set sequentially
        /// </summary>
        /// <param name="data">Byte array of RGB pixel data</param>
        public void CalcPixelSeq(ref byte[] data)
        {
            var xOffset = XCenter - 0.5 * Scale * Width;
            var yOffset = YCenter + 0.5 * Scale * Width;

            for (int y = 0; y < Height; y++)
            {
                for (int x = 0; x < Width; x++)
                {
                    var xCoord = x * Scale + xOffset;
                    var yCoord = y * Scale - yOffset;

                    var pixel = PixelValue(xCoord, yCoord);
                    var rgb = PixelToRgb(pixel);

                    // TODO
                    var baseIdx = 3 * x + stride * y;
                    data[baseIdx] = rgb[0];
                    data[baseIdx + 1] = rgb[1];
                    data[baseIdx + 2] = rgb[2];
                }
            }
        }

        /// <summary>
        /// Save Mandelbrot image to file
        /// </summary>
        /// <param name="filename">File path to be written</param>
        public void Save(string filename)
        {
            img.Save(filename);
        }

        #endregion
    }
}
