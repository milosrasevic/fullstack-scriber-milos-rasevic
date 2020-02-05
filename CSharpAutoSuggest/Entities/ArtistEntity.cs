using System.Xml.Serialization;
using Newtonsoft.Json;

namespace CSharpAutoSuggest.Entities
{
    public class ArtistList
    {
        [JsonProperty("artists")] 
        public ArtistEntity[] Artists;
    }
    
    [XmlRoot(ElementName = "artist")]
    public class ArtistEntity
    {
        [XmlArray("images")] 
        [XmlArrayItem("image")]
        public ArtistImageEntity[] Images;

        [XmlElement("id")] 
        public int Id;

        [XmlElement("name")] 
        public string Name;

        [XmlElement("realname")] 
        public string RealName;

        [XmlElement("data_quality")] 
        public string DataQuality;

        [XmlArray("urls")] 
        [XmlArrayItem("url")]
        public ArtistUrlEntity[] Urls;

        [XmlArray("namevariations")] 
        [XmlArrayItem("name")]
        public ArtistNameVariationEntity[] NameVariations;

        [XmlArray("aliases")] 
        [XmlArrayItem("name")]
        public ArtistAliasEntity[] Aliases;
    }

    public class ArtistAliasEntity
    {
        [XmlAttribute(AttributeName = "id", DataType = "int")]
        public int Id;

        [XmlText] 
        public string Name;
    }

    public class ArtistNameVariationEntity
    {
        [XmlText] 
        public string NameVariation;
    }

    public class ArtistUrlEntity
    {
        [XmlText] 
        public string Url;
    }

    public class ArtistImageEntity
    {
        [XmlAttribute(AttributeName = "height", DataType = "int")]
        public int Height;

        [XmlAttribute(AttributeName = "type", DataType = "string")]
        public string Type;

        [XmlAttribute(AttributeName = "uri", DataType = "string")]
        public string Uri;

        [XmlAttribute(AttributeName = "uri150", DataType = "string")]
        public string Uri150;

        [XmlAttribute(AttributeName = "width", DataType = "int")]
        public int Width;
    }
}