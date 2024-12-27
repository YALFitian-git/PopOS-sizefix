sudo add-apt-repository ppa:elementary-os/daily
sudo apt update
sudo apt install git elementary-sdk libgnomekbd-dev libpwquality-dev libdistinst-dev
sudo apt build-dep distinst
git clone https://github.com/adamd9/installer.git
git clone https://github.com/adamd9/distinst.git
cd distinst
git checkout sector-size-fix
make
sudo make install prefix=/usr
cd ../installer
git checkout sector-size-fix
meson build --prefix=/usr
cd build
ninja
sudo ninja install
sudo killall io.elementary.installer-daemon
sudo io.elementary.installer &
