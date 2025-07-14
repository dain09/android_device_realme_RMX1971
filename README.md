<!--
#################################################################################
#                          README for Realme 5 Pro (RMX1971)                      #
#                      Maintained by Abdallah Ibrahim (dain09)                    #
#################################################################################
-->

<div align="center">

# **Lineage for the Realme 5 Pro (RMX1971)**

**This is the Unofficial device tree for the Realme 5 Pro, tailored for lineage builds.**

<br>

<p align="center">
  <img src="https://fdn2.gsmarena.com/vv/pics/realme/realme-5-pro-rmx1971-1.jpg" width="400" />
</p>

</div>

---

<!-- Badges -->
<div align="center">
  <img src="https://img.shields.io/badge/Android-15-blue.svg?style=for-the-badge&logo=android" alt="Android Version">
  <img src="https://img.shields.io/badge/ROM-Lineage.svg?style=for-the-badge&logo=evolution-x" alt="ROM Version">
  <img src="https://img.shields.io/badge/Status-Stable-green.svg?style=for-the-badge" alt="Status">
  <img src="https://img.shields.io/badge/Maintainer-dain09-orange.svg?style=for-the-badge" alt="Maintainer">
  <!-- NOTE: Manually update the security patch date monthly -->
  <img src="https://img.shields.io/badge/Security_Patch-2025--07-informational.svg?style=for-the-badge" alt="Security Patch">
</div>

---

### **⚗️ Features & Contents**
<br>

<!-- Section 1: Specifications -->
<details>
  <summary><strong>📱 Device Specifications</strong></summary>
  <br>
  <table>
    <tr>
      <th>Feature</th>
      <th>Specification</th>
    </tr>
    <tr>
      <td>Chipset</td>
      <td>Qualcomm Snapdragon 712 (sdm710-712)</td>
    </tr>
    <tr>
      <td>CPU</td>
      <td>Octa-core (2x2.2 GHz Kryo 360 Gold & 6x1.7 GHz Kryo 360 Silver)</td>
    </tr>
    <tr>
      <td>GPU</td>
      <td>Adreno 616</td>
    </tr>
    <tr>
      <td>Memory (RAM)</td>
      <td>4 / 6 / 8 GB RAM</td>
    </tr>
    <tr>
      <td>Shipped Android</td>
      <td>9.0 (Pie), officially upgradable to 11.0 (R)</td>
    </tr>
    <tr>
      <td>Display</td>
      <td>1080 x 2340 pixels, IPS LCD</td>
    </tr>
    <tr>
      <td>Battery</td>
      <td>Non-removable Li-Po 4035 mAh</td>
    </tr>
  </table>
</details>

<!-- Section 2: Feature Status -->
<details>
  <summary><strong>🛠️ Feature Status</strong></summary>
  <br>
  <ul>
    <li>✅ Boots</li>
    <li>✅ RIL (Calls, SMS, Data)</li>
    <li>✅ Wi-Fi</li>
    <li>✅ Bluetooth</li>
    <li>✅ Camera</li>
    <li>✅ Audio</li>
    <li>✅ Sensors</li>
    <li>✅ GPS</li>
    <li>✅ Fingerprint Sensor</li>
    <li>✅ VoLTE / VoWiFi</li>
  </ul>
  <p><strong>Overall Status:</strong> All features are stable and working correctly.</p>
</details>

<!-- Section 3: Build Instructions -->
<details>
  <summary><strong>👨‍💻 Build Instructions</strong></summary>
  <br>
  <p>To get started, sync the ROM source, then create a local manifest at:</p>
  <p><code>.repo/local_manifests/roomservice.xml</code></p>
  <p>Populate the file with the following content:</p>
  
  ```xml
  <?xml version="1.0" encoding="UTF-8"?>
  <manifest>
      <!-- Device Tree -->
      <project name="dain09/android_device_realme_RMX1971" path="device/realme/RMX1971" remote="github" revision="los-22.2" />
      <!-- Kernel Tree -->
      <project name="dain09/android_kernel_realme_sdm710" path="kernel/realme/sdm710" remote="github" revision="14-r5p" />
      <!-- Vendor Tree -->
      <project name="dain09/vendor_realme_RMX1971" path="vendor/realme/RMX1971" remote="github" revision="15" />
  </manifest>
  ```
  <p>Afterward, run <code>repo sync</code> again to fetch the trees, then proceed with the standard build commands for your ROM.</p>
</details>

---

### **✒️ Maintained By**

*   **Abdallah Ibrahim** ([dain09 on GitHub](https://github.com/dain09))
*   **kaderbava** ([kaderbava on GitHub](https://github.com/kaderbava))
---

### **📜 License**

```text
Copyright (C) 2024 kaderbava
Copyright (C) 2024 Abdallah Ibrahim

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
