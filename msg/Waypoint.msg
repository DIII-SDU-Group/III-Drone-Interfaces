uint8 TRANSITION_STOP=0
uint8 TRANSITION_BLEND=1

geometry_msgs/Point position
float32 yaw
uint8 transition_mode

# Values <= 0 select the action-level/configured default.
float32 blend_radius_m
float32 speed_limit_m_s
