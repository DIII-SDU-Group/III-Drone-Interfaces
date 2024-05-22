uint8 DRONE_LOCATION_UNKNOWN = 0
uint8 DRONE_LOCATION_ON_GROUND = 1
uint8 DRONE_LOCATION_IN_FLIGHT = 2
uint8 DRONE_LOCATION_ON_CABLE = 3

iii_drone_interfaces/State state

bool armed
bool offboard

iii_drone_interfaces/Target target
bool target_position_known

uint8 drone_location

int32 on_cable_id

float32 ground_altitude_estimate

bool gripper_open