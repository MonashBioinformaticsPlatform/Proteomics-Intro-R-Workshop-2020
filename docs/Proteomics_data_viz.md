# Proteomics Data Viz

## Visualizing Proteomics data with ggplot2




Last session we worked on Cross-linking Mass Spectrometry Data. The data consisted of interaction between 300 yeast nuclear proteins. 
We also learned about concepts behind `Grammer of Graphics` and plotting using `ggplot2`. 

In this tutorial, we will be working on the data from Yeast Nuclear Protein interaction study using Cross-linking Mass Spectrometry. 


```r
library(tidyverse)
```

We continue with the Cross-linking Proteomics dataset from Cytoscape tutorial.
The data was in excel, therefore we first converted it into `Comma separated file (csv)`  format.

### Optional: Reading excel file into R {.extra}
If you want to load the excel files files directly to `R` then you can use another library `readxl`. 


```r
library(readxl)
nuclear_xl_ms_excel <- readxl::read_excel("r-intro-files/Nuclear_XL_MS.xlsx")
head(nuclear_xl_ms_excel)
```

```
## # A tibble: 6 x 7
##   Protein1 Protein2 NameProtein1 NameProtein2 PPINovelty PPIEvidenceInfo…
##   <chr>    <chr>    <chr>        <chr>        <chr>      <chr>           
## 1 P02293   P04911   H2B1         H2A1         Known      Structure       
## 2 P02293   P02309   H2B1         H4           Known      Structure       
## 3 P02994   P32471   EF1A         EF1B         Known      Structure       
## 4 P0CX51   P38011   RS16A        GBLP         Known      Structure       
## 5 P02406   P0CX49   RL28         RL18A        Novel      STRING          
## 6 P33297   P53549   PRS6A        PRS10        Known      Structure       
## # … with 1 more variable: NumberUniqueLysLysContacts <dbl>
```


## Exploring the data

```r
library(readxl)
nuclear_xl_ms <- read_csv("r-intro-files/Nuclear_XL_MS.csv")
head(nuclear_xl_ms)
```

```
## # A tibble: 6 x 7
##   Protein1 Protein2 NameProtein1 NameProtein2 PPINovelty PPIEvidenceInfo…
##   <chr>    <chr>    <chr>        <chr>        <chr>      <chr>           
## 1 P02293   P04911   H2B1         H2A1         Known      Structure       
## 2 P02293   P02309   H2B1         H4           Known      Structure       
## 3 P02994   P32471   EF1A         EF1B         Known      Structure       
## 4 P0CX51   P38011   RS16A        GBLP         Known      Structure       
## 5 P02406   P0CX49   RL28         RL18A        Novel      STRING          
## 6 P33297   P53549   PRS6A        PRS10        Known      Structure       
## # … with 1 more variable: NumberUniqueLysLysContacts <dbl>
```

Now lets examine the dataset with two base R functions `str` and `summary`


```r
str(nuclear_xl_ms)
```

```
## Classes 'spec_tbl_df', 'tbl_df', 'tbl' and 'data.frame':	228 obs. of  7 variables:
##  $ Protein1                  : chr  "P02293" "P02293" "P02994" "P0CX51" ...
##  $ Protein2                  : chr  "P04911" "P02309" "P32471" "P38011" ...
##  $ NameProtein1              : chr  "H2B1" "H2B1" "EF1A" "RS16A" ...
##  $ NameProtein2              : chr  "H2A1" "H4" "EF1B" "GBLP" ...
##  $ PPINovelty                : chr  "Known" "Known" "Known" "Known" ...
##  $ PPIEvidenceInfoGroup      : chr  "Structure" "Structure" "Structure" "Structure" ...
##  $ NumberUniqueLysLysContacts: num  12 6 5 1 2 3 2 3 3 1 ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   Protein1 = col_character(),
##   ..   Protein2 = col_character(),
##   ..   NameProtein1 = col_character(),
##   ..   NameProtein2 = col_character(),
##   ..   PPINovelty = col_character(),
##   ..   PPIEvidenceInfoGroup = col_character(),
##   ..   NumberUniqueLysLysContacts = col_double()
##   .. )
```

```r
summary(nuclear_xl_ms)
```

```
##    Protein1           Protein2         NameProtein1       NameProtein2      
##  Length:228         Length:228         Length:228         Length:228        
##  Class :character   Class :character   Class :character   Class :character  
##  Mode  :character   Mode  :character   Mode  :character   Mode  :character  
##                                                                             
##                                                                             
##                                                                             
##   PPINovelty        PPIEvidenceInfoGroup NumberUniqueLysLysContacts
##  Length:228         Length:228           Min.   : 1.000            
##  Class :character   Class :character     1st Qu.: 1.000            
##  Mode  :character   Mode  :character     Median : 1.000            
##                                          Mean   : 1.342            
##                                          3rd Qu.: 1.000            
##                                          Max.   :12.000
```
While the data in `PPINovelty` and `PPIEvidenceInfoGroup` are characters/strings, they can also be thought of as categorical. 

