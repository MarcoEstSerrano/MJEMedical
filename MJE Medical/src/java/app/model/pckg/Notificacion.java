package app.model.pckg;

public class Notificacion {

    private int id;
    private int userId;
    private int destinoId;
    private String titulo;
    private String descripcion;
    private String fecha;

    public Notificacion(int id, int userId, int destinoId, String titulo, String descripcion, String fecha) {
        this.id = id;
        this.userId = userId;
        this.destinoId = destinoId;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.fecha = fecha;
    }

    public Notificacion(int userId, int destinoId, String titulo, String descripcion, String fecha) {
        this.userId = userId;
        this.destinoId = destinoId;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.fecha = fecha;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getDestinoId() {
        return destinoId;
    }

    public void setDestinoId(int destinoId) {
        this.destinoId = destinoId;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
    
}
