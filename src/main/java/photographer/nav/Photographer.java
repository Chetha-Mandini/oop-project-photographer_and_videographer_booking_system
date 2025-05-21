package photographer.nav;

import java.io.Serializable;

//c
public class Photographer implements Serializable {
    private int id;
    private String name;
    private String specialty;
    private String email;
    private String phone;
    private double rating;
    private double hourlyRate;
    private String experience;

    public Photographer() {
    }

    public Photographer(int id, String name, String specialty, String email,
                        String phone, double rating, double hourlyRate, String experience) {
        this.id = id;
        this.name = name;
        this.specialty = specialty;
        this.email = email;
        this.phone = phone;
        this.rating = rating;
        this.hourlyRate = hourlyRate;
        this.experience = experience;
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
        this.name = name;
    }

    public String getSpecialty() {
        return specialty;
    }

    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public double getHourlyRate() {
        return hourlyRate;
    }

    public void setHourlyRate(double hourlyRate) {
        this.hourlyRate = hourlyRate;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    @Override
    public String toString() {
        return id + "," + name + "," + specialty + "," + email + "," + phone + "," +
                rating + "," + hourlyRate + "," + experience;
    }
}