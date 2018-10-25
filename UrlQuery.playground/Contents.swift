import UIKit

let newURL = URL(string: "http://some-website.com/documents/127/?referrer=147&mode=open==adasd&jiyun=tiancai")!

extension URL {
    subscript(queryParam:String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParam })?.value
    }
}

let referrer = newURL["referrer"]  // "147"
let mode     = newURL["mode"]      // "open"

let jiyun     = newURL["jiyun"]      // "open"


