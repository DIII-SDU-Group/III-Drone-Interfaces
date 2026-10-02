# Evaluator-only pylon visibility derived from the source-bound pylon map.
# This message is never a runtime estimator input.
uint8 OUTSIDE_FOV=0
uint8 PROJECTED_VISIBLE=1
uint8 PARTIALLY_CLIPPED=2
uint8 BEHIND_CAMERA=3

string physical_pylon_id
uint8 visibility_state
# False until a renderer-provided per-pylon instance mask is available.  The
# current values below describe the projected 3-D bounding box, not a claimed
# exact mesh silhouette.
bool exact_instance_mask_available
string visibility_method
uint32 projected_bbox_pixel_count
uint32 visible_bbox_pixel_count
float64 visible_bbox_fraction
float64 image_area_fraction
bool has_visible_bounding_box
uint32 min_u
uint32 min_v
uint32 max_u
uint32 max_v
float64 range_m
float64 bearing_rad
float64 clipping_fraction
string occlusion_status
