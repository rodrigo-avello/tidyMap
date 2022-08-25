#' arrumar_origem
#'
#' Recebe os caminhos (paths) dos arquivos no dir como parâmetro e
#' retorna uma string arrumada com a origem dos arquivos.
#'
#' @param x lista de string.
#'
#' @export

# Define função para indicar no arquivo final a origem de cada informação:
arrumar_origem = function(paths) {

  pos1 =  paths |> stringr::str_to_upper() |>
    stringi::stri_locate(regex = "MAPEAMENTO")

  pos2 = paths |> stringi::stri_locate(regex = ".xlsx")

  origin = paths |>
    stringr::str_sub({
      pos1[2] + 2
    }, {
      pos2[1] - 1
    })

  return(origin)

}
