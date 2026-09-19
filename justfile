set default-list

# Recipies for compiling & managing the pyo3 module
mod rust './rust/rust.just'

# Check flake.nix
nix-check:
    nix flake check --all-systems

# Show the outputs of flake.nix
nix-show:
    nix flake show --all-systems
