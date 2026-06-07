builtin_interfaces/Time stamp

uint8 MISSION_STATE_UNKNOWN = 0
uint8 MISSION_STATE_IDLE = 1
uint8 MISSION_STATE_READY = 2
uint8 MISSION_STATE_ACTIVE = 3
uint8 MISSION_STATE_PAUSED = 4
uint8 MISSION_STATE_COMPLETED = 5
uint8 MISSION_STATE_DEGRADED = 6
uint8 MISSION_STATE_ERROR = 7

uint8 mission_state
string mission_state_label
string active_mission_specification
bool mission_active

bool required_modes_registered
string[] required_modes
string[] registered_modes
string owned_mode
string control_owner

bool ready
bool degraded
string degraded_reason
string[] degraded_reasons
