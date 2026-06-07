builtin_interfaces/Time stamp
builtin_interfaces/Time source_stamp

uint8 STATUS_UNKNOWN = 0
uint8 STATUS_OK = 1
uint8 STATUS_DEGRADED = 2
uint8 STATUS_UNAVAILABLE = 3
uint8 STATUS_ERROR = 4

string subsystem_id
string label
uint8 status
bool ready
bool degraded
string reason
string[] degraded_reasons
string[] dependencies
string owner
