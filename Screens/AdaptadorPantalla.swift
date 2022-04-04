//
//  AdaptadorPantalla.swift
//  exampleCatalogo
//
//  Created by Carlos Hernandez on 03/04/22.
//

import Foundation
import UIKit

class Adaptador_modals
{
   
    func Crear_Modal_Funcion(Accion_Confirmacion_completion: @escaping (_ Datos: [Any]) -> Void) -> modal_funcion
    {
        let storyboard = UIStoryboard(name: "modal_funcion", bundle: .main)
        
        let modal = storyboard.instantiateViewController(identifier: "identificador_modal_funcion") as! modal_funcion
        
        modal.Accion_Confirmacion = Accion_Confirmacion_completion
        
        return modal
    }
}

