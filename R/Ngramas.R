#` @export

Ngramas <- function(data, Agrupamento, Ngramas) {
  # Carregar bibliotecas
  if (!require(quanteda)) install.packages("quanteda")
  if (!require(quanteda.textstats)) install.packages("quanteda.textstats")
  if (!require(quanteda.textplots)) install.packages("quanteda.textplots")
  if (!require(ggplot2)) install.packages("ggplot2")

  # Restante do código
  toks <- tokens(data, remove_punct = TRUE)
  toks_ngram <- tokens_ngrams(toks, n = Agrupamento)
  dfmat_tweets <- dfm(toks_ngram)

  dfmat_tweets %>%
    textstat_frequency(n = Ngramas) %>%
    ggplot(aes(x = reorder(feature, frequency), y = frequency)) +
    geom_point() +
    coord_flip() +
    labs(x = NULL, y = "Frequency") +
    theme_minimal()
}
