package ca.on.conestogac.cta.entity;

public class LoginStatus {
    private String message;
    private String status;
    private String fullName;
    private String email;

    public void setMessage(String message) {
        this.message = message;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public String getStatus() {
        return status;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "LoginStatus{" +
                "message='" + message + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
