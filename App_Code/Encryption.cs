using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text;
using System.IO;
using System.Security.Cryptography;

public class Encryption
{
	public Encryption()
	{		
	}
    
    public string EncryptText(string plainText, string encKey, string encIv)
    {
        RijndaelManaged obRjm = new RijndaelManaged();
        byte [] encryptedText = null;
        byte[] myKey = null;
        byte[] myIv = null;
        byte[] myText = null;
        obRjm.GenerateKey();
        obRjm.GenerateIV();
        myKey = Convert.FromBase64String(encKey);
        myIv = Convert.FromBase64String(encIv);
        myText = Encoding.ASCII.GetBytes(plainText);
        ICryptoTransform obIct = obRjm.CreateEncryptor(myKey,myIv);
        MemoryStream obMes = new MemoryStream ();
        CryptoStream obCrs = new CryptoStream (obMes,obIct, CryptoStreamMode.Write );
        obCrs.Write (myText,0,myText.Length);
        obCrs.FlushFinalBlock();
        encryptedText = obMes.ToArray();
        obMes.Close();
        obMes.Close();
        return Convert.ToBase64String (encryptedText);
    }
}
