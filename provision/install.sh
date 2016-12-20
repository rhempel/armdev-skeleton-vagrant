
echo "Install key for external ppa for the gcc-arm-embedded package"

log=$(sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F64D33B0 2>&1)
log=$(sudo add-apt-repository ppa:team-gcc-arm-embedded/ppa 2>&1)

echo "Running apt-get-update "

log=$(sudo apt-get update)

echo "Installing the rest of the tools needed for ARM development"

echo "  - gcc-arm-embedded"
log=$(sudo apt-get -y install gcc-arm-embedded 2>&1)

echo "  - openocd"
log=$(sudo apt-get -y install openocd 2>&1)

echo "  - minicom"
log=$(sudo apt-get -y install minicom 2>&1)


echo "Creating armdev-skeleton repository in /vagrant/src"

cd "/vagrant"

if [ ! -d armdev-skeleton ]; then
    git clone https://github.com/rhempel/armdev-skeleton.git
    cd /vagrant/armdev-skeleton
    git submodule init
    git submodule update
    cd /vagrant/armdev-skeleton/libopencm3
    make
    cd /vagrant/armdev-skeleton
fi
