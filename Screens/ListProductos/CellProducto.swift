//
//  CellProducto.swift
//  exampleCatalogo
//
//  Created by Carlos Hernandez on 02/04/22.
//

import UIKit

class CellProducto: UITableViewCell {
    
    @IBOutlet weak var lblNombreProducto: UILabel!
    
    static let identificador = "Identificador_Celda_Producto"
    
    static func nib() -> UINib
    {
        return UINib(nibName: "CellProducto", bundle: nil)
    }
    
    var id = -1

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    func configurar_celda(Datos : [Any])
    {
        id = Datos[0] as! Int
        lblNombreProducto.text = Datos[2] as! String
    
    }
    
    func regresa_id() -> Int
    {
        return id
    }
    
}
