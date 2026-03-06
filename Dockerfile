# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# Could not resolve unknown_registry node: MarkdownNote - no aux_id provided; skipping installation
# Could not resolve unknown_registry node: MarkdownNote - no aux_id provided; skipping installation
# Could not resolve unknown_registry node: MarkdownNote - no aux_id provided; skipping installation

# NOTE:
# We are no longer downloading any models in the image.
# Models (e.g. Comfy-Org/z_image) are provided via RunPod cached models.
# Set the cached model in RunPod endpoint settings: Model = Comfy-Org/z_image

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