We will now look into the unique values for the PPINovelty and PPIEvidenceInfoGroup columns


```r
unique(nuclear_xl_ms$PPINovelty)
```

```
## [1] "Known" "Novel"
```

```r
unique(nuclear_xl_ms$PPIEvidenceInfoGroup)
```

```
## [1] "Structure"   "STRING"      "APID"        "Unexplained" "Genetic"
```




R has a class for categorical data known as factors. We can convert these columns to factors and provide an order to those categories (levels). By default, R will order the levels of a factor alphabetically but we can override this behaviour by defining the level order.
Here we will order the Evidence based on Strength of evidence for the interaction



```r
nuclear_xl_ms$PPINovelty<-factor(nuclear_xl_ms$PPINovelty)
nuclear_xl_ms$PPIEvidenceInfoGroup <- factor(nuclear_xl_ms$PPIEvidenceInfoGroup, 
                                    levels = c("Structure","APID", "STRING", "Genetic", "Unexplained"))
str(nuclear_xl_ms)
```

```
## Classes 'spec_tbl_df', 'tbl_df', 'tbl' and 'data.frame':	228 obs. of  7 variables:
##  $ Protein1                  : chr  "P02293" "P02293" "P02994" "P0CX51" ...
##  $ Protein2                  : chr  "P04911" "P02309" "P32471" "P38011" ...
##  $ NameProtein1              : chr  "H2B1" "H2B1" "EF1A" "RS16A" ...
##  $ NameProtein2              : chr  "H2A1" "H4" "EF1B" "GBLP" ...
##  $ PPINovelty                : Factor w/ 2 levels "Known","Novel": 1 1 1 1 2 1 2 1 1 1 ...
##  $ PPIEvidenceInfoGroup      : Factor w/ 5 levels "Structure","APID",..: 1 1 1 1 3 1 3 1 1 2 ...
##  $ NumberUniqueLysLysContacts: num  12 6 5 1 2 3 2 3 3 1 ...
##  - attr(*, "spec")=
##   .. cols(
##   ..   Protein1 = col_character(),
##   ..   Protein2 = col_character(),
##   ..   NameProtein1 = col_character(),
##   ..   NameProtein2 = col_character(),
##   ..   PPINovelty = col_character(),
##   ..   PPIEvidenceInfoGroup = col_character(),
##   ..   NumberUniqueLysLysContacts = col_double()
##   .. )
```

## Plotting interactions types
Firstly we will plot the number of Known and novel interactions using with `geom_bar`


```r
ggplot(nuclear_xl_ms, aes(x = PPINovelty)) + 
geom_bar() + 
        xlab("Novelty") +
  theme_bw()
```

<img src="Proteomics_data_viz_files/figure-html/unnamed-chunk-8-1.png" width="576" style="display: block; margin: auto;" />

Now, we will rotate the bars to **Y-Axis** using `coord_flip()`


```r
ggplot(nuclear_xl_ms, aes(x = PPINovelty)) + 
 geom_bar(position = "dodge") + 
        xlab("Novelty") +
        coord_flip() +
  theme_bw()
```

<img src="Proteomics_data_viz_files/figure-html/unnamed-chunk-9-1.png" width="576" style="display: block; margin: auto;" />

Next, step would be to create a stacked bar chart by adding **PPIEvidenceInfoGroup** data on top of each bar


```r
ggplot(nuclear_xl_ms, aes(PPINovelty)) + 
  geom_bar(aes(fill=PPIEvidenceInfoGroup)) + 
        xlab("Novelty") +
        coord_flip() +
  theme_bw()
```

<img src="Proteomics_data_viz_files/figure-html/unnamed-chunk-10-1.png" width="576" style="display: block; margin: auto;" />

#### Add Color blind safe color scheme

```r
## Specify your own color-blind friendly pallette with 5 colors
cbPalette <- c("#999999", "#E69F00", "#009E73", "#0072B2", "#D55E00")


ggplot(nuclear_xl_ms, aes(PPINovelty)) + 
  geom_bar(aes(fill=PPIEvidenceInfoGroup)) + 
        xlab("Novelty") +
        coord_flip() +
        scale_fill_manual(values=cbPalette)+
  theme_bw()
```

