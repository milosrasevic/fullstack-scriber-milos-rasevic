package com.maven.takehome.dto.artists;

import java.util.ArrayList;

public class ArtistsSuggestionsDTO {

    private ArrayList<ArtistsSuggestionDTO> suggestions;

    public ArtistsSuggestionsDTO() {
    }

    public ArtistsSuggestionsDTO(ArrayList<ArtistsSuggestionDTO> suggestions) {
        this.suggestions = suggestions;
    }

    public ArrayList<ArtistsSuggestionDTO> getSuggestions() {
        return suggestions;
    }

    public void setSuggestions(ArrayList<ArtistsSuggestionDTO> suggestions) {
        this.suggestions = suggestions;
    }
}
