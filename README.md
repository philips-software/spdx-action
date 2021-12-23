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
| spdx-builder-version | spdx-builder-version | `true` | v0.9.1 |
| mode | Scan mode. Can be 'ort', 'blackduck' or 'tree' | `true` | ort |
| scanner-url | scanner-url (license-scanner) | `false` |  |
| bombase-url | bombase-url (in case of mode: 'tree') | `false` |  |
| upload-url | upload-url (f.e. BOM-bar) | `false` |  |
| ort-version | philipssoftware/ort version (in case of mode: 'ort') | `false` | 2021-11-24 |
| ort-file | Specifies an ort-file to override ORT scanning in this action. (in case of mode: 'ort') | `false` |  |
| tree | file with tree input (in case of mode: 'tree') | `false` |  |
| format | format input (in case of mode: 'tree') | `false` |  |
| blackduck-url | Blackduck url (in case of mode: 'blackduck') | `false` |  |
| blackduck-token | Blackduck token (in case of mode: 'blackduck') | `false` |  |
| blackduck-project | Blackduck project (in case of mode: 'blackduck') | `false` |  |
| blackduck-version | Blackduck version (in case of mode: 'blackduck') | `false` |  |
| optional-arguments | Optional arguments like `--tree`, `--release`, `--force` and `--custom` | `false` |  |
| capture-stdout-file | Capture stdout in a file. When given, this will be used as the filename of the output | `false` |  |



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

Make sure you have a proper `.spdx-builder.yml` file in your project.

### `ORT` mode
```yml
  - uses: actions/checkout@v2
  - uses: actions/setup-java@v1
    with:
      java-version: '11.0.11'
  - name: Create spdx-file
    id: spdx-builder
    uses: philips-software/spdx-action@v0.9.1
    with:
      project: my-project
      mode: ort
  - uses: actions/upload-artifact@v2
    with:
      name: licenses
      path: ${{ steps.spdx-builder.outputs.spdx-file }}
```

### `tree` mode
```yml
  - uses: actions/checkout@v2
  - uses: actions/setup-java@v1
    with:
      java-version: '11.0.11'
  - name: Create tree
    run: |
      npm list --all --production > npm-dependencies.txt
  - name: Create spdx-file
    id: spdx-builder
    uses: philips-software/spdx-action@v0.9.1
     with:
      project: my-project
      mode: 'tree'
      tree: 'npm-dependencies.txt'
      format: 'npm'
      bombase-url: <bombase-url> # Optional
  - uses: actions/upload-artifact@v2
    with:
      name: licenses
      path: ${{ steps.spdx-builder.outputs.spdx-file }}
```

### `blackduck` mode
```yml
  - uses: actions/checkout@v2
  - uses: actions/setup-java@v1
    with:
      java-version: '11.0.11'
  - name: Create spdx-file
    id: spdx-builder
    uses: philips-software/spdx-action@v0.9.1
    with:
      project: my-project
      mode: 'blackduck'
      blackduck-url: <blackduck-url>
      blackduck-token: ${{ secrets.BLACKDUCK_TOKEN }}
      blackduck-project: <project-name>
      blackduck-version: <project-version>
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
