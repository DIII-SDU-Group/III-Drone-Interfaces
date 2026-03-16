# III-Drone-Interfaces

`iii_drone_interfaces` defines the ROS interface contract shared across the III packages. It is the transport layer for messages, services, and actions consumed by control, mission, supervision, simulation, the CLI, and ground control.

## Package Role

This package exists to centralize:

- message schemas for state, targets, maneuvers, references, and perception products
- service schemas for configuration, supervision, charging/gripper control, and mission support
- action schemas consumed by supervision and operator tooling

Keeping the interfaces here prevents package-to-package schema drift and makes transport changes explicit.

## Interface Inventory

### Messages

The message set covers several areas:

- control/state: `State`, `Reference`, `ReferenceTrajectory`, `TrajectoryMode`, `TrajectoryComputeTime`
- awareness/mission: `CombinedDroneAwareness`, `Maneuver`, `ManeuverQueue`, `Target`, `StringStamped`
- perception: `ProjectionPlane`, `SingleLine`, `Powerline`, `PLMapperCommand`
- payload/charging: `GripperStatus`, `ChargerStatus`, `ChargerOperatingMode`

### Services

The service layer includes:

- configuration services such as `GetParameterYaml`, `GetDeclaredParameters`, `LoadParameters`, `SaveParameters`, `SetParameterFromGC`
- mission/control services such as `ComputeReferenceTrajectory`, `GetReference`, `SetGeneralTargetYaw`, `SetTargetCableId`
- supervision/system services such as `SystemCommand`, `GetManagedNodes`
- payload/perception services such as `GripperCommand`, `PLMapperCommand`, `UpdatePowerlineOverview`

### Actions

Actions are declared in this package and consumed primarily by the supervision and CLI stack for long-running system-management flows.

## Generation Model

`iii_drone_interfaces` is a pure interface package. It should not contain runtime logic. Its job is to:

- declare interface files
- export the `rosidl_interface_packages` group
- generate code through `rosidl_default_generators`

## Tests

The current test coverage checks:

- every `.msg`, `.srv`, and `.action` file on disk is declared in CMake
- required package metadata and generation dependencies are present
- core interface categories remain available in the manifest

Typical package-only commands:

```bash
colcon build --packages-select iii_drone_interfaces
colcon test --packages-select iii_drone_interfaces --ctest-args --output-on-failure
colcon test-result --verbose
```

## Maintenance Rules

- treat interface changes as cross-package changes
- update downstream adapters/tests when fields are added or renamed
- keep file declarations in sync with `CMakeLists.txt`; the tests enforce this
