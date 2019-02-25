#!/bin/bash

set -e

echo "Using downloaded netCDF version ${NETCDF_VERSION} with parallel capabilities enabled"
pushd /tmp
wget ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-c-${NETCDF_VERSION}.tar.gz
tar -xzvf netcdf-c-${NETCDF_VERSION}.tar.gz
pushd netcdf-c-${NETCDF_VERSION}
./configure --prefix $NETCDF_DIR --enable-netcdf-4 --enable-shared --disable-dap  --enable-parallel --disable-cdf5
make -j 2
make install
popd
