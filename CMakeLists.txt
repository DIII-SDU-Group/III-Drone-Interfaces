cmake_minimum_required(VERSION 3.5)
project(iii_interfaces)

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

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(geometry_msgs REQUIRED)
find_package(nav_msgs REQUIRED)
find_package(std_msgs REQUIRED)

rosidl_generate_interfaces(${PROJECT_NAME}
  "msg/PowerlineDirection.msg"
  "msg/Powerline.msg"
  "msg/ControlState.msg"
  "msg/CableDrumInfo.msg"
  "action/CableLanding.action"
  "action/CableTakeoff.action"
  "action/Takeoff.action"
  "action/Landing.action"
  "action/FlyToPosition.action"
  "action/FlyUnderCable.action"
  "action/FlyAlongCable.action"
  "action/DrumManualRoll.action"
  "action/DoubleCableLanding.action"
  "srv/DrumSetGain.srv"
  "srv/DrumSetMode.srv"
  "srv/DrumSetReference.srv"
  "srv/SetGeneralTargetYaw.srv"
  DEPENDENCIES geometry_msgs std_msgs nav_msgs
)

ament_package()
