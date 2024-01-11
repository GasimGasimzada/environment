# Set up cache env vars
setx /M npm_config_cache D:\.cache\npm
setx /M VCPKG_DEFAULT_BINARY_CACHE D:\.cache\vcpkg
setx /M PIP_CACHE_DIR D:\.cache\pip
setx /M CARGO_HOME D:\.cache\cargo
setx /M YARN_CACHE_FOLDER D:\.cache\yarn
setx /M NUGET_PACKAGES D:\.cache\.nuget
pnpm config set store-dir D:\.cache\pnpm
