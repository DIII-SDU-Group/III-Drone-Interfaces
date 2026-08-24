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

include(CTest)

set(msgs
 msg/SimulatorDroneState.msg
 msg/ConductorGeometry.msg
 msg/StaticConductorGeometry.msg
 msg/RadarPointSource.msg
 msg/RadarScanGroundTruth.msg
 msg/CameraConductorVisibility.msg
 msg/CameraFrameGroundTruth.msg
 msg/ProjectionPlane.msg
  msg/Powerline.msg
  msg/PowerlineOverviewStatus.msg
 msg/Pylon.msg
  msg/PylonOverview.msg
  msg/PylonOverviewStatus.msg
 msg/SingleLine.msg
 msg/PLMapperCommand.msg
 msg/ChargerOperatingMode.msg
 msg/ChargerStatus.msg
 msg/GripperStatus.msg
 msg/TrajectoryMode.msg
 msg/State.msg
 msg/Reference.msg
 msg/ManeuverReferenceStream.msg
 msg/ManeuverReferenceAck.msg
 msg/ReferenceTrajectory.msg
 msg/Target.msg
 msg/Waypoint.msg
 msg/CombinedDroneAwareness.msg
 msg/Maneuver.msg
 msg/ManeuverQueue.msg
 msg/StringStamped.msg
 msg/TrajectoryComputeTime.msg
 msg/SubsystemHealthStatus.msg
 msg/SystemHealthStatus.msg
 msg/MissionModeStatus.msg
  msg/MissionModeRegistryEntry.msg
  msg/MissionIntentStatus.msg
 msg/InspectionStartEligibility.msg
 msg/CustomOperationModeStatus.msg
)

set(actions
  action/CableLanding.action
  action/CableTakeoff.action
  action/CableAwareFlyToPosition.action
  action/FlyToPosition.action
  action/FollowWaypointPath.action
  action/FlyToObject.action
  action/Hover.action
  action/HoverByObject.action
  action/HoverOnCable.action
  action/CustomOperation.action
  action/SupervisorStart.action
  action/SupervisorStop.action
  action/SupervisorRestart.action
  action/SupervisorShutdown.action
  action/ModeExecutorAction.action
)

set(srvs
  srv/PLMapperCommand.srv
  srv/SystemCommand.srv
  srv/GripperCommand.srv
  srv/InitiateCharging.srv
  srv/InterruptCharging.srv
  srv/ProlongCharging.srv
  srv/DeclareParameters.srv
  srv/UndeclareParameters.srv 
  srv/GetParameterYaml.srv
  srv/GetDeclaredParameters.srv
  srv/SaveParameters.srv
  srv/GetParameterFiles.srv
  srv/LoadParameters.srv
  srv/SetParameterFromGC.srv
  srv/SetBootParameter.srv
  srv/GetPendingBootParameters.srv
  srv/ActivatePendingBootParameters.srv
  srv/SetGeneralTargetYaw.srv
  srv/SetTargetCableId.srv
  srv/GetCurrentParameterFile.srv
  srv/SetCurrentParameterFileAsDefault.srv
  srv/ComputeReferenceTrajectory.srv
  srv/GetReference.srv
  srv/PauseReferenceStream.srv
  srv/RebaseReferenceStream.srv
  srv/CommitReferenceStream.srv
  srv/ClearManeuverQueue.srv
  srv/RegisterOffboardMode.srv
  srv/GetManagedNodes.srv
  srv/UpdatePowerlineOverview.srv
  srv/GetPowerlineOverview.srv
  srv/StorePylonOverview.srv
  srv/GetPylonOverview.srv
  srv/ClearPylonOverview.srv
  srv/CaptureCurrentPylon.srv
  srv/StartRosbagRecording.srv
  srv/StopRosbagRecording.srv
  srv/GetRosbagRecordingStatus.srv
  srv/StoreCurrentState.srv
  srv/LoadStoredState.srv
  srv/WriteBehaviorTreeModelXML.srv
  srv/OverrideMissionSpecification.srv
)

# find dependencies
find_package(ament_cmake REQUIRED)
find_package(rosidl_default_generators REQUIRED)
find_package(geometry_msgs REQUIRED)
find_package(nav_msgs REQUIRED)
find_package(std_msgs REQUIRED)
find_package(builtin_interfaces REQUIRED)
find_package(rcl_interfaces REQUIRED)

rosidl_generate_interfaces(${PROJECT_NAME}
  ${msgs}
  ${actions}
  ${srvs}
  DEPENDENCIES geometry_msgs std_msgs nav_msgs builtin_interfaces rcl_interfaces
)

if(BUILD_TESTING)
  find_package(ament_cmake_pytest REQUIRED)

  ament_add_pytest_test(iii_drone_interfaces_manifest_test
    test/test_interface_manifest.py
  )
endif()

ament_package()
