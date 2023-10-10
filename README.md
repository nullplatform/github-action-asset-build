<h2 align="center">
    <a href="https://nullplatform.com" target="blank_">
        <img height="100" alt="Nullplatform" src="https://nullplatform.com/favicon/android-chrome-192x192.png" />
    </a>
    <br>
    <br>
    Nullplatform Asset Build GitHub Action
    <br>
</h2>

## Overview

The "Nullplatform Asset Build" GitHub Action automates the building of supported asset types on nullplatform. It simplifies the process of creating assets by executing custom build commands and provides flexibility in specifying working directories and output locations.

## Table of Contents

- [Inputs](#inputs)
- [Outputs](#outputs)
- [Usage Examples](#usage-examples)
  - [Use Case 1: Default Build](#use-case-1-default-build)
  - [Use Case 2: Custom Directories](#use-case-2-custom-directories)
  - [Use Case 3: Using a Subdirectory for Build](#use-case-3-using-a-subdirectory-for-build)
  - [Use Case 4: Custom Build Command and Arguments](#use-case-4-custom-build-command-and-arguments)
- [No Dependencies or Commands](#no-dependencies-or-commands)
- [License](#license)

## Inputs

### `command`

- **Description**: The command to be executed for building the assets.
- **Required**: No
- **Default**: `make`

### `arguments`

- **Description**: Additional arguments to be passed along with the build command.
- **Required**: No
- **Default**: `build`

### `options`

- **Description**: Additional options or flags to be used during the build process.
- **Required**: No
- **Default**: `''`

### `checkout-repository`

- **Description**: Checks-out your repository under `$GITHUB_WORKSPACE`, so your workflow can access it.
- **Required**: No
- **Default**: `true`

### `build-working-directory`

- **Description**: The directory where the build process will take place.
- **Required**: No
- **Default**: `.` (current directory)

### `asset-working-directory`

- **Description**: The directory containing source code and assets for the build process.
- **Required**: No
- **Default**: `.` (current directory)

### `asset-output-directory`

- **Description**: The directory where built assets will be output.
- **Required**: No
- **Default**: `build`

### `name`

- **Description**: The name of the asset or project being built.
- **Required**: No
- **Default**: `main`

### `type`

- **Description**: The type of asset to be built, e.g., `docker-image`, `lambda`, etc.
- **Required**: No
- **Default**: `''`

## Outputs

### `asset-id`

- **Description**: The ID of the built asset.

### `asset-name`

- **Description**: The name of the asset built.

### `asset-path`

- **Description**: The path to the built asset.

## Usage Examples

### Use Case 1: Default Build

```yaml
name: Default Build

on:
  push:
    branches:
      - main

jobs:
  build-assets:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4

      - name: Build Asset
        id: build-asset
        uses: nullplatform/github-action-asset-build@v1

      ##
      ## Other steps
      ##
```
In this example, the action will perform a default build using the `make` command in the current directory.

### Use Case 2: Custom Directories

```yaml
name: Custom Directories

on:
  push:
    branches:
      - main

jobs:
  build-assets:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v2

      - name: Build Asset
        id: build-asset
        uses: nullplatform/github-action-asset-build@v1
        with:
          asset-working-directory: path/to/my-application
          asset-output-directory: output
          name: application-asset

      ##
      ## Other steps
      ##
```

In this example, the action will build assets from the `path/to/my-application` directory and output the results to the `output` directory with the name `application-asset`.

### Use Case 3: Using a Subdirectory for Build

```yaml
name: Subdirectory Build

on:
  push:
    branches:
      - main

jobs:
  build-assets:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v2

      - name: Build Asset
        id: build-asset
        uses: nullplatform/github-action-asset-build@v1
        with:
          build-working-directory: path/to/subdirectory

      ##
      ## Other steps
      ##
```

In this example, the action will navigate to the `path/to/subdirectory` for the build process.

### Use Case 4: Custom Build Command and Arguments

```yaml
name: Custom Build Command

on:
  push:
    branches:
      - main

jobs:
  build-assets:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v2

      - name: Build Asset
        id: build-asset
        uses: nullplatform/github-action-asset-build@v1
        with:
          command: npm
          arguments: run build
          options: --prod
          name: custom-asset

      ##
      ## Other steps
      ##
```

In this example, the action will execute a custom build command using `npm` with the arguments `run build` and additional options `--prod`.

## No Dependencies or Commands

Please note that this action does not install any dependencies or commands. It is the user's responsibility to ensure that the required build command and dependencies are available in the execution environment.

## License

This GitHub Action is licensed under the [MIT License](LICENSE).
