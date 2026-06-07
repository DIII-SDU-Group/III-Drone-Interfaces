builtin_interfaces/Time stamp

uint8 SYSTEM_STATE_UNKNOWN = 0
uint8 SYSTEM_STATE_STOPPED = 1
uint8 SYSTEM_STATE_STARTING = 2
uint8 SYSTEM_STATE_RUNNING = 3
uint8 SYSTEM_STATE_READY = 4
uint8 SYSTEM_STATE_DEGRADED = 5
uint8 SYSTEM_STATE_ERROR = 6

string profile
uint8 system_state
bool daemon_ready
bool runtime_booted
bool system_active
bool ready
bool degraded
string[] degraded_reasons

uint32 managed_node_count
uint32 active_managed_node_count
uint32 service_count
uint32 ready_service_count

iii_drone_interfaces/SubsystemHealthStatus[] subsystems
