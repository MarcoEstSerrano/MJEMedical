package app.dataBase.pckg;

import app.model.pckg.Event;
import app.model.pckg.Notificacion;
import app.model.pckg.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DbHelper {

    Connection conn;

    public DbHelper() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/MJEMedical", "root", "Admin$1234");
            if (conn == null) {
                throw new SQLException("No se pudo establecer la conexión con la base de datos.");
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DbHelper.class.getName()).log(Level.SEVERE, "Error: Driver de MySQL no encontrado.", ex);
            throw new SQLException("Error al cargar el driver MySQL.", ex);

        } catch (SQLException ex) {
            Logger.getLogger(DbHelper.class.getName()).log(Level.SEVERE, "Error al conectar con la base de datos.", ex);
            throw ex;
        }
    }

    public void close() {
        try {
            conn.close();
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
    }

    public boolean validateLoginUsers(String email, String pswd) throws SQLException {
        PreparedStatement preState1 = conn.prepareStatement("SELECT * FROM usuarios WHERE email= ? AND pwd= ? AND user_status = 1;");
        preState1.setString(1, email);
        preState1.setString(2, pswd);
        ResultSet resultset = preState1.executeQuery();

        return (resultset.next()) ? true : false;
    }

    public boolean validateLoginMedicos(String email, String pswd) throws SQLException {
        PreparedStatement preState1 = conn.prepareStatement("SELECT * FROM medicos WHERE email= ? AND psw= ?;");
        preState1.setString(1, email);
        preState1.setString(2, pswd);
        ResultSet resultset = preState1.executeQuery();

        return (resultset.next()) ? true : false;
    }

    public String validateLogin(String email, String pswd) throws SQLException {
        DbHelper bd = new DbHelper();
        try {

            if (bd.validateLoginUsers(email, pswd)) {
                return "Usuario";
            } else if (bd.validateLoginMedicos(email, pswd)) {
                return "Medico";
            } else {
                return "null";
            }

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return "null";
    }

    public boolean saveUser(User user) throws SQLException {
        if (conn == null) {
            Logger.getLogger(DbHelper.class.getName()).log(Level.SEVERE, "Error: La conexión a la base de datos es NULL.");
            return false;
        }

        try {
            //otra forma
            PreparedStatement predStatement
                    = conn.prepareStatement(
                            "INSERT INTO usuarios (user_name, email, pwd, user_status) VALUES (?, ?, ?, ?)");

            predStatement.setString(1, user.getUser_name());
            predStatement.setString(2, user.getPwd());
            predStatement.setString(3, user.getEmail());
            predStatement.setInt(4, user.getUser_status());

            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            Logger.getLogger(DbHelper.class.getName()).log(Level.SEVERE, "Error al guardar el usuario.", ex);
            return false;
        }
    }

    public boolean saveEvent(Event event) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("INSERT INTO gestion (e_userId, e_name, e_description, e_date, e_photo, e_ubication, e_tickets)"
                            + "VALUES (?, ?, ?, ?, ?, ?, ?)");

            predStatement.setInt(1, event.getUser_id());
            predStatement.setString(2, event.getName());
            predStatement.setString(3, event.getDescription());
            predStatement.setString(4, event.getDate());
            predStatement.setString(5, event.getPhoto());
            predStatement.setString(6, event.getUbication());
            predStatement.setInt(7, event.getTicketsAvailable());

            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

    public ResultSet getUsers() throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM Users;");
            ResultSet resultset = predStatement.executeQuery();
            return resultset;
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public int getUserId(String email) throws SQLException {
        int userId = 0;
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT id FROM usuarios WHERE email= ?;");
            predStatement.setString(1, email);
            ResultSet resultset = predStatement.executeQuery();
            userId = resultset.getInt("id");
            return userId;
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return userId;
    }

    public ResultSet getEvents() throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM gestion;");
            ResultSet resultset = predStatement.executeQuery();
            return resultset;
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public ResultSet getEvent(int eventId) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM paseos INNER JOIN usuarios ON paseos.e_userId = usuarios.id WHERE gestion.e_id = ?;");
            predStatement.setInt(1, eventId);
            return predStatement.executeQuery();
        } catch (SQLException ex) {
            Logger.getLogger(DbHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean updatePaseo(int paseoId, Event event) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("UPDATE gestion SET e_name = ?, e_description = ?, e_date = ?, e_ubication = ?, e_tickets = ? WHERE e_id = ?;");

            predStatement.setString(1, event.getName());
            predStatement.setString(2, event.getDescription());
            predStatement.setString(3, event.getDate());
            predStatement.setString(4, event.getUbication());
            predStatement.setInt(5, event.getTicketsAvailable());
            predStatement.setInt(6, paseoId);

            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

    public boolean deleteEvent(int eventId, int user_id) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("DELETE FROM paseos WHERE e_id = ? AND e_userId = ?;");

            predStatement.setInt(1, eventId);
            predStatement.setInt(2, user_id);

            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

    public void saveNotification(Notificacion note) throws SQLException {
        try {

            PreparedStatement predStatement
                    = conn.prepareStatement("INSERT INTO notificaciones (userId, destinoId, titulo, descripcion, fecha, estado, espacioId) VALUES (?, ?, ?, ?, ?, ?, ?);");

            String today = LocalDateTime.now().toString();

            predStatement.setInt(1, note.getUserId());
            predStatement.setInt(2, note.getDestinoId());
            predStatement.setString(3, note.getTitulo());
            predStatement.setString(4, note.getDescripcion());
            predStatement.setString(5, note.getFecha());
            predStatement.setInt(6, note.getEstado());
            predStatement.setInt(7, note.getEspacioId());
            predStatement.executeUpdate();
        } catch (SQLException ex) {
        }

    }

    public boolean reservarPaseo(int paseoId, int userId, int r_tickets) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("INSERT INTO reservas(event_id, user_id, r_tickets) VALUES (?, ?, ?);");

            predStatement.setInt(1, paseoId);
            predStatement.setInt(2, userId);
            predStatement.setInt(3, r_tickets);

            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

    public boolean actualizarTickets(int eventId, int newTickets) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("UPDATE paseos SET e_tickets = ? WHERE e_id = ?;");

            predStatement.setInt(1, newTickets);
            predStatement.setInt(2, eventId);
            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

    public ResultSet getTable(String table) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM ?;");
            predStatement.setString(1, table);
            return predStatement.executeQuery();

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public ResultSet getTable(String table, String column, int id) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM ? WHERE ?= ?;");
            predStatement.setString(1, table);
            predStatement.setString(2, column);
            predStatement.setInt(3, id);
            return predStatement.executeQuery();

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public ResultSet getReserves(int userId) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM reservas INNER JOIN paseos ON reservas.event_id = paseos.e_id WHERE reservas.user_id = ?;");
            predStatement.setInt(1, userId);

            return predStatement.executeQuery();

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public ResultSet getReserv(int reservId) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM reservas WHERE reserv_id = ?;");
            predStatement.setInt(1, reservId);

            return predStatement.executeQuery();

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public ResultSet getReservFullInfo(int reservId) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM reservas INNER JOIN gestion ON reservas.event_id = gestion.e_id WHERE reservas.reserv_id = ?;");
            predStatement.setInt(1, reservId);

            return predStatement.executeQuery();

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public boolean cancelarReserva(int reservId) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("Delete from reservas WHERE reserv_id = ?;");

            predStatement.setInt(1, reservId);
            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

    public boolean actualizarReserva(int reservId, int newTickets) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("UPDATE reservas SET r_tickets = ? WHERE reserv_id = ?;");

            predStatement.setInt(1, newTickets);
            predStatement.setInt(2, reservId);
            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

    public ResultSet getNotificaciones(int id) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM notificaciones WHERE destinoId = ? AND estado = ?;");
            predStatement.setInt(1, id);
            predStatement.setInt(2, 1);
            ResultSet resultset = predStatement.executeQuery();
            return resultset;
        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public boolean actualizarEstadoNotificacion(int notiId) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("UPDATE notificaciones SET estado = ? WHERE id = ?;");

            predStatement.setInt(1, 0);
            predStatement.setInt(2, notiId);
            predStatement.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

    public ResultSet getUser(String email, String pwd) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM usuarios WHERE email = ? AND pwd = ?;");
            predStatement.setString(1, email);
            predStatement.setString(2, pwd);

            return predStatement.executeQuery();

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public ResultSet getMedic(String email, String pwd) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM medicos WHERE email = ? AND psw = ?;");
            predStatement.setString(1, email);
            predStatement.setString(2, pwd);

            return predStatement.executeQuery();

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public ResultSet getMedic(int medicId) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM medicos WHERE id = ?;");
            predStatement.setInt(1, medicId);
            return predStatement.executeQuery();

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public int programarcita(int medicId, String fecha, String especialidad, int citaId) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("INSERT INTO espaciosDisponibles(doctorId, fecha, especialidad, estado, citaId) VALUES (?, ?, ?, ?, ?);");

            predStatement.setInt(1, medicId);
            predStatement.setString(2, fecha);
            predStatement.setString(3, especialidad);
            predStatement.setInt(4, 1);
            predStatement.setInt(5, citaId);

            predStatement.executeUpdate();
            PreparedStatement predStatement2
                    = conn.prepareStatement("SELECT id from espaciosDisponibles where fecha = ?;");
            predStatement2.setString(1, fecha);
            ResultSet rs = predStatement2.executeQuery();

            int id = 0;

            while (rs.next()) {
                id = rs.getInt("id");
            }

            return id;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return 0;
        }
    }

    public ResultSet getespacio(int id) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM espaciosDisponibles WHERE id = ?;");
            predStatement.setInt(1, id);

            return predStatement.executeQuery();

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public boolean cancelarCita(int espacioId) throws SQLException {
        try {
            PreparedStatement predStatement1
                    = conn.prepareStatement("SELECT * from espaciosDisponibles WHERE id = ?;");
            predStatement1.setInt(1, espacioId);

            ResultSet rs = predStatement1.executeQuery();

            while (rs.next()) {

                if (rs.getInt("citaId") > 0) {
                    PreparedStatement predStatement2
                            = conn.prepareStatement("Delete from citas WHERE id = ?;");

                    predStatement2.setInt(1, rs.getInt("citaId"));
                    predStatement2.executeUpdate();
                }
            }

            PreparedStatement predStatement3
                    = conn.prepareStatement("Delete from espaciosDisponibles WHERE id = ?;");

            predStatement3.setInt(1, espacioId);
            predStatement3.executeUpdate();

            return true;

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
            return false;
        }
    }

    public ResultSet getEspaciosDisponibles(String especialidad) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM espaciosDisponibles WHERE especialidad = ? AND estado = ?;");
            predStatement.setString(1, especialidad);
            predStatement.setInt(2, 1);

            return predStatement.executeQuery();

        } catch (SQLException ex) {
            //Logger.getLogger(databaseHelper.class.getName()).log(Level.ERROR, null, ex);
        }
        return null;
    }

    public ResultSet getEspaciosDisponibles(int espacioId) throws SQLException {
        try {
            PreparedStatement predStatement = conn.prepareStatement("SELECT * FROM espaciosDisponibles WHERE id = ?;");
            predStatement.setInt(1, espacioId);

            return predStatement.executeQuery();

        } catch (SQLException ex) {

        }
        return null;
    }

    public boolean aceptarCita(int userId, ResultSet rsEspacioElegido, String motivo) throws SQLException {
        try {
            PreparedStatement predStatement
                    = conn.prepareStatement("INSERT INTO citas(doctorId, userId, motivo, fechaHora, especialidad, estado, espacioId) VALUES (?, ?, ?, ?, ?, ?, ?);");

            int doctorId = 0;
            int espacioId = 0;
            String fechaHora = "";
            String especialidad = "";
            int citaId = 0;

            while (rsEspacioElegido.next()) {
                doctorId = rsEspacioElegido.getInt("doctorId");
                espacioId = rsEspacioElegido.getInt("id");
                fechaHora = rsEspacioElegido.getString("fecha");
                especialidad = rsEspacioElegido.getString("especialidad");
            }
            predStatement.setInt(1, doctorId);
            predStatement.setInt(2, userId);
            predStatement.setString(3, motivo);
            predStatement.setString(4, fechaHora);
            predStatement.setString(5, especialidad);
            predStatement.setInt(6, 1);
            predStatement.setInt(7, espacioId);

            predStatement.executeUpdate();
            //-----------------------------------------------------------------------------------------
            PreparedStatement predStatement2 = conn.prepareStatement("SELECT id FROM citas WHERE fechaHora = ?;");
            predStatement2.setString(1, fechaHora);
            ResultSet cita = predStatement2.executeQuery();
            while (cita.next()) {
                citaId = cita.getInt("id");
            }
            //-----------------------------------------------------------------------------------------
            PreparedStatement predStatement3
                    = conn.prepareStatement("UPDATE espaciosDisponibles SET estado = ? WHERE id = ?;");

            predStatement3.setInt(1, 0);
            predStatement3.setInt(2, espacioId);
            predStatement3.executeUpdate();
            //-------------------------------------------------------------------------------------------
            if (citaId > 0) {
                PreparedStatement predStatement4
                        = conn.prepareStatement("UPDATE espaciosDisponibles SET citaId = ? WHERE id = ?;");

                predStatement4.setInt(1, citaId);
                predStatement4.setInt(2, espacioId);
                predStatement4.executeUpdate();
            }

            return true;

        } catch (SQLException ex) {
            return false;
        }
    }
}
