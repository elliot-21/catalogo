//
//  ViewController.swift
//  exampleCatalogo
//
//  Created by Carlos Hernandez on 31/03/22.
//

import UIKit

class ViewController: UIViewController,EnviarDatos,UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet weak var ImagesCollection: UICollectionView!
    
    
    @IBOutlet weak var lblNombre: UILabel!
    @IBOutlet weak var lblPrecio: UILabel!
    @IBOutlet weak var lblCategoria: UILabel!
   
    
    
    var arrImg = [Any]()
    
    func enviarproducto(producto: [Any]?) {
        lblNombre.text = producto![2] as! String
        lblPrecio.text = "Precio: $ \(producto![3] as! Int)"
        lblCategoria.text = "Categoria: \(producto![1] as! String)"
        arrImg = producto![4] as! [Any]
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImg.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionProductos.identificador, for: indexPath) as! CollectionProductos
        celda.Configura_Tarjeta(categorias: "\(arrImg[indexPath.row])")
        return celda
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ImagesCollection.dataSource = self
        ImagesCollection.delegate = self
        ImagesCollection.register(CollectionProductos.nib(),
                                  forCellWithReuseIdentifier: CollectionProductos.identificador)
        ImagesCollection.reloadData()
    }
    

    @IBAction func btnServicio(_ sender: Any) {
        self.performSegue(withIdentifier: "ScreenProductos", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "ScreenProductos"
        {
            let Nueva_pantalla = segue.destination as! ScreenProductos
            Nueva_pantalla.delegateDatos = self
        }
    }
    
}

