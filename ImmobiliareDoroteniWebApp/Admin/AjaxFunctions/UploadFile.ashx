<%@ WebHandler Language="C#" Class="UploadFile" %>

using System;
using System.Web;
using System.IO;
using System.Net;
using System.Drawing;
using System.Collections.Generic;
using System.Web.Script.Serialization;
using Goheer.EXIF;

public class UploadFile : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        context.Response.ContentType = "text/plain";
        string folder = context.Server.MapPath("../../Foto/");//context.Request.Form["folder"]);
        //se la directory non estite viene creata
        if (!Directory.Exists(folder))
        {
            Directory.CreateDirectory(folder);
            Directory.CreateDirectory(folder + "resized");
            Directory.CreateDirectory(folder + "resized100x100");
        }
        List<string> listaPathFoto = new List<string>();
        //Salvo i file caricati
        if (context.Request.Files.Count > 0)
        {
            for (short n = 0; n <= context.Request.Files.Count - 1; n++)
            {
                HttpPostedFile fileWrite = context.Request.Files.Get(n);
                string nomefile = System.IO.Path.GetFileName(fileWrite.FileName);
                string path = folder + nomefile;
                listaPathFoto.Add(nomefile);
                // Rotate the image according to EXIF data
                fileWrite.SaveAs(path);
                var bmp = new Bitmap(path);
                var exif = new EXIFextractor(ref bmp, "n"); // get source from http://www.codeproject.com/KB/graphics/exifextractor.aspx?fid=207371

                if (exif["Orientation"] != null)
                {
                    RotateFlipType flip = OrientationToFlipType(exif["Orientation"].ToString());

                    if (flip != RotateFlipType.RotateNoneFlipNone) // don't flip of orientation is correct
                    {
                        bmp.RotateFlip(flip);
                        exif.setTag(0x112, "1"); // Optional: reset orientation tag
                        bmp.Save(path, System.Drawing.Imaging.ImageFormat.Jpeg);
                    }
                }
                
                Image img = System.Drawing.Image.FromFile(path);


                if (nomefile.Contains("jpg") || nomefile.Contains("png") || nomefile.Contains("bmp") || nomefile.Contains("gif") || nomefile.Contains("JPG") || nomefile.Contains("PNG") || nomefile.Contains("BMP") || nomefile.Contains("GIF"))
                {
                    Environment.CurrentDirectory = AppDomain.CurrentDomain.BaseDirectory;
                    WebClient wDown = new WebClient();
                    MemoryStream DataM = new MemoryStream(wDown.DownloadData(path));
                    int width = img.Width;
                    int height = img.Height;

                    if (width > height)
                    {
                        CreateThumb(DataM, 240, 180, folder + "/resized/r_" + nomefile);
                        CreateThumb(DataM, 100, 100, folder + "/resized100x100/r_" + nomefile);
                    }
                    else
                    {
                        Size s = new Size();
                        s.Width = 360;
                        s.Height = 480;
                        Image imgResized = resizeImage(img, s);
                        Rectangle r = new Rectangle();
                        r.Height = 180;
                        r.Width = 240;
                        r.X = Convert.ToInt32(ContentAlignment.MiddleCenter);
                        r.Y = Convert.ToInt32(ContentAlignment.MiddleCenter);
                        Image imgCropped = cropImage(imgResized, r);
                        saveJpeg(folder + "/resized/r_" + nomefile, imgCropped, 100);
                        CreateThumb(DataM, 100, 100, folder + "/resized100x100/r_" + nomefile);
                    }
                    
                }
                fileWrite = null;
            }
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            context.Response.Write(serializer.Serialize(listaPathFoto));
        }
    }
    
    
    
    private void ResizeAndSave(Stream imgStr, int Width, int Height, string FileName)
    {
        //creo il bitmap dallo stream
        System.Drawing.Image bmpStream = System.Drawing.Image.FromStream(imgStr);
        //creo un nuovo bitmap ridimensionandolo
        Bitmap img = new Bitmap(bmpStream, new Size(Width, Height));
        //salvo l'immagine ridimensionata
        img.Save(FileName, System.Drawing.Imaging.ImageFormat.Jpeg);

    }
    
    public bool ThumbnailCallback()
    {
        return false;
    }

    public void CreateThumb(Stream imgStr, int Width, int Height, string FileName)
    {
        Image.GetThumbnailImageAbort myCallback = new Image.GetThumbnailImageAbort(ThumbnailCallback);
        Bitmap myBitmap = new Bitmap(imgStr);
        Image myThumbnail = myBitmap.GetThumbnailImage(Width, Height, myCallback, IntPtr.Zero);
        myThumbnail.Save(FileName, System.Drawing.Imaging.ImageFormat.Jpeg);
    }
    
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }


    private void saveJpeg(string path, Image img, long quality)
    {
        // Encoder parameter for image quality
        System.Drawing.Imaging.EncoderParameter qualityParam =
            new System.Drawing.Imaging.EncoderParameter(System.Drawing.Imaging.Encoder.Quality, quality);

        // Jpeg image codec
        System.Drawing.Imaging.ImageCodecInfo jpegCodec = getEncoderInfo("image/jpeg");

        if (jpegCodec == null)
            return;

        System.Drawing.Imaging.EncoderParameters encoderParams = new System.Drawing.Imaging.EncoderParameters(1);
        encoderParams.Param[0] = qualityParam;

        img.Save(path, jpegCodec, encoderParams);
    }
    
    private System.Drawing.Imaging.ImageCodecInfo getEncoderInfo(string mimeType)
    {
        // Get image codecs for all image formats
        System.Drawing.Imaging.ImageCodecInfo[] codecs = System.Drawing.Imaging.ImageCodecInfo.GetImageEncoders();

        // Find the correct image codec
        for (int i = 0; i < codecs.Length; i++)
            if (codecs[i].MimeType == mimeType)
                return codecs[i];
        return null;
    }
    
    private Image cropImage(Image img, Rectangle cropArea)
    {
       // Bitmap bmpImage = new Bitmap(img);
       // Bitmap bmpCrop = bmpImage.Clone(cropArea,bmpImage.PixelFormat);
       // return (Image)(bmpCrop);
        
        Bitmap bmp = new Bitmap(cropArea.Width, cropArea.Height);
        using (Graphics gph = Graphics.FromImage(bmp))
        {
            gph.DrawImage(img, new Rectangle(0, 0, bmp.Width, bmp.Height), cropArea, GraphicsUnit.Pixel);
        }
        return (Image)bmp;
    }
    
    private Image resizeImage(Image imgToResize, Size size)
    {
        int sourceWidth = imgToResize.Width;
        int sourceHeight = imgToResize.Height;

        float nPercent = 0;
        float nPercentW = 0;
        float nPercentH = 0;

        nPercentW = ((float)size.Width / (float)sourceWidth);
        nPercentH = ((float)size.Height / (float)sourceHeight);

        if (nPercentH < nPercentW)
            nPercent = nPercentH;
        else
            nPercent = nPercentW;

        int destWidth = (int)(sourceWidth * nPercent);
        int destHeight = (int)(sourceHeight * nPercent);

        Bitmap b = new Bitmap(destWidth, destHeight);
        Graphics g = Graphics.FromImage((Image)b);
        g.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;

        g.DrawImage(imgToResize, 0, 0, destWidth, destHeight);
        g.Dispose();

        return (Image)b;
    }
    // Match the orientation code to the correct rotation:
 
    private static RotateFlipType OrientationToFlipType(string orientation)
    {
        switch (int.Parse(orientation))
        {
            case 1:
            return RotateFlipType.RotateNoneFlipNone;
            break;
            case 2:
            return RotateFlipType.RotateNoneFlipX;
            break;
            case 3:
            return RotateFlipType.Rotate180FlipNone;
            break;
            case 4:
            return RotateFlipType.Rotate180FlipX;
            break;
            case 5:
            return RotateFlipType.Rotate90FlipX;
            break;
            case 6:
            return RotateFlipType.Rotate90FlipNone;
            break;
            case 7:
            return RotateFlipType.Rotate270FlipX;
            break;
            case 8:
            return RotateFlipType.Rotate270FlipNone;
            break;
            default:
            return RotateFlipType.RotateNoneFlipNone;
        }
    }
   
}