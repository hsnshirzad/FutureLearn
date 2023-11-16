
# Overview

This project utilizes the R programming language along with the following libraries: readr, dplyr, ggplot2, and extrafont. The primary goal is to conduct data analysis and generate reports based on two cycles of the CRISP-DM (Cross-Industry Standard Process for Data Mining) methodology.


# Libraries

This project utilizes the R programming language along with the following libraries:

- **readr**: Used for reading and importing datasets efficiently.
- **dplyr**: Utilized for data manipulation and transformation tasks.
- **ggplot2**: Employed for creating informative and visually appealing plots and figures.
- **extrafont**: Included for enhanced font support in the generated plots.

## Installation

To use this project, you need to install the required R libraries. Open your R environment or script and run the following commands:

```R
# Install and load the readr library
install.packages("readr")
library(readr)

# Install and load the dplyr library
install.packages("dplyr")
library(dplyr)

# Install and load the ggplot2 library
install.packages("ggplot2")
library(ggplot2)

# Install and load the extrafont library
install.packages("extrafont")
library(extrafont)

```

# File Structure

## Dataset

`data/:` This folder contains 52 CSV files representing the *MOOC dataset*

## Pre-processing

`munge/01.A.R`: Contains R code for the pre-processing tasks of the first cycle.
`munge/01.B.R`: Includes R code for the pre-processing tasks of the second cycle.

## Reports and Figures

`src/fig_A.R`: R script for generating reports and figures based on the first cycle.
`src/fig_B.R`: R script for generating reports and figures based on the second cycle.

### Version Control and Logs

- **git log**: The git log for this project can be found `log/Reflective_log.pdf`.
- **Reflective Log**: A reflective log summarizing my experience on this project is available `log/GitLog.txt`.

## Instructions

1. Load the desired dataset from the `data/` folder. Adjust the file path accordingly in the R scripts.
2. Run `munge/01.A.R` and `munge/01.B.R` for pre-processing tasks related to the respective cycles.
3. Execute `scr/fig_A.R` and `scr/fig_B.R` to generate reports and figures based on the processed data.

