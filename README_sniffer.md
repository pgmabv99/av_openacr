
# Sniffer notes

## mount hugepages
sudo mkdir -p /mnt/huge

sudo mount -t hugetlbfs nodev /mnt/huge
## NIC research 

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


sudo dpdk-devbind.py -b vfio-pci 0000:01:00.0
sudo dpdk-devbind.py --status

# ---- find the interface by PCI adress
avorovich@nj1:~/av_openacr$ ls -l /sys/bus/pci/devices/0000:01:00.0/net/
total 0
drwxr-xr-x 11 root root 0 Feb  2 17:58 data2

avorovich@nj1:~/av_openacr$ ls -l /sys/bus/pci/devices/0000:c5:00.0/net/
total 0
drwxr-xr-x 11 root root 0 Feb  2 17:58 data0

avorovich@nj1:~/av_openacr$ ls -l /sys/bus/pci/devices/0000:81:00.0/net/
total 0
drwxr-xr-x 5 root root 0 Feb  2 17:58 ibI

# -----find current ip
avorovich@nj1:~/av_openacr$ ip addr show | grep -A 3  'data2'
6: data2: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 0c:42:a1:2d:5b:88 brd ff:ff:ff:ff:ff:ff
    inet 192.168.210.51/24 scope global data2
       valid_lft forever preferred_lft forever
    inet6 fe80::e42:a1ff:fe2d:5b88/64 scope link 
       valid_lft forever preferred_lft forever

avorovich@nj1:~/av_openacr$ ip addr show | grep -A 3  'data0'
4: data0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc mq state UP group default qlen 1000
    link/ether 0c:42:a1:66:9d:5e brd ff:ff:ff:ff:ff:ff
    inet 192.168.110.51/24 scope global data0
       valid_lft forever preferred_lft forever
    inet6 fe80::e42:a1ff:fe66:9d5e/64 scope link 
       valid_lft forever preferred_lft forever

avorovich@nj1:~/av_openacr$ ip addr show | grep -A 3  'ibI'
7: ibI: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 2044 qdisc mq state UP group default qlen 256
    link/infiniband 00:00:10:27:fe:80:00:00:00:00:00:00:b8:59:9f:03:00:54:0d:70 brd 00:ff:ff:ff:ff:12:40:1b:ff:ff:00:00:00:00:00:00:ff:ff:ff:ff
    inet 192.168.118.51/24 scope global ibI
       valid_lft forever preferred_lft forever
    inet6 fe80::ba59:9f03:54:d70/64 scope link 
       valid_lft forever preferred_lft forever


#------ note lsof usage
redpanda  3077523            1082  392u  IPv4 3672237      0t0  TCP 192.168.210.51:1092->192.168.210.21:60544 (ESTABLISHED)
redpanda  3077523            1082  498u  IPv4 3586967      0t0  TCP 192.168.110.51:1096->192.168.110.11:44004 (ESTABLISHED)
redpanda  3077523            1082  498u  IPv4 3586967      0t0  TCP 192.168.110.51:1096->192.168.110.11:44004 (ESTABLISHED)


# Bring Down the data2 Interface
sudo ip link set dev data2 down
ip link show data2

# unbind the device
readlink /sys/bus/pci/devices/0000:01:00.0/driver
echo 0000:01:00.0 | sudo tee /sys/bus/pci/devices/0000:01:00.0/driver/unbind

# bind the device via dpdk util
#sudo modprobe vfio-pci  # Ensure vfio-pci module is loaded
sudo dpdk-devbind.py -b vfio-pci 0000:01:00.0
```
 ##  tools and version oc capture code 
 

 ### dumpcap (part of dpdk)
 - needs a primary process
```
sudo apt update
sudo apt install libisal-dev
sudo apt update
sudo apt install libpcap-dev

https://github.com/DPDK/dpdk/blob/main/doc/guides/tools/dumpcap.rst

cpp/atf_snf/dumpcap

```

 ### dpdkcap (separate) https://github.com/dpdkcap/dpdkcap
 - wip

cpp/atf_snf/dpdkcap


 ### 3 version of AI tools in the repo


1. gemini (yours)  using  #include <infiniband/verbs.h>

https://github.com/pgmabv99/arnd/blob/algornd/arnd.513/cpp/atf_snf/dpdkcap/src/test_mlx5_gemini.c

2. chatGPT(mine) using  #include <infiniband/verbs.h>

https://github.com/pgmabv99/arnd/blob/algornd/arnd.513/cpp/atf_snf/dpdkcap/src/test_mlx5_gpt.c

3. ChatGPT using higher level RDMA API #include <rdma/rdma_cma.h> (that is used by x2net !!)

https://github.com/pgmabv99/arnd/blob/algornd/arnd.513/cpp/atf_snf/dpdkcap/src/test_mlx5_rdma_gpt.c
