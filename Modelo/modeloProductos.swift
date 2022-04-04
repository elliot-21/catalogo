//  Created by Carlos Hernandez on 31/03/22.

import Foundation

struct DataServicio: Codable
{
    //let codigo : String?
    //let mensaje : String?
    //let folio : String?
    //let advertencia : String?
    let resultado : DataResultado?
    
}

struct DataResultado: Codable
{
   // let paginacion : DataPaginacion?
    let categoria : String
    let productos : [DataProductos]?
}

struct DataPaginacion: Codable
{
    let pagina : Int
    let totalPaginas : Int
    let totalRegistros : Int
    let totalRegistrosPorPagina : Int
}


struct DataProductos: Codable
{
    //let id : String
    //let idLinea : Int
    //let codigoCategoria : String
    //let idModalidad : Int
    //let relevancia : Int
    //let lineaCredito : String
    //let pagoSemanalPrincipal : Int
    //let plazoPrincipal : Int
    //let disponibleCredito : Bool
    let abonosSemanales : [DataAbonos]?
    //let sku : String
    let nombre : String
    let urlImagenes : [String]
    //let precioRegular : Int
    //let precioFinal : Double?
    //let porcentajeDescuento : Double?
    //let descuento : Bool
    //let precioCredito : Double?
    //let montoDescuento : Double?
}

struct DataAbonos:  Codable
{
    // let plazo : Int
    //let montoAbono : Int
    //let montoDescuentoAbono : Int
    //let montoUltimoAbono : Int
    //let montoFinalCredito : Int
    //let idPromocion : Int
    //let montoDescuentoElektra : Int
    //let montoDescuentoBanco : Int
    let precio : Int
    //let montoAbonoDigital : Int
}



