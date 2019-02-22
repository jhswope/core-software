#!/bin/bash

set -e
set -v


# See packages.yaml for additional specifications


spack clean


#
# core

CORE_COMPILER='gcc@4.8.5'
CORE_PACKAGES=(
    lmod
    gcc@8.2.0
    #intel@18.0.3
    #intel-parallel-studio@cluster.2018.3
    #pgi@18.4
)
for package in "${CORE_PACKAGES[@]}"
do
    spack install "${package}" "%${CORE_COMPILER}"
done

spack install openmpi %gcc@8.2.0
spack install hdf5 %gcc@8.2.0
spack install netcdf %gcc@8.2.0
spack install parallel-netcdf %gcc@8.2.0

#spack install openmpi %pgi@18.4 "${LOCAL_OPENMPI_DEPS[@]}" "${GCC_OPENMPI_DEPS[@]}"
#spack install openmpi %intel@18.0.3 "${LOCAL_OPENMPI_DEPS[@]}" "${GCC_OPENMPI_DEPS[@]}"

# spack install parallel-netcdf %intel@18.0.3 "${LOCAL_OPENMPI_DEPS[@]}" "${GCC_OPENMPI_DEPS[@]}" ^m4%gcc@8.2.0
# spack install parallel-netcdf %pgi@18.4 "${LOCAL_OPENMPI_DEPS[@]}" "${GCC_OPENMPI_DEPS[@]}" ^m4%gcc@8.2.0

# spack install hdf5 %intel@18.0.3 "${LOCAL_OPENMPI_DEPS[@]}" "${GCC_OPENMPI_DEPS[@]}"
# spack install hdf5 %pgi@18.4 "${LOCAL_OPENMPI_DEPS[@]}" "${GCC_OPENMPI_DEPS[@]}"

# spack install netcdf %intel@18.0.3 "${LOCAL_OPENMPI_DEPS[@]}" "${GCC_OPENMPI_DEPS[@]}" ^m4%gcc@8.2.0
# spack install netcdf %pgi@18.4 "${LOCAL_OPENMPI_DEPS[@]}" "${GCC_OPENMPI_DEPS[@]}" ^m4%gcc@8.2.0


#
# lmod sync

spack module lmod refresh -y
