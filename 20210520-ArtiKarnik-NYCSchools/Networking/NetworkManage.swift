
import UIKit

class NetworkManager {
    
    func getSchoolList(completion: @escaping (Result<[NYSchool], Error>) -> Void) {
        guard let url = URL(string: "")else {
            return;
        }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
                return
            }
            do {
                let result = try! JSONDecoder().decode([NYSchool].self, from: data!)
                completion(.success(result))
            }
            catch let jsonError {
                completion(.failure(jsonError.localizedDescription as! Error))
            }
        }.resume()
    }
}


