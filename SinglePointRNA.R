#!/usr/bin/env Rscript

# for develomepment purposes
devtools::document()

library('argparse')
library('logger')

parser <- ArgumentParser()

parser$add_argument(
    "-v", 
    "--verbose", 
    action="store_true", 
    default=TRUE,
    help="Print extra output [default]"
)
parser$add_argument(
    "-q",
    "--quietly",
    action="store_false",
    dest="verbose",
    help="Print little output"
)
parser$add_argument(
    "input",
    nargs=1,
    help="Path to input data, a file (H5 / plaint text / RDS) or a folder (10X output)"
)
parser$add_argument(
    "--metadata",
    help="Path to metadata file (.csv, .tsv, .txt) with extra cell information. Cell IDs of the experiment must match the first column on the table."
)
parser$add_argument(
    "--diffexp",
    help="Path to expression results file (RDS or Excel)"
)
       
args <- parser$parse_args()



inputDataset$Seurat <- run_Load( input=args$input, metadata=args$metadata )

if( !is.null( inputDataset$Seurat )){
    iD_summary$Table <- load_getInputReport( inputDataset$Seurat, input$Load_org )

    colnames(iD_summary$Table) <- gsub("\\.", " ", colnames(iD_summary$Table))

    iD_summary$Table

    if(!is.null( args$metadata )) { 
        load_missMD( args$metadata, colnames( inputDataset$Seurat ) ) 
    }
}


#   observeEvent( input$Load_DEG, { # differential expression is loaded independently
#     if(  !is.integer( input$Load_DEG ) ){
#       output$Load_chosenDEG <- renderUI({
#         HTML(paste0( "Differential Expression Results selected:<br>&nbsp&nbsp&nbsp",
#                      parseFilePaths(volumes, input$Load_DEG)$datapath ) )
#       })
#       deg <- parseFilePaths(volumes, input$Load_DEG)$datapath
#     } else {
#       output$Load_chosenDEG <- NULL
#       deg <- NULL
#     }
#     if( !is.null( deg ) ){
#       deg <- load_addDEG( deg )
#       diffExpr$Parameters <- deg$Parameters
#       diffExpr$Tables <- deg$Tables
#     }
#     output$Load_summDE <- renderUI({ renderTable({  diffExpr$Parameters  }, rownames = TRUE) })
#   })