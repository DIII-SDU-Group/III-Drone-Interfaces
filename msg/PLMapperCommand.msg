# Start: Will start PL mapper. If previosu state was idle (not paused), it will reset anyways.
uint8 PL_MAPPER_CMD_START = 0
# Stop: Will stop PL mapper.
uint8 PL_MAPPER_CMD_STOP = 1
# Pause: Will pause PL mapper, ignoring mmwave data but keep predicting from odometry.
uint8 PL_MAPPER_CMD_PAUSE = 2
# Pause with fixed line: Will pause PL mapper while keeping the estimated position of the fixed line constant relative to the drone.
# The estimated positions of the remaining lines will be computed relative to the fixed line from the inter line positions.
uint8 PL_MAPPER_CMD_PAUSE_WITH_FIXED_LINE = 3

# Command to send to the PL mapper, one of the above.
uint8 command
# Fixed line ID to use when pausing with fixed line.
int32 fixed_line_id
# Reset: If true, will reset the PL mapper, clearing all data.
bool reset