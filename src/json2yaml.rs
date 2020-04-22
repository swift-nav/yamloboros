use std::io;
use std::error::Error;
use std::boxed::Box;

type Result<T> = std::result::Result<T, Box<dyn Error>>;

fn main() -> Result<()> {

    let json: serde_json::Value = serde_json::from_reader(io::stdin())?;

    serde_yaml::to_writer(io::stdout(), &json)
        .map_err(|e| e.into())
}
