//
//  LoginModel.swift
//  KREAM
//
//  Created by 오현민 on 9/23/24.
//

import Foundation

class LoginModel {
    private let userDefaults = UserDefaults.standard
    private let emailKey: String = "email"
    private let pwdKey: String = "pwd"
    private let nameKey: String = "name"
    
    public func saveUserEmail(_ email: String) {
        userDefaults.set(email, forKey: emailKey)
    }
    
    public func saveUserPwd(_ pwd: String) {
        userDefaults.set(pwd, forKey: pwdKey)
    }
    
    public func saveUserName(_ name: String) {
        userDefaults.set(name, forKey: nameKey)
    }

    public func loadUserEmail() -> String? {
        return userDefaults.string(forKey: emailKey)
    }

    public func loadUserPwd() -> String? {
        return userDefaults.string(forKey: pwdKey)
    }

    public func loadUserName() -> String? {
        return userDefaults.string(forKey: nameKey)
    }
}

