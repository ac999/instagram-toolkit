#!/bin/bash

# Instagram Image Splitter
# This script splits an input image into n equal parts for Instagram carousel posts

# Display usage information
function show_usage {
    echo "Usage: $0 -i <input_image> -n <number_of_parts> [-o <output_prefix>] [-d <output_directory>]"
    echo
    echo "Options:"
    echo "  -i    Input image file"
    echo "  -n    Number of parts to split the image into"
    echo "  -o    Output filename prefix (default: 'insta')"
    echo "  -d    Output directory (default: current directory)"
    echo
    echo "Example: $0 -i landscape.jpg -n 3 -o vacation -d ~/instagram_posts"
    exit 1
}

# Default values
output_prefix="insta"
output_dir="."

# Parse command line arguments
while getopts ":i:n:o:d:" opt; do
    case $opt in
        i) input_image="$OPTARG" ;;
        n) num_parts="$OPTARG" ;;
        o) output_prefix="$OPTARG" ;;
        d) output_dir="$OPTARG" ;;
        *) show_usage ;;
    esac
done

# Check for required arguments
if [ -z "$input_image" ] || [ -z "$num_parts" ]; then
    echo "Error: Input image and number of parts are required."
    show_usage
fi

# Validate number of parts
if ! [[ "$num_parts" =~ ^[0-9]+$ ]] || [ "$num_parts" -lt 1 ]; then
    echo "Error: Number of parts must be a positive integer."
    exit 1
fi

# Check if input image exists
if [ ! -f "$input_image" ]; then
    echo "Error: Input image '$input_image' not found."
    exit 1
fi

# Create output directory if it doesn't exist
if [ ! -d "$output_dir" ]; then
    mkdir -p "$output_dir"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to create output directory '$output_dir'."
        exit 1
    fi
    echo "Created output directory: $output_dir"
fi

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "Error: ImageMagick is not installed. Please install it first."
    echo "On Ubuntu/Debian: sudo apt-get install imagemagick"
    echo "On macOS with Homebrew: brew install imagemagick"
    exit 1
fi

# Get image dimensions
width=$(identify -format "%w" "$input_image")
height=$(identify -format "%h" "$input_image")

echo "Original image dimensions: ${width}x${height}"

# Calculate dimensions for each slice
if [ "$width" -ge "$height" ]; then
    # Landscape or square image - split horizontally
    slice_width=$(( width / num_parts ))
    echo "Splitting horizontally into $num_parts parts of ${slice_width}x${height} pixels each"
    
    for (( i=0; i<num_parts; i++ )); do
        x_offset=$(( i * slice_width ))
        output_file="${output_dir}/${output_prefix}_$(printf "%02d" $(( i + 1 ))).jpg"
        
        convert "$input_image" -crop "${slice_width}x${height}+${x_offset}+0" "$output_file"
        echo "Created: $output_file"
    done
else
    # Portrait image - split vertically
    slice_height=$(( height / num_parts ))
    echo "Splitting vertically into $num_parts parts of ${width}x${slice_height} pixels each"
    
    for (( i=0; i<num_parts; i++ )); do
        y_offset=$(( i * slice_height ))
        output_file="${output_dir}/${output_prefix}_$(printf "%02d" $(( i + 1 ))).jpg"
        
        convert "$input_image" -crop "${width}x${slice_height}+0+${y_offset}" "$output_file"
        echo "Created: $output_file"
    done
fi

echo "Done! Split $input_image into $num_parts parts."
