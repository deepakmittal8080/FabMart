
package com.mycompany.ecomproj.model;

public class Category {

        private int id;
        String name;
        String description;

    public Category() {
    }
   
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        
        return name;
    }

    public void setName(String name) {
                this.name = name==null ? null : name.trim().toLowerCase();
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Category{" + "id=" + id + ", name=" + name + ", description=" + description + '}';
    }
    
}
