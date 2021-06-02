<div align="center">

# Get SPDX license overview

[![Marketplace](https://img.shields.io/badge/GitHub-Marketplace-green.svg)](https://github.com/marketplace/actions/get-spdx-license-overview) [![Release](https://img.shields.io/github/release/philips-software/spdx-action.svg)](https://github.com/philips-software/spdx-action/releases)

This action will create a SPDX license overview with ORT and SPDX-builder.
> THIS IS AN EXPERIMENTAL ACTION

</div>

## Configuration
You can specify the configuration in a `.spdx-builder.yml` in the root of your project.
See [instructions in philips-software/spdx-builder](https://github.com/philips-software/spdx-builder#including-projects-in-the-spdx-file).

## Environment
This action requires a java environment. (See example)

<!-- action-docs-description -->
## Description

Get SPDX license overview


<!-- action-docs-description -->

<!-- action-docs-inputs -->
## Inputs

| parameter | description | required | default |
| - | - | - | - |
| project | project | `true` | spdx-builder |
| spdx-builder-version | spdx-builder-version | `true` | v0.5.0 |
| ort-version | philipssoftware/ort version | `false` | 2021-03-03 |
| ort-file | Specifies an ort-file to override ORT scanning in this action. | `true` |  |
| scanner-url | scanner-url (license-scanner) | `false` |  |
| upload-url | upload-url (f.e. BOM-bar) | `false` |  |



<!-- action-docs-inputs -->

<!-- action-docs-outputs -->
## Outputs

| parameter | description |
| - | - |
| spdx-file | spdx-license file |
| ort-file | ort-license file |



<!-- action-docs-outputs -->

<!-- action-docs-runs -->
## Runs

This action is an `composite` action.


<!-- action-docs-runs -->

## GitHub workflow

```yml
  - uses: actions/checkout@v2
  - uses: actions/setup-java@v1
    with:
      java-version: '11.0.1'
  - name: Create spdx-file
    id: spdx-builder
    uses: philips-software/spdx-action@v0.6.0
    with:
      project: my-project
  - uses: actions/upload-artifact@v2
    with:
      name: licenses
      path: ${{ steps.spdx-builder.outputs.spdx-file }}
```

## Philips Forest

This module is part of the Philips Forest.

```
                                                     ___                   _
                                                    / __\__  _ __ ___  ___| |_
                                                   / _\/ _ \| '__/ _ \/ __| __|
                                                  / / | (_) | | |  __/\__ \ |_
                                                  \/   \___/|_|  \___||___/\__|

                                                                            CI
```

Talk to the forestkeepers in the `forest`-channel on Slack.

[![Slack](https://philips-software-slackin.now.sh/badge.svg)](https://philips-software-slackin.now.sh)
