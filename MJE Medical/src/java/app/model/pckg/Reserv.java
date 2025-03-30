
package app.model.pckg;


public class Reserv {
    
    private String name;
    private String photo;
    private String date;
    private int reservId;
    private int eventId;
    private int userId;
    private int reservedTickets;

    public Reserv(String name, String photo, String date, int reservId, int eventId, int userId, int reservedTickets) {
        this.name = name;
        this.photo = photo;
        this.date = date;
        this.reservId = reservId;
        this.eventId = eventId;
        this.userId = userId;
        this.reservedTickets = reservedTickets;
    }

    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoto() {
        return photo;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public int getReservId() {
        return reservId;
    }

    public void setReservId(int reservId) {
        this.reservId = reservId;
    }

    public int getEventId() {
        return eventId;
    }

    public void setEventId(int eventId) {
        this.eventId = eventId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getReservedTickets() {
        return reservedTickets;
    }

    public void setReservedTickets(int reservedTickets) {
        this.reservedTickets = reservedTickets;
    }
    
    
}
