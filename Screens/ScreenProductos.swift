//
//  ScreenProductos.swift
//  exampleCatalogo
//
//  Created by Carlos Hernandez on 02/04/22.
//

import UIKit
protocol EnviarDatos
{
    func enviarproducto(producto: [Any]?)
}

class ScreenProductos: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var delegateDatos:EnviarDatos?
    var otrosdatos = [Any]()
    
    
    @IBOutlet weak var TableListProductos: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableListProductos.delegate = self
        TableListProductos.dataSource = self
        TableListProductos.register(CellProducto.nib(), forCellReuseIdentifier: CellProducto.identificador)
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        llenadoLista()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return otrosdatos.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indice = indexPath.row
        var celda_productos = tableView.dequeueReusableCell(withIdentifier:
            CellProducto.identificador, for: indexPath) as! CellProducto
        celda_productos.configurar_celda(Datos: otrosdatos[indice] as! [Any])
        return celda_productos
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let index = indexPath.row
        delegateDatos?.enviarproducto(producto: otrosdatos[index]  as! [Any])
        self.navigationController?.popViewController(animated: true)
    }
    

    func llenadoLista()
    {
        let ServicioWeb = productosServices()
        ServicioWeb.WebServicesProductos(){
            ( exito ) in
            DispatchQueue.main.async {
                var cont = 1
                var total = exito[0]?.resultado?.productos?.count
                for item in 0 ..< (exito[0]?.resultado?.productos!.count)!
                {
                    //print("nombre: \(item+1)",exito[0]?.resultado?.productos![item].nombre )
                    self.otrosdatos.append([cont,exito[0]?.resultado?.categoria,exito[0]?.resultado?.productos![item].nombre,exito[0]?.resultado?.productos![item].abonosSemanales![0].precio,exito[0]?.resultado?.productos![item].urlImagenes])
                    cont = cont + 1
                }
                self.TableListProductos.reloadData()
                
            }
        }fallo: { fallo in
            print(fallo)
        }
    }
    
}
