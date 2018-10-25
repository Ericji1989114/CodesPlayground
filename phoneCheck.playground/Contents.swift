//: Playground - noun: a place where people can play

import UIKit

extension String {
    func getValidTelPhoneNumber() -> String? {
        let numberArr = self.components(separatedBy: CharacterSet.decimalDigits.inverted)
        print(numberArr)
        let number = numberArr.joined(separator: "")
        let pattern1 = "^0[5789]0[0-9]{8}"
        let pattern2 = "^81[5789]0[0-9]{8}"
        if NSPredicate(format: "SELF MATCHES %@", pattern1).evaluate(with: number) {
            return number
        } else if NSPredicate(format: "SELF MATCHES %@", pattern2).evaluate(with: number) {
            return (number as NSString).replacingCharacters(in: NSRange.init(location: 0, length: 2), with: "0")
        } else {
            return nil
        }
    }
}

let phone1 = "07040769206"
phone1.getValidTelPhoneNumber()

let phone2 = "070-4076-9206"
phone2.getValidTelPhoneNumber()

let phone3 = "0-7-0-4-0-7-6-9-2-0-6"
phone3.getValidTelPhoneNumber()

let phone4 = "070407-6-9-2-0-6"
phone4.getValidTelPhoneNumber()

let phone5 = "12345678910"
phone5.getValidTelPhoneNumber()

let phone6 = "070(4076)9206"
phone6.getValidTelPhoneNumber()

let phone7 = "+818096548920"
phone7.getValidTelPhoneNumber()


