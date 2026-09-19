use pyo3::pymodule;

#[pymodule(name = "tallies")]
pub mod tallies {
    use pyo3::pyfunction;

    #[pyfunction]
    fn double(x: i32) -> i32 {
        x * 2
    }

    #[pyfunction]
    fn div(x: i32, y: i32) -> i32 {
        x / y
    }
}
