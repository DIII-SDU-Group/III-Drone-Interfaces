uint8 STATE_ACTIVE=0
uint8 STATE_PREPARED=1
uint8 STATE_PAUSED=2

string stream_id
uint64 sequence
builtin_interfaces/Time produced_at
builtin_interfaces/Time valid_until
float64 trajectory_time_s
string provider
uint8 state
bool is_valid
iii_drone_interfaces/Reference reference
