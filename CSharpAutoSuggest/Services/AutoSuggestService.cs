using System.Collections.Concurrent;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using CSharpAutoSuggest.Entities;
using CSharpAutoSuggest.Utility;
using Newtonsoft.Json;
using Sid.Declarations;

namespace CSharpAutoSuggest
{
    public class AutoSuggestResponse
    {
        public IEnumerable<LabelEntity> Labels { get; set; } = Enumerable.Empty<LabelEntity>();
        public IEnumerable<ArtistEntity> Artists { get; set; } = Enumerable.Empty<ArtistEntity>();
        public IEnumerable<ReleaseEntity> Releases { get; set; } = Enumerable.Empty<ReleaseEntity>();
    }
    
    public class SimpleResponse
    {
        public bool Ok { get; set; }
        public string Message { get; set; }
    }

    public partial class AutoSuggestService
    {
        // NOTE TO CANDIDATE:  THESE GET POPULATED WITH ALL THE ENTITIES FROM DISK.  
        // YOU ARE NOT OBLIGATED TO KEEP THESE DATA STRUCTURES, BUT IT'S OK IF YOU DO; YOU DECIDE.
        // Right now, each list is simply a flat collection of the entire corpus of entities.
        public static LabelList Labels;
        public static ArtistList Artists;
        public static ReleasesList Releases;
        
        
        public SimpleResponse GetSanity()
        {
            return new SimpleResponse
            {
                Ok = true,
                Message = "Web Service is working",
            };
        }
        
        public static void Initialize()
        {
            // NOTE TO CANDIDATE:  THESE GET POPULATED WITH ALL THE ENTITIES FROM DISK.  
            // YOU ARE NOT OBLIGATED TO KEEP THESE DATA STRUCTURES, BUT IT'S OK IF YOU DO; YOU DECIDE.
            // Right now, each list is simply a flat collection of the entire corpus of entities.
            // These get loaded up at startup time for the project.
            // The actual json data lives as resources on this binary. 
            var labels = ParseJson<LabelList>("smallLabelsFile.json");
            var artists = ParseJson<ArtistList>("smallArtistsFile.json");
            var releases = ParseJson<ReleasesList>("smallReleasesFile.json");

            // CANDIDATE: DO SOMETHING WITH THIS.
        }

        public AutoSuggestResponse GetAutoSuggest(string prefix)
        {
            // CANDIDATE: DO SOMETHING WITH THIS.  This is empty right now.
            // CHANGE THAT>
            return new AutoSuggestResponse();
        }
        
        static T ParseJson<T>(string fileName) where T: class
        {
            var util = new ResourceLoader();            
            var jsonString = util.GetResourceTextFile(fileName);            
            var doc = JsonConvert.DeserializeObject<T>(jsonString);
            return doc;
        }        
    }
}