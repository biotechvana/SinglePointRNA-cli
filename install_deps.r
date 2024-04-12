# These libraries/packages (Debian / Ubuntu) are needed to build some of the dependencies
# git
# cmake
# libpq-dev
# libhdf5-dev
# liblzma-dev
# libbz2-dev
# libglpk-dev
# libfftw3-dev
# libssl-dev
# libxml2-dev
# libfontconfig1-dev
# librsvg2-dev
# libcurl4-openssl-dev
# libharfbuzz-dev libfribidi-dev
# libudunits2-dev
# libgsl-dev
# libmpfr-dev

# sudo apt install cmake libpq-dev libhdf5-dev liblzma-dev libbz2-dev libglpk-dev libfftw3-dev libssl-dev libxml2-dev libcurl4-openssl-dev librsvg2-dev libfontconfig1-dev libharfbuzz-dev libfribidi-dev libudunits2-dev libgsl-dev libmpfr-dev

# dependencies
packages <- c(
    "dplyr",
    "ggplot2",
    "grid",
    "gridExtra",
    "plotly",
    "ggalluvial",
    "openxlsx",
    "zoo",
    "readxl",
    "Seurat",
    "hdf5r",
    "HH",
    "stringr",
    "sctransform",
    "scCATCH",
    "BiocParallel",
    "glmGamPoi",
    "argparse",
    "logger"
)

# Install BiocManager first
if(!require('BiocManager',character.only = TRUE)) install.packages("BiocManager", dependencies = TRUE)

# Install the dependencies
lapply(packages, function(x) if(!require(x,character.only = TRUE)) BiocManager::install(x, dependencies = TRUE, ask = FALSE))
