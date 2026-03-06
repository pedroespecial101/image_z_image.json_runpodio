# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# Could not resolve unknown_registry node: MarkdownNote - no aux_id provided; skipping installation
# Could not resolve unknown_registry node: MarkdownNote - no aux_id provided; skipping installation
# Could not resolve unknown_registry node: MarkdownNote - no aux_id provided; skipping installation

# download models into comfyui
ARG HF_API_TOKEN
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image/resolve/main/split_files/diffusion_models/z_image_bf16.safetensors --relative-path models/diffusion_models --filename z_image_bf16.safetensors --set-hf-api-token $HF_API_TOKEN
RUN comfy model download --url https://huggingface.co/Comfy-Org/z_image_turbo/resolve/main/split_files/text_encoders/qwen_3_4b.safetensors --relative-path models/text_encoders --filename qwen_3_4b.safetensors --set-hf-api-token $HF_API_TOKEN
RUN comfy model download --url https://huggingface.co/black-forest-labs/FLUX.1-schnell/resolve/main/ae.safetensors --relative-path models/vae --filename ae.safetensors --set-hf-api-token $HF_API_TOKEN

# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
