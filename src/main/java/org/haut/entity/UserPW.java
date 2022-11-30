package org.haut.entity;

import lombok.Data;

@Data
public class UserPW {

    private String uId;
    private String newPassword;
    private String oldPassword;

}
