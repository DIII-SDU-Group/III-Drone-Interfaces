cmake_minimum_required(VERSION 3.5)
project(iii_drone_interfaces)

# Default to C99
if(NOT CMAKE_C_STANDARD)
  set(CMAKE_C_STANDARD 99)
endif()

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

set(msgs
 msg/PowerlineDirection.msg
 msg/Powerline.msg
 msg/ControlState.msg
 msg/ChargerOperatingMode.msg
 msg/ChargerStatus.msg
 msg/GripperStatus.msg
)

set(actions
  action/CableLanding.action
  action/CableTakeoff.action
  action/Takeoff.action
  action/Landing.action
  action/FlyToPosition.action
  action/FlyUnderCable.action
  action/DisarmOnCable.action
  action/ArmOnCable.action
)

set(srvs
  srv/SetGeneralTargetYaw.srv
  srv/GripperCommand.srv
  srv/InitiateCharging.srv
  srv/InterruptCharging.srv
  srv/SetTargetCableId.srv
  srv/ProlongCharging.srv
  srv/DeclareParameter.srv
  srv/GetParameterYaml.srv
  srv/GetDeclaredParameters.srv
  srv/SaveParameters.srv
  srv/GetParameterFiles.srv
  srv/LoadParameters.srv
  srv/SetParameterFromGC.srv
  srv/GetCurrentParameterFile.srv
)

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(geometry_msgs REQUIRED)
find_package(nav_msgs REQUIRED)
find_package(std_msgs REQUIRED)

rosidl_generate_interfaces(${PROJECT_NAME}
  ${msgs}
  ${actions}
  ${srvs}
  DEPENDENCIES geometry_msgs std_msgs nav_msgs
)

ament_package()
