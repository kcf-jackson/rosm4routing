use extendr_api::prelude::*;

/// Convert OpenStreetMap OSM.PBF files into CSV files
/// @param filename A character string; the path to the OSM.PBF file.
#[extendr]
fn main(filename: &str) {
    match osm4routing::reader::read(filename) {
        Ok((nodes, edges)) => osm4routing::writers::csv(nodes, edges),
        Err(error) => println!("Error: {}", error),
    }
}

// Macro to generate exports.
// This ensures exported functions are registered with R.
// See corresponding C code in `entrypoint.c`.
extendr_module! {
    mod rosm4routing;
    fn main;
}
