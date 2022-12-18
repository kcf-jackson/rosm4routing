#' Convert 'OpenStreetMap' PBF files to CSV files
#'
#' @param input A character string; the input PBF file.
#' @param output A character string; the output directory.
#'
#' @examples
#' \dontrun{
#' rosm4routing("Melbourne.osm.pbf")
#' }
#' @export
rosm4routing <- function(input, output = ".") {
  if (!file.exists(input)) {
    stop("Input file does not exist.")
  }

  # Call the Rust function to generate the CSV files
  main(input)

  # Move the files to the target directory
  if (output != "." && output != "./") {
    file.rename(file.path(".", "nodes.csv"),
                file.path(output, "nodes.csv"))
    message("File written to: ", file.path(output, "nodes.csv"))

    file.rename(file.path(".", "edges.csv"),
                file.path(output, "edges.csv"))
    message("File written to: ", file.path(output, "edges.csv"))
  }
}
