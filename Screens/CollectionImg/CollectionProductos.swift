//
//  CollectionProductos.swift
//  exampleCatalogo
//
//  Created by Carlos Hernandez on 03/04/22.
//

import UIKit

class CollectionProductos: UICollectionViewCell {
    @IBOutlet weak var imgProducto: UIImageView!
    
    @IBOutlet weak var lblprueb: UILabel!
    static let identificador = "Identificador_Item_Menu"
    static func nib() -> UINib{return UINib(nibName: "item_tarjetas", bundle: nil)}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func Configura_Tarjeta(tarjetas: String)
    {
        lblprueb.text = tarjetas
    }

}
