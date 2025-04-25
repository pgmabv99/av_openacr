struct PartitionData52a { // kafka2.PartitionData52a
    i32    partition_index;   //   0  The partition index.
    i16    error_code;        //   0  The partition level error code.
    i32    leader_id;         //   0  The ID of the current leader or -1 if the leader is unknown.
    i32    leader_epoch;      //   0  The latest known leader epoch.
    bool   vote_granted;      //   false  True if the vote was granted and false otherwise.
    // func:kafka2.PartitionData52a..Ctor
    inline               PartitionData52a() __attribute__((nothrow));
};

struct PartitionData53a { // kafka2.PartitionData53a
    i32   partition_index;   //   0  The partition index.
    i16   error_code;        //   0  The error code for this partition.
    i32   leader_id;         //   0  The ID of the current leader or -1 if the leader is unknown.
    i32   leader_epoch;      //   0  The latest known leader epoch.
    // func:kafka2.PartitionData53a..Ctor
    inline               PartitionData53a() __attribute__((nothrow));
};

struct PartitionData54a { // kafka2.PartitionData54a
    i32   partition_index;   //   0  The partition index.
    i16   error_code;        //   0  The partition level error code.
    i32   leader_id;         //   0  The ID of the current leader or -1 if the leader is unknown.
    i32   leader_epoch;      //   0  The latest known leader epoch.
    // func:kafka2.PartitionData54a..Ctor
    inline               PartitionData54a() __attribute__((nothrow));
};

struct PartitionData55a { // kafka2.PartitionData55a
    u32                        pmask;                  //   0
    i32                        partition_index;        //   0  The partition index.
    i16                        error_code;             //   0  The partition error code.
    algo::cstring              error_message;          // The error message, or null if there was no error.
    i32                        leader_id;              //   0  The ID of the current leader or -1 if the leader is unknown.
    i32                        leader_epoch;           //   0  The latest known leader epoch.
    i64                        high_watermark;         //   0  The high water mark.
    kafka2::ReplicaState55a*   current_voters_elems;   // pointer to elements
    u32                        current_voters_n;       // number of elements in array
    u32                        current_voters_max;     // max. capacity of array before realloc
    kafka2::ReplicaState55a*   observers_elems;        // pointer to elements
    u32                        observers_n;            // number of elements in array
    u32                        observers_max;          // max. capacity of array before realloc
    // func:kafka2.PartitionData55a..AssignOp
    kafka2::PartitionData55a& operator =(const kafka2::PartitionData55a &rhs) __attribute__((nothrow));
    // func:kafka2.PartitionData55a..Ctor
    inline               PartitionData55a() __attribute__((nothrow));
    // func:kafka2.PartitionData55a..Dtor
    inline               ~PartitionData55a() __attribute__((nothrow));
    // func:kafka2.PartitionData55a..CopyCtor
    PartitionData55a(const kafka2::PartitionData55a &rhs) __attribute__((nothrow));
};

struct PartitionData56a { // kafka2.PartitionData56a
    i32    partition_index;         //   0  The partition index.
    i16    error_code;              //   0  The partition level error code.
    i32    leader_id;               //   0  The broker ID of the leader.
    i32    leader_epoch;            //   0  The leader epoch.
    i32*   isr_elems;               // pointer to elements
    u32    isr_n;                   // number of elements in array
    u32    isr_max;                 // max. capacity of array before realloc
    i8     leader_recovery_state;   //   0  1 if the partition is recovering from an unclean leader election; 0 otherwise.
    i32    partition_epoch;         //   0  The current epoch for the partition for KRaft controllers.
    // func:kafka2.PartitionData56a..AssignOp
    kafka2::PartitionData56a& operator =(const kafka2::PartitionData56a &rhs) __attribute__((nothrow));
    // func:kafka2.PartitionData56a..Ctor
    inline               PartitionData56a() __attribute__((nothrow));
    // func:kafka2.PartitionData56a..Dtor
    inline               ~PartitionData56a() __attribute__((nothrow));
    // func:kafka2.PartitionData56a..CopyCtor
    PartitionData56a(const kafka2::PartitionData56a &rhs) __attribute__((nothrow));
};

struct PartitionData73a { // kafka2.PartitionData73a
    i32   partition_index;   //   0  The partition index.
    i16   error_code;        //   0  The partition level error code.
    // func:kafka2.PartitionData73a..Ctor
    inline               PartitionData73a() __attribute__((nothrow));
};

struct PartitionData78a { // kafka2.PartitionData78a
    u32                           pmask;                       //   0
    i32                           partition_index;             //   0  The partition index.
    i16                           error_code;                  //   0  The fetch error code, or 0 if there was no fetch error.
    algo::cstring                 error_message;               // The fetch error message, or null if there was no fetch error.
    i16                           acknowledge_error_code;      //   0  The acknowledge error code, or 0 if there was no acknowledge error.
    algo::cstring                 acknowledge_error_message;   // The acknowledge error message, or null if there was no acknowledge error.
    kafka2::LeaderIdAndEpoch78a   current_leader;              // The current leader of the partition.
    algo::ByteAry                 records;                     // The record data.
    kafka2::AcquiredRecords78a*   acquired_records_elems;      // pointer to elements
    u32                           acquired_records_n;          // number of elements in array
    u32                           acquired_records_max;        // max. capacity of array before realloc
    // func:kafka2.PartitionData78a..AssignOp
    kafka2::PartitionData78a& operator =(const kafka2::PartitionData78a &rhs) __attribute__((nothrow));
    // func:kafka2.PartitionData78a..Ctor
    inline               PartitionData78a() __attribute__((nothrow));
    // func:kafka2.PartitionData78a..Dtor
    inline               ~PartitionData78a() __attribute__((nothrow));
    // func:kafka2.PartitionData78a..CopyCtor
    PartitionData78a(const kafka2::PartitionData78a &rhs) __attribute__((nothrow));
};

struct PartitionData79a { // kafka2.PartitionData79a
    u32                           pmask;             //   0
    i32                           partition_index;   //   0  The partition index.
    i16                           error_code;        //   0  The error code, or 0 if there was no error.
    algo::cstring                 error_message;     // The error message, or null if there was no error.
    kafka2::LeaderIdAndEpoch79a   current_leader;    // The current leader of the partition.
    // func:kafka2.PartitionData79a..Ctor
    inline               PartitionData79a() __attribute__((nothrow));
};

