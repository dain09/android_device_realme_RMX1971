# Copyright (C) 2009 The Android Open Source Project
# Copyright (c) 2011, The Linux Foundation. All rights reserved.
# Copyright (C) 2017-2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import common
import re
import time

# ============================= OTA Hooks =============================

def FullOTA_Assertions(info):
    OTA_Assertions(info)
    return

def IncrementalOTA_Assertions(info):
    OTA_Assertions(info)
    return

def FullOTA_InstallBegin(info):
    info.start_time = time.time()
    PrintSignature(info)
    info.script.Print("⚙️  Flash start time: %s" % time.ctime(info.start_time))
    return

def IncrementalOTA_InstallBegin(info):
    info.start_time = time.time()
    PrintSignature(info)
    info.script.Print("⚙️  Flash start time: %s" % time.ctime(info.start_time))
    return

def FullOTA_InstallEnd(info):
    OTA_InstallEnd(info)
    return

def IncrementalOTA_InstallEnd(info):
    OTA_InstallEnd(info)
    return

# ============================= Helper Functions =============================

def AddImage(info, basename, dest, is_optional=False):
    path = "IMAGES/" + basename
    if path not in info.input_zip.namelist():
        if not is_optional:
            info.script.Print("Warning: {} not found in the package.".format(basename))
        return
    data = info.input_zip.read(path)
    common.ZipWriteStr(info.output_zip, basename, data)
    info.script.Print("Patching {} image unconditionally...".format(dest.split('/')[-1]))
    info.script.AppendExtra('package_extract_file("%s", "%s");' % (basename, dest))

def OTA_Assertions(info):
    info.script.AppendExtra('assert(getprop("ro.device.latest_fw") == "true" || abort("Older firmware detected. Kindly update firmware to realme UI 2 and retry flashing."););')
    info.script.AppendExtra('assert(getprop("ro.product.vendor.device") == "RMX1971" || abort("This package is for device: RMX1971; this device is " + getprop("ro.product.vendor.device") + "."););')
    return

def PrintSignature(info, elapsed=None, final=False):
    if not final:
        info.script.Print("\n==============================")
        info.script.Print("  Build by: Abdallah ibrahim (@D_ai_n)")
        info.script.Print("  Device: realme RMX1971")
        info.script.Print("  Custom Android Build - Enjoy!")
        info.script.Print("  🚀 Flashing with passion and precision! 🚀")
        info.script.Print("  Telegram: t.me/D_ai_n | X: @D_ai_n")
        info.script.Print("==============================\n")
    else:
        info.script.Print("\n==============================")
        info.script.Print("  🎉 Congratulations!")
        info.script.Print("  Your device is now running a unique build by Abdallah ibrahim (@D_ai_n)")
        if elapsed is not None:
            info.script.Print("  Install time: {:.2f} seconds".format(elapsed))
        info.script.Print("  🎊 Enjoy your smooth and powerful experience! 🎊")
        info.script.Print("  For support & updates: t.me/D_ai_n")
        info.script.Print("==============================\n")

def OTA_InstallEnd(info):
    AddImage(info, "dtbo.img", "/dev/block/bootdevice/by-name/dtbo")
    AddImage(info, "vbmeta.img", "/dev/block/bootdevice/by-name/vbmeta")
    AddImage(info, "vbmeta_system.img", "/dev/block/bootdevice/by-name/vbmeta_system", is_optional=True)
    AddImage(info, "vbmeta_vendor.img", "/dev/block/bootdevice/by-name/vbmeta_vendor", is_optional=True)
    elapsed = time.time() - getattr(info, 'start_time', time.time())
    PrintSignature(info, elapsed=elapsed, final=True)
    return