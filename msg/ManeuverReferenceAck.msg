uint8 STATUS_APPLIED=0
uint8 STATUS_PAUSING=1
uint8 STATUS_STOPPED=2
uint8 STATUS_ACTION_ABORT_READY=3

string stream_id
uint64 last_applied_sequence
builtin_interfaces/Time applied_at
iii_drone_interfaces/State vehicle_state
uint8 consumer_status
string detail
