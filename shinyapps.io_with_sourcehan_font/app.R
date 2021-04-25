# https://github.com/rstudio-education/shiny.rstudio.com-tutorial/blob/master/part-1-code/app.R
# 01-kmeans-app

# 源ノフォントをダウンロード、登録する
download.file("https://raw.githubusercontent.com/ltl-manabi/shinyapps.io_japanese_font/master/use_sourcehan_font.sh", destfile = "use_sourcehan_font.sh")
system("bash ./use_sourcehan_font.sh")

# 列名を日本語に変える
colnames(iris) <- c("がく片長", "がく片幅", "花びら長", "花びら幅", "種")

palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
  "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

library(shiny)

ui <- fluidPage(
  headerPanel('Irisデータの k-means 法によるクラスタリング (源ノフォント設定済)'),
  sidebarPanel(
    selectInput('xcol', 'X 軸', names(iris)),
    selectInput('ycol', 'Y 軸', names(iris),
      selected = names(iris)[[2]]),
    numericInput('clusters', 'クラスタ数', 3,
      min = 1, max = 9)
  ),
  mainPanel(
    plotOutput('plot1')
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
    par(mar = c(5.1, 4.1, 0, 1))
    plot(selectedData(),
         col = clusters()$cluster,
         pch = 20, cex = 3, family = "Source Han Sans")
    points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
  })

}

shinyApp(ui = ui, server = server)