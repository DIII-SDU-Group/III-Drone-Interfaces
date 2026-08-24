uint8 VALID_PHYSICAL_CONDUCTOR=1
uint8 PHANTOM=2
uint8 CLUTTER_NO_PHYSICAL_SOURCE=3

# Index in the corresponding PointCloud2 scan.
uint32 source_point_index
uint8 source_class
# Empty only for explicitly classified nonphysical returns.
string physical_conductor_id
# Exact point selected by the simulator before any measurement noise.
geometry_msgs/Point ideal_generating_point_world
geometry_msgs/Point ideal_generating_point_sensor
# Geometrically nearest point on the canonical physical centerline.
geometry_msgs/Point nearest_physical_point_world
geometry_msgs/Point nearest_physical_point_sensor
bool generating_point_equals_nearest_point
