#ui.R
shinyUI(
  fluidPage(
    br(),
    titlePanel("Trends in Demographics and Income"),
    p("Explore the difference between people who earn less than 50k and more than 50k. You can filter data by country, then explore various demographic variables")
  )
)

fluidRow(
  column(12,
         wellPanel(selectInput("countries", "Country:", c("United States", "Canada", "Mexico", "Germany", "Philippines"),
                               selected = NULL,
                               multiple = FALSE,
                               selectize = FALSE,
                               width = NULL,
                               size = NULL))
  )
)

fluidRow(
  column(3,
         wellPanel(
           p("Select a continuous variable and graph type (histogram or boxplot) to view on the right"),
           radioButtons("continuous_variable,", "Continuous Variable:", c("age", "hours_per_week")),
           choices = NULL,
           selected = NULL,
           incline = FALSE,
           width = NULL,
           choiceNames = NULL,
           choiceValues = NULL
         )),
  radioButtons("graph_type", "Graph Type;", c("Histogram", "Boxplot")),
  choices = NULL,
  selected = NULL,
  inline = FALSE,
  width = NULL,
  choiceNames = NULL,
  choiceValues = NULL
)
column(9, plotOutput("P1"))

fluidRow(
  column(3, 
         wellPanel(
           p("Select a categorical variable to view bar chart on the right. Use the check box to view a stacked bar chart to combine the income levels into one graph. "),
           radioButtons("categorical_variable", "Categorical Variable:", c("education", "workclass", "sex")),
           choices = NULL,
           selected = NULL,
           inline = FALSE,
           width = NULL,
           choiceNames = NULL,
           choiceValues = NULL),
         checkboxInput("is_stacked", "Stack bar", value = FALSE, width = NULL)    # add check box input for stacked bar chart option
  )
)
column(9, plotOutput("P2")) 
