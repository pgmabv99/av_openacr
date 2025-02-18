// Copyright (C) 2025 AlgoRND
//
// License: GPL
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.
//
// Target: x2bm_pcap (exe)
// Exceptions: yes
// Header: include/x2bm_pcap.h
//

#include "include/gen/x2bm_pcap_gen.h"
#include "include/gen/x2bm_pcap_gen.inl.h"

namespace x2bm_pcap { 
    // Dear human:
    //     Text from here to the closing curly brace was produced by scanning
    //     source files. Editing this text is futile.
    //     To refresh the contents of this section, run 'update-hdr'.
    //     To convert this section to a hand-written section, remove the word 'update-hdr' from namespace line.

    // -------------------------------------------------------------------
    // cpp/x2bm_pcap/x2bm_pcap.cpp
    //

#pragma pack(push, 1)
struct PcapFileHeader {
    uint32_t magic_number;
    uint16_t version_major;
    uint16_t version_minor;
    int32_t thiszone;
    uint32_t sigfigs;
    uint32_t snaplen;
    uint32_t network;
};
struct PcapPacketHeader;
struct PcapPacketHeader {
    uint32_t ts_sec;
    uint32_t ts_usec;
    uint32_t caplen;
    uint32_t len;
};
#pragma pack(pop)

    algo::tempstr ReversePair(algo::strptr pair);
    void PrintStatsMAC();
    void PrintStatsTCP();
    algo::tempstr ParsePacketMAC(PcapPacketHeader &pkthdr, u_char *pkt);
    algo::tempstr ParsePacketTCP(PcapPacketHeader &pkthdr, u_char *pkt);
    void StoreMACPair(algo::strptr mac_pair_key);
    void StoreTCPPair(algo::strptr mac_pair_key);
    void ProcessPacket(PcapPacketHeader &pkthdr, u_char *pkt);
    void ProcessPcapFile(algo::cstring fname);
    void Main();
}
