use std::io;
use std::error::Error;
use std::boxed::Box;

type Result<T> = std::result::Result<T, Box<dyn Error>>;

fn main() -> Result<()> {
    let json: serde_yaml::Value = serde_yaml::from_reader(io::stdin())?;
    serde_json::to_writer(io::stdout(), &json)
        .map(|x| { println!(""); x })
        .map_err(|e| e.into())
}
