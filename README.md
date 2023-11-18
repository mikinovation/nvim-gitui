# nvim-gitui

`nvim-gitui` is a Neovim plugin that enables seamless integration between Gitui and Neovim. By combining the powerful Git repository management features of Gitui with the comfortable editing environment of Neovim, this plugin streamlines your development workflow.

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [Using packer.nvim](#using-packernvim)
  - [Using dein.vim](#using-deinvim)
- [Setup](#setup)
- [Configuration Example](#configuration-example)
- [License](#license)

## Features

- Execute Gitui commands directly from Neovim.
- Visualize Git operations within Neovim.
- Enhance efficiency in managing your Git repositories.

## Prerequisites

- Neovim version 0.8 or higher.
- Gitui installed on your system.

## Installation

`nvim-gitui` can be easily installed using the following plugin managers:

### Using packer.nvim

```lua
use 'mikinovation/nvim-gitui'
```

### Using dein.vim

```toml
[[plugins]]
repo = 'mikinovation/nvim-gitui'
```

## Setup

To enable `nvim-gitui`, add the following code to your `init.lua` file:

```lua
require('nvim-gitui').setup {}
```

## Configuration Example

Here is an example configuration for `nvim-gitui`:

```lua
-- Detailed configurations will be added soon
```

## License

Licensed under the [MIT](LICENSE) license.
