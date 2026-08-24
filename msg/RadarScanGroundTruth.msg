# One message per full radar PointCloud2, with identical timestamp and ordering.
std_msgs/Header header
string source_topic
uint64 scan_sequence
iii_drone_interfaces/RadarPointSource[] points
