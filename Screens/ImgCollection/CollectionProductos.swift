//
//  CollectionProductos.swift
//  exampleCatalogo
//
//  Created by Carlos Hernandez on 03/04/22.
//

import UIKit

class CollectionProductos: UICollectionViewCell {
    
    @IBOutlet weak var imgProducto: UIImageView!
    
    static let identificador = "Identificador_Item_Menu"
    static func nib() -> UINib{return UINib(nibName: "CollectionProductos", bundle: nil)}

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func Configura_Tarjeta(categorias: String)
    {
            let url = URL(string: categorias)!

                // Fetch Image Data
                if let data = try? Data(contentsOf: url) {
                    // Create Image and Update Image View
                    imgProducto.image = UIImage(data: data)
                
        }
        
    }

}
