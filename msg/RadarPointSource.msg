uint8 VALID_PHYSICAL_CONDUCTOR=1
uint8 PHANTOM=2
uint8 CLUTTER_NO_PHYSICAL_SOURCE=3
uint8 VALID_PHYSICAL_PYLON=4

# Index in the corresponding PointCloud2 scan.
uint32 source_point_index
uint8 source_class
# Empty only for explicitly classified nonphysical returns.
string physical_conductor_id
# Empty except for `VALID_PHYSICAL_PYLON`; evaluator-only identity for the
# bounded development pylon-return model.
string physical_pylon_id
# Exact point selected by the simulator before any measurement noise.
geometry_msgs/Point ideal_generating_point_world
geometry_msgs/Point ideal_generating_point_sensor
# Geometrically nearest point on the canonical physical centerline.
geometry_msgs/Point nearest_physical_point_world
geometry_msgs/Point nearest_physical_point_sensor
bool generating_point_equals_nearest_point
# Arc-length parameter of the selected physical generating point along its
# polyline conductor. Evaluator-only; never a runtime estimator input.
float64 conductor_parameter_m
# Generating geometry classification, evaluator-only.
uint8 ORTHOGONAL_NEAREST=1
uint8 FOV_LIMITED=2
uint8 generating_geometry_class
# Bitmask of active finite-support boundaries at the selected point.
uint16 AZIMUTH_NEGATIVE=1
uint16 AZIMUTH_POSITIVE=2
uint16 ELEVATION_NEGATIVE=4
uint16 ELEVATION_POSITIVE=8
uint16 MINIMUM_RANGE=16
uint16 MAXIMUM_RANGE=32
uint16 active_support_boundaries
# Distance to the unconstrained closest point on the same conductor curve.
float64 unconstrained_nearest_distance_m
# Acute angle between the generating ray and local conductor tangent.
float64 line_of_sight_tangent_angle_rad
