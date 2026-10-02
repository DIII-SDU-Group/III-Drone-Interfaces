# Source-time evaluator annotation for the camera frame.  It is intentionally
# separate from conductor ground truth so existing runtime contracts remain
# unchanged.
std_msgs/Header header
string source_image_topic
uint64 frame_sequence
uint32 image_width
uint32 image_height
string pylon_geometry_revision
iii_drone_interfaces/CameraPylonVisibility[] pylons
