# Instagram Toolkit

![GitHub](https://img.shields.io/badge/license-MIT-blue.svg)
![Shell Script](https://img.shields.io/badge/Shell_Script-121011?style=flat&logo=gnu-bash&logoColor=white)
![ImageMagick](https://img.shields.io/badge/ImageMagick-000000?style=flat&logo=imagemagick&logoColor=white)

A collection of handy scripts for Instagram content creators. Currently featuring an image splitter for carousel posts, with more Instagram-related utilities planned for future development.

## Repository Name: `instagram-toolkit`

## Table of Contents
- [Features](#features)
- [Current Scripts](#current-scripts)
  - [Image Splitter](#image-splitter)
- [Installation](#installation)
- [Usage](#usage)
- [Requirements](#requirements)
- [Future Plans](#future-plans)
- [Contributing](#contributing)
- [License](#license)

## Features

- **Image Splitting**: Automatically split images into equal parts for Instagram carousels
- **Smart Orientation Detection**: Automatically determines best split direction (horizontal/vertical)
- **Custom Naming**: Flexible output naming and directory options
- **Error Handling**: Comprehensive input validation and error messages

## Current Scripts

### Image Splitter

`imageSplitter.sh` - Splits an image into equal parts for Instagram carousel posts.

#### Features:
- Supports both landscape and portrait orientations
- Automatic dimension calculation
- Customizable output filenames and directory
- Progress feedback during processing

## Installation

1. Clone this repository:
```bash
git clone https://github.com/yourusername/instagram-toolkit.git
cd instagram-toolkit
```

2. Make the script executable:
```bash
chmod +x imageSplitter.sh
```

3. Install ImageMagick if you don't have it already:

**On Ubuntu/Debian:**
```bash
sudo apt-get install imagemagick
```

**On macOS (using Homebrew):**
```bash
brew install imagemagick
```

## Usage

Basic usage:
```bash
./imageSplitter.sh -i input.jpg -n 3
```

Advanced usage with options:
```bash
./imageSplitter.sh -i input.jpg -n 4 -o mypost -d ~/instagram_posts
```

### Options:
| Option | Description | Default |
|--------|-------------|---------|
| `-i`   | Input image file (required) | - |
| `-n`   | Number of parts to split into (required) | - |
| `-o`   | Output filename prefix | 'insta' |
| `-d`   | Output directory | Current directory |

Example output files:
```
mypost_01.jpg
mypost_02.jpg
mypost_03.jpg
```

## Requirements

- Bash (v4.0 or later)
- ImageMagick (for image processing)
- Common Linux/macOS utilities

## Future Plans

This repository is intended to grow with more Instagram-related utilities. Planned features include:

- [ ] Instagram story template generator
- [ ] Optimal image resizer for different Instagram formats
- [ ] Hashtag suggestion tool
- [ ] Post scheduling helper
- [ ] Analytics parser for Instagram insights

## Contributing

Contributions are welcome! Please open an issue to discuss your proposed changes or feature additions before submitting a pull request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

**Note**: This project is not affiliated with Instagram or Meta. It's an independent toolkit to help content creators manage their Instagram workflow more efficiently.
