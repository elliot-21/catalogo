//  Created by Carlos Hernandez on 31/03/22.
//

import Foundation

var arrDataServicio : DataServicio?



class productosServices{
    
    func WebServicesProductos (exito: @escaping (_ exito: [DataServicio?]) -> (),
                               fallo: @escaping (_ fallo: String) -> ()){
        let url = URL(string: server)
        var request = URLRequest(url: url!)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request)
        {
            (informacion, response, error) in
            if informacion == nil{
                print("Data vacia")
                fallo("Ocurrio un error")
            }else{
                do{
                   arrDataServicio = try JSONDecoder().decode(DataServicio.self
                                                                , from: informacion!)
                 
                   
                   
                    exito([arrDataServicio])
                }catch{
                    fallo("Error en la solicitud \(error)")
                }
            }
        }.resume()
    }
    
    
}
