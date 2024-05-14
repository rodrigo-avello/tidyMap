#' consolidar_arquivos
#'
#' Função sem passagem de parâmetros que retorna um arquivo .xlsx
#'
#'
#' @param x lista de string.
#'
#' @export


consolidar_arquivos = function() {
  ## Define o caminho dos arquivos de mapeamento:

  # Arquivos com apenas 01 sheet para leitura:
  paths = c(
    "../3-SCO e EPE/2-EPE/Mapeamento-EPE.xlsx",
    "../3-SCO e EPE/1-SCO/Mapeamento-SCO.xlsx",
    "../2-SIMG/2-SIMG ÍNDICE/Mapeamento-SIMG ÍNDICE.xlsx",
    "../4-IPA e INCC/Mapeamento-IPA e INCC.xlsx"
  )

  n_sheet = 1

  n = length(paths)

  df1 = purrr::map_df(1:n,
                      ~ ler_arquivos(paths[.x], n_sheet))

  rm(paths,n_sheet,n)


  # Arquivos com 2 sheets:
  paths = c(
    "../2-SIMG/1-SIMG PREÇO/14-INFRAES/Mapeamento_INFRAES.xlsx",
    "../2-SIMG/1-SIMG PREÇO/15-SICFER/Mapeamento_SICFER.xlsx",
    "../2-SIMG/1-SIMG PREÇO/11-SABESP/Mapeamento_SABESP.xlsx",
    "../2-SIMG/1-SIMG PREÇO/10-DER_MG/Mapeamento_DER_MG_2023.xlsx",
    "../2-SIMG/1-SIMG PREÇO/18-FGV Transportes/Mapeamento_FGV_Transportes.xlsx",
    "../2-SIMG/1-SIMG PREÇO/17-CAGECE/Mapeamento_CAGECE.xlsx"
  )

  n_sheet = 2

  n = length(paths)

  df2 = purrr::map_df(1:n,
                      ~ ler_arquivos(paths[.x], n_sheet))

  rm(paths,n_sheet,n)




  # Arquivos com 3 sheets:
paths = c(
  "../2-SIMG/1-SIMG PREÇO/12-ECON_DNIT/Mapeamento_ECON_DNIT.xlsx",
  # "../2-SIMG/1-SIMG PREÇO/13-DNIT (SICRO)/Mapeamento_SICRO.xlsx",
  "../2-SIMG/1-SIMG PREÇO/13-DNIT (SICRO)/Mapeamento_SICRO (2018 a 2022).xlsx",
  "../2-SIMG/1-SIMG PREÇO/13-DNIT (SICRO)/Mapeamento_SICRO (2023).xlsx",
  "../2-SIMG/1-SIMG PREÇO/13-DNIT (SICRO)/EST_VAREJO (Projeto Estudo Varejo DNIT)/Mapeamento_EST_VAREJO.xlsx",
  "../2-SIMG/1-SIMG PREÇO/19-DER_SP/Mapeamento_DER_SP.xlsx",
  "../2-SIMG/1-SIMG PREÇO/20-SANEAGO/Mapeamento_SANEAGO.xlsx"
  )
  
   n_sheet = 3
  
   n = length(paths)
  
   df3 = purrr::map_df(1:n, ~ ler_arquivos(paths[.x], n_sheet))
  
  rm(paths,n_sheet,n)




  #  Arquivos com 4 sheets:
  paths = c(
    "../2-SIMG/1-SIMG PREÇO/10-DER_MG/Mapeamento_DER_MG_2022.xlsx"
    )

  n_sheet = 4

  n = length(paths)

  df4 = purrr::map_df(1:n,
                      ~ ler_arquivos(paths[.x], n_sheet))

  rm(paths,n_sheet,n)




  #  Arquivos com 5 sheets: (Atualizado para 2 sheets em 24/10/2023)
  paths = "../2-SIMG/1-SIMG PREÇO/9-GOINFRA/Mapeamento_GOINFRA.xlsx"

  #n_sheet = 5
  n_sheet = 2

  n = length(paths)

  df5 = purrr::map_df(1:n,
                      ~ ler_arquivos(paths[.x], n_sheet))

  rm(paths,n_sheet,n)




  # 6 sheets:
  paths = "../2-SIMG/1-SIMG PREÇO/5-Apoio-SIMG/2- CONTROLE DE MAPEAMENTO - APOIO DNIT-ANTT 2020-2021.xlsx"

  n_sheet = 6

  n = length(paths)

  df6 = purrr::map_df(1:n,
                      ~ ler_arquivos(paths[.x], n_sheet))

  df6 = df6 |>
    dplyr::mutate(Origem = Origem |> stringr::str_replace("- ",""))


  rm(paths,n_sheet,n)





  df_all = dplyr::bind_rows(df1,df2,df3,df4,df5,df6)

  rm(df1,df2,df3,df4,df5,df6)



  df_all |>
    readr::write_csv2(paste0(lubridate::today(), '_mapeamento.csv'))





  rm(list = ls())

  cat("\014")

  cat("\n \n \n \n \n \n \n \n \n \n  \n \n \n \n \n \n \n \n \n Arquivo de mapeamento gerado com sucesso!")





}














