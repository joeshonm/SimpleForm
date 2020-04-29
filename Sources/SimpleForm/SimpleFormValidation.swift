//
//  SimpleFormValidation.swift
//  
//
//  Created by JoeShon Monroe on 4/29/20.
//

import Foundation

public struct SimpleFormValidation {
    public func validateEmail(value:Any) -> Bool {
        let range = NSRange(location: 0, length: (value as! String).utf16.count)
        let regex = try! NSRegularExpression(pattern: #"[a-z0-9]+([-+._][a-z0-9]+){0,2}@.*?(\.(a(?:[cdefgilmnoqrstuwxz]|ero|(?:rp|si)a)|b(?:[abdefghijmnorstvwyz]iz)|c(?:[acdfghiklmnoruvxyz]|at|o(?:m|op))|d[ejkmoz]|e(?:[ceghrstu]|du)|f[ijkmor]|g(?:[abdefghilmnpqrstuwy]|ov)|h[kmnrtu]|i(?:[delmnoqrst]|n(?:fo|t))|j(?:[emop]|obs)|k[eghimnprwyz]|l[abcikrstuvy]|m(?:[acdeghklmnopqrstuvwxyz]|il|obi|useum)|n(?:[acefgilopruz]|ame|et)|o(?:m|rg)|p(?:[aefghklmnrstwy]|ro)|qa|r[eosuw]|s[abcdeghijklmnortuvyz]|t(?:[cdfghjklmnoprtvwz]|(?:rav)?el)|u[agkmsyz]|v[aceginu]|w[fs]|y[etu]|z[amw])\b){1,2}"#)
        let validationResult = regex.firstMatch(in: (value as! String), options: [], range: range) != nil
        return validationResult
    }
    
    public func validateEmpty(value:Any) -> Bool {
        return (value as! String).isEmpty == true ? false : true
    }
    
    public func validateRegex(value:Any, regex:String) -> Bool {
        let range = NSRange(location: 0, length: (value as! String).utf16.count)
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let validationResult = regex.firstMatch(in: (value as! String), options: [], range: range) != nil
            return validationResult
        } catch {
            return false
        }
        
        
    }
}
