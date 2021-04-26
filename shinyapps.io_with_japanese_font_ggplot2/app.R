# https://github.com/rstudio-education/shiny.rstudio.com-tutorial/blob/master/part-1-code/app.R
# 01-kmeans-app

# 4種類のフォントをダウンロード、設定する
download.file("https://raw.githubusercontent.com/ltl-manabi/shinyapps.io_japanese_font/master/use_4_font.sh", destfile = "use_4_font.sh")
system("bash ./use_4_font.sh")

# 列名を日本語に変える
colnames(iris) <- c("がく片長", "がく片幅", "花びら長", "花びら幅", "種")

palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
  "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

library(shiny)
library(tidyverse)

ui <- fluidPage(
  headerPanel("Irisデータの k-means 法によるクラスタリング (日本語フォントが選べます) ※最初は文字化けしています"),
  sidebarPanel(
    selectInput("xcol", "X 軸", names(iris)),
    selectInput("ycol", "Y 軸", names(iris),
      selected = names(iris)[[2]]),
    numericInput("clusters", "クラスタ数", 3,
      min = 1, max = 9),
    selectInput("fontface", "フォント", c("DejaVu Sans", "IPAexGothic", "Source Han Sans", "Noto Sans CJK JP", "SetoFont"),
    selected = "DejaVu Sans")
  ),
  mainPanel(
    plotOutput("plot1")
  )
)

server <- function(input, output) {

  selectedData <- reactive({
    iris[, c(input$xcol, input$ycol)]
  })

  clusters <- reactive({
    kmeans(selectedData(), input$clusters)
  })

  output$plot1 <- renderPlot({
    g <- ggplot(selectedData(), aes(x = (!!rlang::sym(input$xcol)), 
                                    y = (!!rlang::sym(input$ycol)),
                                    colour = factor(clusters()$cluster)))
    g <- g + geom_point() + labs(colour = "クラスタ番号")
    g <- g + theme_gray(base_family = input$fontface, base_size = 18)
    print(g)
  })

}

shinyApp(ui = ui, server = server)
