#' ler_arquivos
#'
#' Recebe os caminhos (paths) dos arquivos no dir e o número de sheet como 
#' parâmetro e retorna uma tibble arrumada.
#'
#' @param x lista de string e uma constante.
#'
#' @export

# Define a função de leitura dos arquivos em .xlsx
ler_arquivos = 
  function(paths,n_sheet) {
    purrr::map(1:n_sheet,
               ~ readxl::read_xlsx(
                 paths, 
                 sheet = .x, 
                 range = readxl::cell_cols("A:T"),
                 col_types = c("text", "date","text","text", "text",
                               "text", "text","text","text", "text",
                               "text", "text","text","text", "text",
                               "text", "text","text","date", "text")
               ) |> dplyr::mutate(Origem = arrumar_origem(paths)) |> 
                 dplyr::select(
                   Origem,
                   Analista = 1,
                   Data = 2,
                   Job = 3,
                   Elementar = 4,
                   Familia = 5,
                   UF_Preco = 9,
                   `Abert/Ampl` = 10,
                   BP = 11,
                   UF_Escritorio = 12,
                   Coletor = 13,
                   Empresa = 14,
                   CNPJ = 15,
                   Status = 18,
                   Retorno = 19,
                   Obs. = 20
                 ) |> 
                 dplyr::mutate(
                   Obs. = stringi::stri_trans_general(str = Obs., id = "Latin-ASCII"))
    )
  }