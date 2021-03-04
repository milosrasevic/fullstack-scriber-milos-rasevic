package com.maven.takehome.dto.artists;

import com.maven.takehome.dto.ReleaseDTO;

import java.util.ArrayList;

public class ArtistsSuggestionDTO {

    private Integer id;
    private String name;
    private ArrayList<ReleaseDTO> releases;

    public ArtistsSuggestionDTO() {
    }

    public ArtistsSuggestionDTO(Integer id, String name, ArrayList<ReleaseDTO> releases) {
        this.id = id;
        this.name = name;
        this.releases = releases;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ArrayList<ReleaseDTO> getReleases() {
        return releases;
    }

    public void setReleases(ArrayList<ReleaseDTO> releases) {
        this.releases = releases;
    }
}
