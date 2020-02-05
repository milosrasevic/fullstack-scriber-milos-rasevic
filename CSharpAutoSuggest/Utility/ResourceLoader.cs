using System;
using System.IO;

namespace CSharpAutoSuggest.Utility
{
    public class ResourceLoader
    {
        /// <summary>
        /// Returns embedded resource text file.
        /// </summary>
        /// <returns>A string, with the contents of the file.</returns>
        /// <param name="filename">The name of the resource.</param>
        public string GetResourceTextFile (string filename)
        {
            string result;
            var rsrcName = $"CSharpAutoSuggest.resources.{filename}";

            try {
                using (var stream = this.GetType ().Assembly.GetManifestResourceStream (rsrcName)) {
                    using (var streamReader = new StreamReader (stream)) {
                        result = streamReader.ReadToEnd ();
                    }
                }
            } catch (Exception ex) {
                throw new Exception (
                    $"GetResourceTextFile - error loading rsrc {filename}, " +
                    $"err = {ex.Message}, stack = {ex.StackTrace}",
                    ex);
            }
            return result;
        }        
    }
}