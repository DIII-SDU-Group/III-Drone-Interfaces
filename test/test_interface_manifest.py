from pathlib import Path
import re


PACKAGE_ROOT = Path(__file__).resolve().parents[1]


def _extract_list(name: str) -> list[str]:
    content = (PACKAGE_ROOT / "CMakeLists.txt").read_text()
    match = re.search(rf"set\({name}\s+(.*?)\)", content, re.DOTALL)
    assert match, f"Could not find CMake list {name}"
    entries = []
    for line in match.group(1).splitlines():
      line = line.strip()
      if line:
          entries.append(line)
    return entries


def test_all_interface_files_are_declared():
    declared = set(_extract_list("msgs") + _extract_list("actions") + _extract_list("srvs"))
    on_disk = {
        str(path.relative_to(PACKAGE_ROOT))
        for path in PACKAGE_ROOT.glob("msg/*.msg")
    } | {
        str(path.relative_to(PACKAGE_ROOT))
        for path in PACKAGE_ROOT.glob("action/*.action")
    } | {
        str(path.relative_to(PACKAGE_ROOT))
        for path in PACKAGE_ROOT.glob("srv/*.srv")
    }

    assert declared == on_disk


def test_package_exports_rosidl_interface_group():
    package_xml = (PACKAGE_ROOT / "package.xml").read_text()
    assert "<member_of_group>rosidl_interface_packages</member_of_group>" in package_xml


def test_interface_package_declares_generation_dependencies():
    package_xml = (PACKAGE_ROOT / "package.xml").read_text()

    for dependency in [
        "<build_depend>rosidl_default_generators</build_depend>",
        "<exec_depend>rosidl_default_runtime</exec_depend>",
        "<test_depend>ament_cmake_pytest</test_depend>",
    ]:
        assert dependency in package_xml


def test_interface_manifest_has_messages_and_services():
    message_files = sorted(path.name for path in (PACKAGE_ROOT / "msg").glob("*.msg"))
    service_files = sorted(path.name for path in (PACKAGE_ROOT / "srv").glob("*.srv"))

    assert "CombinedDroneAwareness.msg" in message_files
    assert "SystemHealthStatus.msg" in message_files
    assert "MissionModeStatus.msg" in message_files
    assert "MissionModeRegistryEntry.msg" in message_files
    assert "CustomOperationModeStatus.msg" in message_files
    assert "SubsystemHealthStatus.msg" in message_files
    assert "ReferenceTrajectory.msg" in message_files
    assert "SystemCommand.srv" in service_files
    assert "UpdatePowerlineOverview.srv" in service_files
    assert "GetMissionCatalog.srv" in service_files
    assert "SelectMissionCatalogEntry.srv" in service_files
    assert len(message_files) >= 10
    assert len(service_files) >= 10


def test_simulation_ground_truth_interfaces_encode_required_alignment_and_classes():
    required = {
        "SimulatorDroneState.msg": [
            "std_msgs/Header header", "string source_link_name",
            "geometry_msgs/Pose pose_world", "geometry_msgs/Twist twist_world",
        ],
        "RadarPointSource.msg": [
            "uint8 VALID_PHYSICAL_CONDUCTOR=1", "uint8 PHANTOM=2",
            "uint8 CLUTTER_NO_PHYSICAL_SOURCE=3", "uint32 source_point_index",
            "string physical_conductor_id", "geometry_msgs/Point ideal_generating_point_world",
            "geometry_msgs/Point nearest_physical_point_world",
        ],
        "RadarScanGroundTruth.msg": ["uint64 scan_sequence", "RadarPointSource[] points"],
        "CameraFrameGroundTruth.msg": [
            "uint64 frame_sequence", "uint32 image_width", "uint32 image_height",
            "CameraConductorVisibility[] conductors",
        ],
        "StaticConductorGeometry.msg": ["ConductorGeometry[] conductors"],
    }
    for filename, fragments in required.items():
        content = (PACKAGE_ROOT / "msg" / filename).read_text()
        for fragment in fragments:
            assert fragment in content


def test_gui_v2_health_messages_cover_required_status_fields():
    required_fields = {
        "SystemHealthStatus.msg": [
            "bool daemon_ready",
            "bool runtime_booted",
            "bool system_active",
            "string[] degraded_reasons",
            "iii_drone_interfaces/SubsystemHealthStatus[] subsystems",
        ],
        "MissionModeStatus.msg": [
            "string active_catalog_id",
            "string catalog_hash",
            "string active_entry_hash",
            "string default_catalog_id",
            "string configuration_profile",
            "bool temporary_override",
            "bool catalog_ready",
            "bool required_modes_registered",
            "iii_drone_interfaces/MissionModeRegistryEntry[] modes",
            "string owned_mode",
            "string control_owner",
        ],
        "MissionModeRegistryEntry.msg": [
            "string mode_key",
            "string display_name",
            "uint8 mode_id",
            "bool mode_id_valid",
            "bool tree_running",
            "bool tree_finished",
            "bool tree_success_valid",
            "string degraded_reason",
        ],
        "CustomOperationModeStatus.msg": [
            "bool custom_operation_modes_registered",
            "string active_operation",
            "string owned_mode",
            "string control_owner",
        ],
        "SubsystemHealthStatus.msg": [
            "builtin_interfaces/Time source_stamp",
            "bool ready",
            "bool degraded",
            "string[] degraded_reasons",
        ],
    }

    for filename, fields in required_fields.items():
        content = (PACKAGE_ROOT / "msg" / filename).read_text()
        for field in fields:
            assert field in content


def test_maneuver_reference_stream_contract_is_explicit():
    required_fields = {
        "ManeuverReferenceStream.msg": [
            "string stream_id",
            "uint64 sequence",
            "builtin_interfaces/Time produced_at",
            "builtin_interfaces/Time valid_until",
            "float64 trajectory_time_s",
            "uint8 state",
            "bool is_valid",
            "iii_drone_interfaces/Reference reference",
        ],
        "ManeuverReferenceAck.msg": [
            "string stream_id",
            "uint64 last_applied_sequence",
            "builtin_interfaces/Time applied_at",
            "iii_drone_interfaces/State vehicle_state",
            "uint8 consumer_status",
        ],
    }
    for filename, fields in required_fields.items():
        content = (PACKAGE_ROOT / "msg" / filename).read_text()
        for field in fields:
            assert field in content

    for filename in [
        "PauseReferenceStream.srv",
        "RebaseReferenceStream.srv",
        "CommitReferenceStream.srv",
    ]:
        assert (PACKAGE_ROOT / "srv" / filename).exists()

    commit_contract = (PACKAGE_ROOT / "srv" / "CommitReferenceStream.srv").read_text()
    assert "string stream_id" in commit_contract
    assert "uint64 prepared_sequence" in commit_contract
