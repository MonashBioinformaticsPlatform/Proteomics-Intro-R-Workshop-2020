# Pre-Lorne Intro to R workshop 2020:

Important links:

* R - Intro course material: [Content here](https://monashbioinformaticsplatform.github.io/Proteomics-Intro-R-Workshop-2020/)

* [Etherpad](https://etherpad.wikimedia.org/p/r_intro_feb_2020)

* We'll be using [RStudio Cloud](https://rstudio.cloud/)

Schedule:

Day 1:

| Time              | Session                             |
|-------------------|-------------------------------------|
| 9:00am - 10.30am  | Welcome overview, Starting out in R |
| 10.30am - 11.00am | Morning tea                         |
| 11.00am - 1.00pm | Data frames                         |
| 1:00pm – 2:00pm  | Lunch                               |
| 2:00pm – 3.30pm   | Data frames, plotting with ggplot2  |
| 3.30pm – 4:00pm   | Afternoon Tea                       |
| 3:30pm – 5.30pm   | Working with Cytoscape              |


Day 2:

| Time              | Session                           |
|-------------------|-----------------------------------|
| 9:00am - 10.30am  | Proteomics data Viz              |
| 10.30am - 11.00am | Morning tea                       |
| 11.00am - 1.00pm | Summarizing data, Rmarkdown       |
| 1:00pm – 2:00pm  | Lunch                             |
| 2:00pm – 3.30pm   | Data Viz Critique Tutorial        |
| 3.30pm – 4:00pm   | Afternoon Tea                     |
| 4.00pm – 5:30pm   | Data Viz Critique Tutorial        |


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