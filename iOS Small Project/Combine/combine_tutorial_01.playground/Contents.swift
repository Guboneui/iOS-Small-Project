import UIKit
import Combine

//var myIntArrayPublisher: Publishers.Sequence<[Int], Never> = [1, 2, 3].publisher
//myIntArrayPublisher.sink(receiveCompletion: { completion in
//    switch completion {
//    case .finished:
//        print("완료")
//    case .failure(let error):
//        print("에러 발생: \(error)")
//    }
//}, receiveValue: { receivedValue in
//    print("받은 값: \(receivedValue)")
//
//})

var mySubcription: AnyCancellable?
var mySubcriptionSet = Set<AnyCancellable>()
var myNotification = Notification.Name("com.boni.iOS-Small-Project")
var myDefaultPublisher = NotificationCenter.default.publisher(for: myNotification)

mySubcription = myDefaultPublisher.sink(receiveCompletion: { completion in
    switch completion {
    case .finished:
        print("완료")
    case .failure(let error):
        print("에러: \(error.localizedDescription)")
    }
    
}, receiveValue: { receivedValue in
    print("받은 값: \(receivedValue)")
})

mySubcription?.store(in: &mySubcriptionSet)

NotificationCenter.default.post(Notification(name: myNotification))
//mySubcription?.cancel()

// KVO - key value observing

class MyFriend {
    var name = "보니" {
        didSet {
            print("name: didset() : \(name)")
        }
    }
}

var myK = MyFriend()
var k: AnyCancellable = ["aaa"].publisher.assign(to: \.name, on: myK)
