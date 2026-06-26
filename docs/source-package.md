# Source Package

## Samsung Package

- File: `SM-S937B_16_Opensource.zip`
- Local path: `/Users/adams/Downloads/SM-S937B_16_Opensource.zip`
- Size: about 617 MiB
- SHA256:
  `41bf605cc6cc520dd4dfef6459a3c04bdaa889f65379e8c96280412d4894ca3b`

## Package Contents

After extraction:

- `Kernel.tar.gz`
- `Platform.tar.gz`
- `README_Kernel.txt`
- `README_Platform.txt`

Checksums:

- `Kernel.tar.gz`
  `a3256d1a724db941c5f5b452fe5ab537b77dd5e39f7dab8caa6a553c5b52dd66`
- `Platform.tar.gz`
  `f2842d307772ff8e263095de0f222cbc0e5864566c0e942cd233c972e4934636`

## Local Inspection Paths

- Zip extraction:
  `/Users/adams/Documents/New project/s937b_android16_src_inspect`
- Kernel source extraction:
  `/Users/adams/Documents/New project/s937b-android16-gki-resukisu`

## Samsung Build Notes

From `README_Kernel.txt`:

```sh
BUILD_TARGET=psq_eur_openx
export MODEL=$(echo ${BUILD_TARGET} | cut -d'_' -f1)
export PROJECT_NAME=${MODEL}
export REGION=$(echo ${BUILD_TARGET} | cut -d'_' -f2)
export CARRIER=$(echo ${BUILD_TARGET} | cut -d'_' -f3)
export TARGET_BUILD_VARIANT=user

CHIPSET_NAME=sun
export ANDROID_BUILD_TOP=$(pwd)
export TARGET_PRODUCT=perf
export TARGET_BOARD_PLATFORM=gki

RECOMPILE_KERNEL=1 ./kernel_platform/build/android/prepare_vendor.sh sec ${TARGET_PRODUCT}
```

The extracted `build_kernel_GKI.sh` uses:

```sh
./build_kernel_GKI.sh psq_eur_openx user sun
```

