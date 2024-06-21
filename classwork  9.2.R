library(shiny)
library(shinythemes)  # pretty color schemes to pick from
library(ggplot2)

# Define the path to the CSV file
csv_path <- "C:/Users/chand/Downloads/MovieRatings.csv"

# Check if the file exists and read the CSV file
if (file.exists(csv_path)) {
  movies <- read.csv(csv_path)
  dataset <- movies
} else {
  stop("CSV file does not exist: ", csv_path)
}

# User Interface Part
ui <- fluidPage(
  theme = shinytheme('united'), # cute grey & blue color scheme
  
  headerPanel("Movies Reviews"),
  
  sidebarPanel(
    sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                value=min(1, nrow(dataset)), step=5, round=0),
    
    # names refer to the column names of the dataset, all of them
    selectInput('x', 'X', names(dataset)),
    selectInput('y', 'Y', names(dataset), names(dataset)[[2]]),
    selectInput('color', 'Color', c('None', names(dataset)))
  ),
  
  mainPanel(
    plotOutput('plot')
  )
)

# Server logic
server <- function(input, output) {
  dataset <- reactive({
    movies[sample(nrow(movies), input$sampleSize), ]
  })
  
  output$plot <- renderPlot({
    p <- ggplot(dataset(), aes_string(x = input$x, y = input$y)) + geom_point()
    
    if (input$color != 'None')
      p <- p + aes_string(color = input$color)
    
    print(p)
  }, height = 400)
}

# Run the app
shinyApp(ui = ui, server = server)
