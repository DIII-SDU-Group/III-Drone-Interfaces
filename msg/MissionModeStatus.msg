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
string canonical_mission_specification
string active_mission_specification_hash
bool canonical_mission_specification_loaded
string configuration_profile
string mission_specification_load_error
bool mission_active

bool required_modes_registered
string[] required_modes
string[] registered_modes
iii_drone_interfaces/MissionModeRegistryEntry[] modes
iii_drone_interfaces/MissionIntentStatus[] intents
iii_drone_interfaces/InspectionStartEligibility inspection_start_eligibility
string owned_mode
string control_owner

bool ready
bool degraded
string degraded_reason
string[] degraded_reasons
