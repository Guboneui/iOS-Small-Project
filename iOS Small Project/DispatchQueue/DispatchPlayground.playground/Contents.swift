import UIKit

//let queue = DispatchQueue(label: "testQueue")
//
//queue.async {
//    print("task 1 started")
//    print("tast 1 ended")
//}
//
//queue.async {
//    print("tast 2 started")
//    print("tast 2 ended")
//}

let queue = DispatchQueue(label: "testQueue", attributes: .concurrent)

//queue.async {
//    print("task 1 started")
//    print("tast 1 ended")
//}
//
//queue.async {
//    print("tast 2 started")
//    print("tast 2 ended")
//}


queue.sync {
    print("task 1 started")
    print("tast 1 ended")
}

queue.sync {
    print("tast 2 started")
    print("tast 2 ended")
}
