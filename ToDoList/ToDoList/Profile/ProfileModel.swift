//
//  ProfileModel.swift
//  ToDoList
//
//  Created by Mahmoud Alaa on 19/12/2025.
//

import Foundation

// MARK: - Profile Model
struct ProfileModel {
    var fullName: String
    var email: String
    var phoneNumber: String
    var profileImageName: String
    var qrCodeUrl: String?
    
    init(
        fullName: String = "",
        email: String = "",
        phoneNumber: String = "",
        profileImageName: String = "ProfilePicture2",
        qrCodeUrl: String? = nil
    ) {
        self.fullName = fullName
        self.email = email
        self.phoneNumber = phoneNumber
        self.profileImageName = profileImageName
        self.qrCodeUrl = qrCodeUrl
    }
}
