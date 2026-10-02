# r21 / WO-2026-09-29-001 simulator-v2 per-radar-instance scan truth (evaluator-only).
# One message per full PointCloud2 of the instance, identical stamp and ordering.
std_msgs/Header header
string radar_instance
string radar_model
string profile_id
string source_topic
uint64 scan_sequence
# Frame schedule: frame index since sim start, frame period and configured offset in the shared frame.
uint64 frame_index
float64 frame_period_s
float64 schedule_offset_s
float64 schedule_jitter_s
float64 schedule_overlap_fraction
float32 noise_rise_db
uint32 candidates
uint32 cells
uint32 false_alarms
geometry_msgs/Pose sensor_pose_world
geometry_msgs/Vector3 sensor_velocity_world
iii_drone_interfaces/RadarDetectionTruthV2[] points
