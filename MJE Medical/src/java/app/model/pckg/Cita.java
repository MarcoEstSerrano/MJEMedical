package app.model.pckg;

public class Cita {

    private int id;
    private int doctorId;
    private int userId;
    private int estado;
    private String motivo;
    private String fecha;
    private String ubicacion;
    private String hora;
    private String especialidad;

    public Cita(int id, int doctorId, int userId, int estado, String motivo, String fecha, String ubicacion, String hora, String especialidad) {
        this.id = id;
        this.doctorId = doctorId;
        this.userId = userId;
        this.estado = estado;
        this.motivo = motivo;
        this.fecha = fecha;
        this.ubicacion = ubicacion;
        this.hora = hora;
        this.especialidad = especialidad;
    }

    public Cita(int doctorId, int userId, int estado, String motivo, String fecha, String ubicacion, String hora, String especialidad) {
        this.doctorId = doctorId;
        this.userId = userId;
        this.estado = estado;
        this.motivo = motivo;
        this.fecha = fecha;
        this.ubicacion = ubicacion;
        this.hora = hora;
        this.especialidad = especialidad;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(int doctorId) {
        this.doctorId = doctorId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getUbicacion() {
        return ubicacion;
    }

    public void setUbicacion(String ubicacion) {
        this.ubicacion = ubicacion;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    
}
