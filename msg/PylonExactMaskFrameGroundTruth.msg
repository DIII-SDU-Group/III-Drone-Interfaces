# Evaluator-only renderer-exact mask metadata for one registered RGB frame.
std_msgs/Header header
string source_image_topic
string exact_instance_mask_topic
uint64 frame_sequence
uint32 image_width
uint32 image_height
string pylon_geometry_revision
string renderer_contract
iii_drone_interfaces/PylonExactMaskVisibility[] pylons
