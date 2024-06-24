# Start: Will start PL mapper. If previous state was idle (not paused), it will reset anyways.
uint8 PL_MAPPER_CMD_START = 0
# Stop: Will stop PL mapper.
uint8 PL_MAPPER_CMD_STOP = 1
# Pause: Will pause PL mapper, ignoring mmwave data but keep predicting from odometry and updating orientation from pl_dir_computer.
uint8 PL_MAPPER_CMD_PAUSE = 2
# Freeze: Will freeze PL mapper, keeping the estimated positions of the lines constant relative to the drone,
# only predicting from the orientation part of projection plane, but keeping orientation of powerline constant.
uint8 PL_MAPPER_CMD_FREEZE = 3

# Command to send to the PL mapper, one of the above.
uint8 command
# Reset: If true, will reset the PL mapper, clearing all data.
bool reset