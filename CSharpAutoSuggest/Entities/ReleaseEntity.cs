using System.Xml.Serialization;
using Newtonsoft.Json;

namespace CSharpAutoSuggest.Entities
{
    public class ReleasesList
    {
        [JsonProperty("releases")] 
        public ReleaseEntity[] Releases;
    }
    
    [XmlRoot(ElementName = "release")]
    public class ReleaseEntity
    {
        [XmlAttribute(AttributeName = "id", DataType = "string")]
        public string Id;

        [XmlAttribute(AttributeName = "status", DataType = "string")]
        public string Status;
        
        [XmlArray("images")] 
        [XmlArrayItem("image")]
        public Image[] Images;

        [XmlArray("artists")] 
        [XmlArrayItem("artist")]
        public ReleaseArtistEntity[] Artists;

        [XmlElement("title")] 
        public string Title;

        [XmlArray("labels")] 
        [XmlArrayItem("label")]
        public ReleaseLabelEntity[] Labels;

        [XmlArray("extraartists")] 
        [XmlArrayItem("artist")]
        public ReleaseArtistEntity[] ExtraArtists;

        [XmlArray("formats")] 
        [XmlArrayItem("format")]
        public ReleaseFormatEntity[] Formats;

        [XmlArray("genres")] 
        [XmlArrayItem("genre")]
        public ReleaseGenreEntity[] Genres;

        [XmlArray("styles")] 
        [XmlArrayItem("style")]
        public StyleGenreEntity[] Styles;

        [XmlElement("country")] 
        public string Country;

        [XmlElement("released")] 
        public string Released;

        [XmlElement("notes")] 
        public string Notes;

        [XmlElement("data_quality")] 
        public string DataQuality;

        [XmlElement("master_id")] 
        public ReleaseMasterIdEntity MasterId;

        [XmlArray("tracklist")] 
        [XmlArrayItem("track")]
        public ReleaseTrackEntity[] TrackList;

        [XmlArray("identifiers")] 
        [XmlArrayItem("identifier")]
        public ReleaseIdentifierEntity[] Identifiers;

        [XmlArray("videos")] 
        [XmlArrayItem("video")]
        public ReleaseVideoEntry[] Videos;

        [XmlArray("companies")] 
        [XmlArrayItem("company")]
        public ReleaseCompanyEntity[] Companies;
    }

    public class ReleaseCompanyEntity
    {
        [XmlElement("id")] 
        public int Id;

        [XmlElement("name")] 
        public string Name;

        [XmlElement("entity_type")] 
        public int EntityType;

        [XmlElement("entity_type_name")] 
        public string EntityTypeName;

        [XmlElement("resource_url")] 
        public string ResourceUrl;
    }

    public class ReleaseVideoEntry
    {
        [XmlAttribute(AttributeName = "duration", DataType = "int")]
        public int Duration;

        [XmlAttribute(AttributeName = "embed", DataType = "string")]
        public string Embed;

        [XmlAttribute(AttributeName = "src", DataType = "string")]
        public string Source;

        [XmlElement("title")] 
        public string Title;

        [XmlElement("description")] 
        public string Description;
    }

    public class ReleaseIdentifierEntity
    {
        [XmlAttribute(AttributeName = "description", DataType = "string")]
        public string Description;

        [XmlAttribute(AttributeName = "type", DataType = "string")]
        public string Type;

        [XmlAttribute(AttributeName = "value", DataType = "string")]
        public string Value;
    }

    public class ReleaseTrackEntity
    {
        [XmlElement("position")] 
        public string Position;

        [XmlElement("title")] 
        public string Title;

        [XmlElement("duration")] 
        public string Duration;
    }

    public class ReleaseMasterIdEntity
    {
        [XmlAttribute(AttributeName = "is_main_release", DataType = "string")]
        public string IsMainRelease;

        [XmlText] 
        public int Id;
    }

    public class ReleaseLabelEntity
    {
        [XmlAttribute(AttributeName = "catno", DataType = "string")]
        public string CatalogNumber;

        [XmlAttribute(AttributeName = "id", DataType = "string")]
        public string Id;

        [XmlAttribute(AttributeName = "name", DataType = "string")]
        public string Name;

        [XmlAttribute(AttributeName = "role", DataType = "string")]
        public string Role;
    }

    public class StyleGenreEntity
    {
        [XmlText] 
        public string Style;
    }

    public class ReleaseGenreEntity
    {
        [XmlText] 
        public string Genre;
    }

    public class FormatDescriptionEntity
    {
        [XmlText] 
        public string Description;
    }
    
    public class ReleaseFormatEntity
    {
        [XmlAttribute(AttributeName = "name", DataType = "string")]
        public string FormatName;

        [XmlAttribute(AttributeName = "qty", DataType = "string")]
        public string Quantity;

        [XmlAttribute(AttributeName = "text", DataType = "string")]
        public string Text;

        [XmlArray("descriptions")] 
        [XmlArrayItem("description")]
        public FormatDescriptionEntity[] Descriptions;
    }

    public class ReleaseArtistEntity
    {
        [XmlElement("id")] 
        public int Id;

        [XmlElement("name")] 
        public string Name;
        
        // There's other stuff here, <anv> and <join> and <role>, and <tracks>,  but it's all empty in the sample
        // I looked at, so don't know how to map it.
    }
}