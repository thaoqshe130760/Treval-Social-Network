
package model;

public class User {
    private String id;
    private boolean accountType;
    private String username;
    private String password;
    private String displayName;
    private String dob;
    private String hobbies;

    public User() {
    }

    public User(String id, boolean accountType, String username, String password, String displayName, String dob, String hobbies) {
        this.id = id;
        this.accountType = accountType;
        this.username = username;
        this.password = password;
        this.displayName = displayName;
        this.dob = dob;
        this.hobbies = hobbies;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public boolean isAccountType() {
        return accountType;
    }

    public void setAccountType(boolean accountType) {
        this.accountType = accountType;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getHobbies() {
        return hobbies;
    }

    public void setHobbies(String hobbies) {
        this.hobbies = hobbies;
    }

   

    
    @Override
    public String toString() {
        return "User{" + "id=" + id + ", accountType=" + accountType + ", username=" + username + ", password=" + password + ", displayName=" + displayName + ", dob=" + dob + ", hobbies=" + hobbies + '}';
    }
    
    
}
