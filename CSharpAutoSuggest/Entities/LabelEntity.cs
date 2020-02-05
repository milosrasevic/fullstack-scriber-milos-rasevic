using System.Xml.Serialization;
using Newtonsoft.Json;

namespace CSharpAutoSuggest.Entities
{
    public class LabelList
    {
        [JsonProperty("labels")] 
        public LabelEntity[] Labels; 
    }
    
    
    [XmlRoot(ElementName = "label")]
    public class LabelEntity
    {
        [XmlArray("images")] 
        [XmlArrayItem("image")]
        public Image[] Images;

        [XmlElement("id")] 
        public int Id;

        [XmlElement("name")] 
        public string Name;

        [XmlElement("contactinfo")] 
        public string ContactInfo;

        [XmlElement("profile")] 
        public string Profile;

        [XmlElement("data_quality")] 
        public string DataQuality;

        [XmlArray("urls")] 
        [XmlArrayItem("url")]
        public UrlItem[] Urls;

        [XmlArray("sublabels")] [XmlArrayItem("label")]
        public SubLabel[] SubLabels;
    }

    public class SubLabel
    {
        [XmlAttribute(AttributeName = "id", DataType = "string")]
        public string Id;

        [XmlText] 
        public string Value;
    }


    public class UrlItem
    {
        [XmlText] 
        public string Value;
    }
    

    
    public class Image
    {
        [XmlAttribute(AttributeName = "height", DataType = "int")]
        public int Height;

        [XmlAttribute(AttributeName = "type", DataType = "string")]
        public string ImageType;

        [XmlAttribute(AttributeName = "uri", DataType = "string")]
        public string Uri;

        [XmlAttribute(AttributeName = "width", DataType = "int")]
        public int Width;
    }
}