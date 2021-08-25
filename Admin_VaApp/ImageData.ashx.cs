using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Drawing.Imaging;
using System.Drawing;

namespace Admin_VaApp
{
    /// <summary>
    /// Summary description for ImageData
    /// </summary>
    public class ImageData : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("Hello World");
            context.Response.AddHeader("Cache-control", "private,must-revalidate,post-check=1,pre-check=2,no-cache");
            context.Response.AppendHeader("Access-Control-Allow-Origin", "*");
            byte[] imgByte = GetImage(context);
            Stream stream = new MemoryStream(imgByte);

            context.Response.Clear();
            context.Response.ContentType = getContentType(context.Request.PhysicalPath);

            getContentType(context.Request.PhysicalPath);

            byte[] buffer = getResizedImage(stream, 150, 150);
            context.Response.OutputStream.Write
            (buffer, 0, buffer.Length);
            context.Response.End();

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        byte[] getResizedImage(Stream path, int width, int height)
        {
            Bitmap imgIn = new Bitmap(path);
            double y = imgIn.Height;
            double x = imgIn.Width;

            double factor = 1;
            if (width > 0)
            {
                factor = width / x;
            }
            else if (height > 0)
            {
                factor = height / y;
            }
            MemoryStream outStream = new MemoryStream();
            Bitmap imgOut = new Bitmap((int)(x * factor), (int)(y * factor));
            Graphics g = Graphics.FromImage(imgOut);
            g.Clear(Color.White);
            g.DrawImage(imgIn, new Rectangle(0, 0, (int)(factor * x), (int)(factor * y)), new Rectangle(0, 0, (int)x, (int)y), GraphicsUnit.Pixel);

            imgOut.Save(outStream, getImageFormat(".png"));
            return outStream.ToArray();
        }

        private byte[] GetImage(HttpContext context)
        {
            try
            {
                string id = context.Request.QueryString["id"].ToString();

                SqlCommand cmd = new SqlCommand("SELECT DisplayImage FROM t_Candidate WHERE ID = @ID");
                cmd.Parameters.Add("@ID", SqlDbType.VarChar).Value = id;
                DataSet ds = general.getSet(cmd);
                byte[] imgData = (byte[])ds.Tables[0].Rows[0][0];
                using(MemoryStream mstream = new MemoryStream(imgData,true))
                {
                    mstream.Write(imgData, 0, imgData.Length);
                    Byte[] bytes = mstream.ToArray();
                    context.Response.BinaryWrite(bytes);
                    return bytes;
                }
            }
            catch (Exception ex)
            {
                new Exception("image service " + ex.Message);
                return null;
            }

        }

        string getContentType(String path)
        {
            switch (path)
            {
                case ".bmp": return "Image/bmp";
                case ".gif": return "Image/gif";
                case ".jpg": return "Image/jpeg";
                case ".png": return "Image/png";
                default: break;
            }
            return "";
        }

        ImageFormat getImageFormat(String path)
        {
            switch(Path.GetExtension(path))
            {
                case ".bmp": return ImageFormat.Bmp;
                case ".gif": return ImageFormat.Gif;
                case ".jpg": return ImageFormat.Jpeg;
                case ".png": return ImageFormat.Png;
                default: break;
            }
            return ImageFormat.Png;
        }
    }
}