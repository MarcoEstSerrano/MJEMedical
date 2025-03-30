package app.model.pckg;

public class Event {

    private int id;
    private int user_id;
    private String name;
    private String description;
    private String date;
    private String photo;
    private String ubication;
    private int ticketsAvailable;

    public Event() {
    }

    public Event(int id, int user_id, String name, String description, String date, String photo, String ubication, int ticketsAvailable) {
        this.id = id;
        this.user_id = user_id;
        this.name = name;
        this.description = description;
        this.date = date;
        this.photo = photo;
        this.ubication = ubication;
        this.ticketsAvailable = ticketsAvailable;
    }
    
    //Constructor que se utiliza en CreateEventLogic (el id se genera auto en la db)
    public Event(int user_id, String name, String description, String date, String photo, String ubication, int ticketsAvailable) {
        this.user_id = user_id;
        this.name = name;
        this.description = description;
        this.date = date;
        this.photo = photo;
        this.ubication = ubication;
        this.ticketsAvailable = ticketsAvailable;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }
  
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getUbication() {
        return ubication;
    }

    public void setUbication(String ubication) {
        this.ubication = ubication;
    }

    public int getTicketsAvailable() {
        return ticketsAvailable;
    }

    public void setTicketsAvailable(int ticketsAvailable) {
        this.ticketsAvailable = ticketsAvailable;
    } 
}
