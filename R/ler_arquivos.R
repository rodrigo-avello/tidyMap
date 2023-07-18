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
  function(paths, n_sheet) {
    purrr::map(
      1:n_sheet,
      ~ readxl::read_xlsx(
        paths,
        sheet = .x,
        range = readxl::cell_cols("A:T"),
        col_types = c(
          "text",
          "date",
          "text",
          "text",
          "text",
          "text",
          "text",
          "text",
          "text",
          "text",
          "text",
          "text",
          "text",
          "text",
          "text",
          "text",
          "text",
          "text",
          "date",
          "text"
        )
      ) |> dplyr::mutate(Origem = arrumar_origem(paths)) |>
        dplyr::select(
          Origem,
          Analista = 1,
          Data = 2,
          Job = 3,
          Elementar = 4,
          Item = 6,
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
          Data = Data |> as.Date(),
          Retorno = Retorno |> as.Date(),
          Obs. = stringi::stri_trans_general(str = Obs., id = "Latin-ASCII"),
          Origem = stringi::stri_trans_general(str = Origem, id = "Latin-ASCII"),
          Familia = stringi::stri_trans_general(str = Familia, id = "Latin-ASCII"),
          Empresa = stringi::stri_trans_general(str = Empresa, id = "Latin-ASCII"),
          Analista = stringi::stri_trans_general(str = Analista, id = "Latin-ASCII"),
          Analista = Analista |> stringr::str_to_upper(),
          Job = stringi::stri_trans_general(str = Job, id = "Latin-ASCII"),
          Elementar = stringi::stri_trans_general(str = Elementar, id = "Latin-ASCII"),
          Empresa = stringi::stri_trans_general(str = Empresa, id = "Latin-ASCII"),
          UF_Preco = stringi::stri_trans_general(str = UF_Preco, id = "Latin-ASCII"),
          UF_Escritorio = stringi::stri_trans_general(str = UF_Escritorio, id = "Latin-ASCII"),
          Coletor = stringi::stri_trans_general(str = Coletor, id = "Latin-ASCII"),
          Coletor = stringi::stri_trans_general(str = Coletor, id = "Latin-ASCII"),
          `Abert/Ampl` = stringi::stri_trans_general(str = `Abert/Ampl`, id = "Latin-ASCII"),
          Item = stringi::stri_trans_general(str = Item, id = "Latin-ASCII")
        )
    )
  }
