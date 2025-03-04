variable "REGISTRY" {
    default = "ghcr.io"
}

variable "REGISTRY_USER" {
    default = "dejaydev"
}

variable "APP" {
    default = "facefusion"
}

variable "RELEASE" {
    default = "3.1.1"
}

variable "CU_VERSION" {
    default = "126"
}

target "default" {
    dockerfile = "Dockerfile"
    tags = ["${REGISTRY}/${REGISTRY_USER}/${APP}:${RELEASE}.post1"]
    args = {
        RELEASE = "${RELEASE}"
        INDEX_URL = "https://download.pytorch.org/whl/cu${CU_VERSION}"
        TORCH_VERSION = "2.6.0+cu${CU_VERSION}"
        XFORMERS_VERSION = "0.0.29.post3+cu${CU_VERSION}"
        FACEFUSION_VERSION = "${RELEASE}"
        FACEFUSION_CUDA_VERSION = "12.6"
        RUNPODCTL_VERSION = "v1.14.4"
    }
}
