
# Sniffer notes

## to show all dependencies

```


++ grep -i ConnectX-6
01:00.0 Ethernet controller [0200]: Mellanox Technologies MT28908 Family [ConnectX-6] [15b3:101b]
81:00.0 Infiniband controller [0207]: Mellanox Technologies MT28908 Family [ConnectX-6] [15b3:101b]
c5:00.0 Ethernet controller [0200]: Mellanox Technologies MT28908 Family [ConnectX-6] [15b3:101b]


./usertools/dpdk-devbind.py --status  &> $HOME/av_openacr/sniffer/devbind.log
sudo dpdk-devbind.py -b igb_uio 0000:c5:00.0
sudo dpdk-devbind.py -b vfio-pci 0000:c5:00.0
sudo dpdk-devbind.py -b vfio-pci 0000:81:00.0
sudo dpdk-devbind.py -b vfio-pci 0000:01:00.0


cd $HOME/spdk/dpdk/app/dumpcap
meson build
ninja -C build


sudo apt update
sudo apt install libisal-dev
sudo apt update
sudo apt install libpcap-dev

$HOME/av_openacr/s_make_dpdk.sh


find $HOME/dpdk -name "*dumpcap*"
find $HOME/dpdk -name "*test-acl*"
./build/app/dumpcap
./app/dumpcap
./doc/guides/tools/dumpcap.rst
avorovich@nj1:~/spdk/dpdk$ 


https://github.com/DPDK/dpdk/blob/main/doc/guides/tools/dumpcap.rst


find $HOME  -name "*rtf.a"

```