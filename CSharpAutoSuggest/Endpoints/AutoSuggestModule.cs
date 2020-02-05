using System;
using System.ComponentModel;
using System.Runtime.InteropServices;
using Sid.WebServices;
using Sid.Declarations;

namespace CSharpAutoSuggest.Endpoints
{
    [RootPath("autosuggest")]
    public class AutoSuggestModule: SidModule
    {
        AutoSuggestService svc = new AutoSuggestService();
        
        [Get("sanity")]
        SimpleResponse GetSanity()
        {
            return svc.GetSanity();
        }

        [Get("")]
        AutoSuggestResponse GetAutoSuggest([Query] string prefix)
        {
            return svc.GetAutoSuggest(prefix);
        }
    }
}