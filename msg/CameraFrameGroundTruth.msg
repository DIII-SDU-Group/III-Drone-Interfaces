# Per-image conductor visibility summary paired with the mono16 instance mask.
std_msgs/Header header
string source_image_topic
string instance_mask_topic
uint64 frame_sequence
uint32 image_width
uint32 image_height
iii_drone_interfaces/CameraConductorVisibility[] conductors
