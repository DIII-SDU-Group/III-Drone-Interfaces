# r21 / WO-2026-09-29-001 simulator-v2 (AOP modes) evaluator-only truth for one detection.
# Never a runtime input.  Point-aligned with the instance's full PointCloud2 (same order/stamp).
uint8 MECHANISM_NONE=0
uint8 MECHANISM_CONDUCTOR_SPECULAR=1
uint8 MECHANISM_CONDUCTOR_DIFFUSE=2
uint8 MECHANISM_PYLON=3
uint8 MECHANISM_TERRAIN=4
uint8 MECHANISM_STRUCTURE=5
uint8 MECHANISM_FALSE_ALARM=6
uint8 MECHANISM_MULTIPATH_GHOST=7

uint32 source_point_index
# Dominant generating mechanism of the detected cell cluster.
uint8 mechanism
# RadarPointSource source_class convention: 1 conductor, 2 phantom (ghost), 3 clutter/no physical source, 4 pylon.
uint8 source_class
string physical_conductor_id
string physical_pylon_id
# Conductor index / pylon index of the strongest scatterer, -1 otherwise.
int32 source_index
float32 dominant_power_fraction
uint16 scatterers_in_cell
# Strongest scatterer of the detected cluster before measurement noise.
geometry_msgs/Point ideal_point_world
geometry_msgs/Point ideal_point_sensor
# Arc length of the generating conductor scatterer (NaN if not a conductor).
float64 conductor_parameter_m
float32 two_way_gain_db
float32 mean_snr_db
int32 range_bin
int32 doppler_bin
