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
    assert "ReferenceTrajectory.msg" in message_files
    assert "SystemCommand.srv" in service_files
    assert "UpdatePowerlineOverview.srv" in service_files
    assert len(message_files) >= 10
    assert len(service_files) >= 10
