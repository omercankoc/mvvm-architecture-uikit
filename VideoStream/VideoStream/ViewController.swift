import UIKit
import SwiftSocket

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let client = TCPClient(address: "172.24.1.1", port: 8080)
        switch client.connect(timeout: 1) {
          case .success:
            switch client.send(string: "Hello!" ) {
              case .success:
                guard let data = client.read(1024*10) else { return }

                if let response = String(bytes: data, encoding: .utf8) {
                  print(response)
                }
              case .failure(let error):
                print(error)
            }
          case .failure(let error):
            print(error)
        }
        
    }


}

