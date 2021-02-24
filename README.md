# Get SPDX license overview

This action will create a spdx license overview with ORT and spdx-builder.

> THIS IS AN EXPERIMENTAL ACTION

## Configuration
You can specify the configuration in a `.spdx-builder.yml` in the root of your project.
See [instructions in philips-internal/spdx-builder](https://github.com/philips-software/spdx-builder#including-projects-in-the-spdx-file).

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
| project | project | `false` | spdx-builder |
| spdx-builder-version | spdx-builder-version | `false` | v0.4.0 |
| scanner-url | scanner-url (license-scanner) | `false` |  |
| ort-version | philipssoftware/ort version | `true` | latest |



<!-- action-docs-inputs -->

<!-- action-docs-outputs -->
## Outputs

| parameter | description |
| - | - |
| spdx-file | spdx-license file |



<!-- action-docs-outputs -->

<!-- action-docs-runs -->

## GitHub workflow

```yml
  - uses: actions/checkout@v2
  - uses: action/setup-java@v1
    with:
      java-version: '11.0.1'
  - name: Create spdx-file
    id: spdx-builder
    uses: philips-software/spdx-action@v0.1.1
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
