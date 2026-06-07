builtin_interfaces/Time stamp

uint8 OPERATION_STATE_UNKNOWN = 0
uint8 OPERATION_STATE_IDLE = 1
uint8 OPERATION_STATE_READY = 2
uint8 OPERATION_STATE_ACTIVE = 3
uint8 OPERATION_STATE_CANCELING = 4
uint8 OPERATION_STATE_COMPLETED = 5
uint8 OPERATION_STATE_DEGRADED = 6
uint8 OPERATION_STATE_ERROR = 7

uint8 operation_state
string operation_state_label
string active_operation
bool operation_active

bool custom_operation_modes_registered
string[] required_modes
string[] registered_modes
string owned_mode
string control_owner
bool cancel_available

bool ready
bool degraded
string degraded_reason
string[] degraded_reasons
