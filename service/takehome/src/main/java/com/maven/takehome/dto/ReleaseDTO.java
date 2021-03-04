package com.maven.takehome.dto;

public class ReleaseDTO {

    private Integer id;
    private String title;
    private String notes;

    public ReleaseDTO() {
    }

    public ReleaseDTO(Integer id, String title, String notes) {
        this.id = id;
        this.title = title;
        this.notes = notes;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }
}