<img src="Proteomics_data_viz_files/figure-html/unnamed-chunk-11-1.png" width="576" style="display: block; margin: auto;" />



## Individual Proteins

First we will calculate how many times a protein appeared in **NameProtein1** column using `table` function and then sorting by descending order.
Next we will use `head()` function to print first five proteins with most observation. 


```r
counts_source<-count(nuclear_xl_ms, NameProtein1)

arrange(counts_source, desc(n))
```

```
## # A tibble: 161 x 2
##    NameProtein1     n
##    <chr>        <int>
##  1 H2B1            10
##  2 EF1A             7
##  3 RL27A            5
##  4 H3               4
##  5 EF3A             3
##  6 ODP2             3
##  7 OSTB             3
##  8 RL11A            3
##  9 RL32             3
## 10 RL7A             3
## # … with 151 more rows
```

We could do same thing for **NameProtein2** column as well. 


```r
counts_target<-count(nuclear_xl_ms, NameProtein2)

arrange(counts_target, desc(n))
```

```
## # A tibble: 185 x 2
##    NameProtein2     n
##    <chr>        <int>
##  1 H3               6
##  2 RS15             5
##  3 NOP56            4
##  4 BFR1             3
##  5 PRS4             3
##  6 RL14A            3
##  7 RL6A             3
##  8 ATPG             2
##  9 EF1A             2
## 10 ERP1             2
## # … with 175 more rows
```

Now we store the rows containing H2B1 and EF1A proteins in **NameProtein1** column in a datafame.


```r
two_protein_df<- filter(nuclear_xl_ms, NameProtein1 %in% c("H2B1","EF1A"))

ggplot(two_protein_df, aes(x=PPINovelty, y=NumberUniqueLysLysContacts)) +
  geom_col(aes(fill=PPIEvidenceInfoGroup)) +
  labs(x= "Novelty",
  y= "Number of Contacts") +
  facet_wrap(~NameProtein1)+
  theme_bw()
```

<img src="Proteomics_data_viz_files/figure-html/unnamed-chunk-14-1.png" width="576" style="display: block; margin: auto;" />

## Volcano Plot [Optional]

In this section, we will see how to plot a volcano plot for a quantitative proteomics dataset. 
This dataset is derived from label-free quantitative proteomics experiment investigating differences in protein profiles between Benign and 
Malignant Prostate cancers. 

The details can be found on [LFQ-Analyst](https://bioinformatics.erc.monash.edu/apps/LFQ-Analyst/) under the **Demo** tab.

There are 20 samples in total with `n=10` in each group. 

A moderated _t-test_ was performed to find differentially expressed proteins in the dataset. Each row represents a protein along with log fold change and p-values.

In this tutorial we will visualise the results in the form of **Volcano Plot**.

Firstly, we will load the data. 


```r
lfq_data<-read_csv("r-intro-files/LFQ-Analyst_results.csv")
nrow(lfq_data)
```

```
## [1] 2389
```

```r
ncol(lfq_data)
```

```
## [1] 10
```
The data has quantitative information about 2389 proteins and has 10 columns.

Now lets see the column names.


```r
colnames(lfq_data)
```

```
##  [1] "Gene Name"                           
##  [2] "Protein IDs"                         
##  [3] "Benign_vs_Malignant_log2 fold change"
##  [4] "Benign_vs_Malignant_p.val"           
##  [5] "Benign_vs_Malignant_p.adj"           
##  [6] "significant"                         
##  [7] "Benign_vs_Malignant_significant"     
##  [8] "imputed"                             
##  [9] "num_NAs"                             
## [10] "Protein.names"
```

For plotting the volcano plot, we need to focus on th three columns 

1. Benign_vs_Malignant_log2 fold change
2. Benign_vs_Malignant_p.adj
3. significant

Next we will on the fly convert FDR values to `-log10` and plot it against log2 fold change on the **X-axis**


```r
volcano_plot <- ggplot(lfq_data, 
                       aes(x = `Benign_vs_Malignant_log2 fold change`, 
                           y = -log10(`Benign_vs_Malignant_p.adj`))) + 
  geom_point(color="grey") + 
  labs(x= "Log 2 fold change",
       y= "-log 10 FDR") + 
  theme_bw()
volcano_plot
```

<img src="Proteomics_data_viz_files/figure-html/unnamed-chunk-17-1.png" width="576" style="display: block; margin: auto;" />

```r
volcano_plot + geom_point(data= filter(lfq_data, significant=="TRUE"), color="black")
```

<img src="Proteomics_data_viz_files/figure-html/unnamed-chunk-17-2.png" width="576" style="display: block; margin: auto;" />



