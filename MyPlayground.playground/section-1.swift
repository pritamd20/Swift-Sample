// Playground - noun: a place where people can play

import UIKit

var a = 5
var str = "Hello, playground  \(a)"


//let frame = NSRect(x: 0, y: 0, width: 300, height: 300)

var j = 2
var array = [1,2,3,5]
var b = array
b.unshare()

array[2] = 12

array
b

for i in 1..10 {
    
    array[i] = i
    
}



var url = NSURL(string:"WWW.GOOGLE.COM")

let f = array[1]

var web:UIWebView = UIWebView(frame: CGRectMake(10, 10, 100, 100))


 var request = NSURLRequest (URL: url)
web.loadRequest(request)








