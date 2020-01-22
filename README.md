# Pre-Lorne Intro to R workshop 2020:

Current outline:

* Run through MBP Intro R material
* Go through Cytoscape input material and explore/plot with ggplot2
* Small introduction to R-Markdown and generate a report with Cytoscape data

We'll be using [RStudio Cloud](https://rstudio.cloud/)

Rough schedule:

Day 1:

| Time              | Session                             |
|-------------------|-------------------------------------|
| 9:00am - 10.30am  | Welcome overview, Starting out in R |
| 10.30am - 11.00am | Morning tea                         |
| 11.00am - 12.30pm | Data frames                         |
| 12:30pm – 1:30pm  | Lunch                               |
| 1:30pm – 3.00pm   | Data frames, plotting with ggplot2  |
| 3.00pm – 3:30pm   | Afternoon Tea                       |
| 3:30pm – 5.00pm   | Cytoscape Tutorial                  |


Day 2:

| Time              | Session                           |
|-------------------|-----------------------------------|
| 9:00am - 10.00am  | ggplot2 cytoscape material,       |
| 10.00am - 10.30am | Morning tea                       |
| 10.30am - 12.30pm | Summarizing data, Rmarkdown       |
| 12:30pm – 1:30pm  | Lunch                             |
| 1:30pm – 2.00pm   | Rmarkdown, Thinking in R          |
| 3.00pm – 3:30pm   | Data Viz Critique Tutorial        |
| 3.00pm – 3:30pm   | Afternoon Tea                     |
| 3:30pm – 5.00pm   | Data Viz Critique Tutorial        |



# Proteomics Intro to R workshop 2020

Introduction to R workshop material. This is an updated full day workshop.

This workshop material uses the `bookdown` R package.

To re-build the html and pdf documents and zip file, use:

```
make
```

To recreate the .csv files from files downloaded from Gapminder, use:

```
make ingest
```

`opening_slides_template.pptx` can be used as a template for an opening slideshow. Fill in instructor names and the location of your workshop etherpad. The workshop etherpad serves as the central jumping off point for the workshop, and should list at the top:

* schedule
* link to this workshop material
* link to RStudio Cloud