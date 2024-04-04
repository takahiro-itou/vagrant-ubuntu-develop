#!/bin/bash  -xue

script_dir="$(dirname "$0")"
vagrant_dir="${script_dir}/../vagrant"

# 所定のディレクトリを、仮想マシンへ転送する用意をする
project_base_dir=$(readlink -f "${script_dir}/..")

env     \
    PROJECT_BASE_DIR="${project_base_dir}"      \
    WORKDIR='/cygdrive/w/Vagrant'               \
    /bin/bash -xue "${vagrant_dir}/common/setup-userdata.sh"    \
    || exit $?

pushd "${vagrant_dir}"
mkdir -p /cygdrive/w/Vagrant/ubuntu-develop/vagrant

time  vagrant destroy -f
time  vagrant up ; echo $?

popd
