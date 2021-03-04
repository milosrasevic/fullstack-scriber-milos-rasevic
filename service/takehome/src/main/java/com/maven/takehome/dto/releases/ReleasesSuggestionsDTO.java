package com.maven.takehome.dto.releases;

import java.util.ArrayList;

public class ReleasesSuggestionsDTO {

    private ArrayList<ReleasesSuggestionDTO> suggestions;

    public ReleasesSuggestionsDTO() {
    }

    public ReleasesSuggestionsDTO(ArrayList<ReleasesSuggestionDTO> suggestions) {
        this.suggestions = suggestions;
    }

    public ArrayList<ReleasesSuggestionDTO> getSuggestions() {
        return suggestions;
    }

    public void setSuggestions(ArrayList<ReleasesSuggestionDTO> suggestions) {
        this.suggestions = suggestions;
    }
}
