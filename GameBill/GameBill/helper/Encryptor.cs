using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace GameBill.helper
{
    public class Encryptor
    {
        public string Hash(string input)
        {
            var bytes = Encoding.UTF8.GetBytes(input);
            byte[] hashBytes;

            using (var algo = new System.Security.Cryptography.SHA512Managed())
            {
                hashBytes = algo.ComputeHash(bytes);
            }

            return Convert.ToBase64String(hashBytes);
        }
    }
}