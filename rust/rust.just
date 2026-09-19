set default-list

# The system tag for outputted binaries
systag := "$(python ./systag.py)"

# Build the pyo3 module, it's advised to use build instead
[env("PYO3_BUILD_EXTENSION_MODULE", "tallies")]
build-pyo3-mod:
    cargo build

# Remove output directories
clean:
    rm -r out/
    cargo clean

# Gets the python system tag
[script("python")]
tag:
    import sysconfig
    print(sysconfig.get_config_var("EXT_SUFFIX"))

# Moves the rust binary to out/
[linux, private]
copy-to-out: build-pyo3-mod
    mkdir -p out
    cp target/debug/libtallies.so "out/tallies{{systag}}"

# Moves the rust binary to out/
[macos, private]
copy-to-out: build-pyo3-mod
    mkdir -p out
    cp target/debug/libtallies.dylib "out/tallies{{systag}}"

# Moves the rust binary to out/
[windows, private]
copy-to-out: build-pyo3-mod
    mkdir -p out
    cp target/debug/libtallies.dll "out/tallies{{systag}}"

# Lint the rust crate
lint:
    cargo clippy

# Build the module and place it into out/
build: lint copy-to-out


# Open a python shell with the pyo3 module imported
develop: copy-to-out
    cd out; python -i -c "import tallies"
