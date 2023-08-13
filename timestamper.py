import os
import sys

def main():
    if len(sys.argv) != 3:
        print("Usage: python3 timestamper.py <path_to_images_directory> <path_for_timestamp_file>")
        return

    directory = sys.argv[1]
    ts_path = sys.argv[2]

    image_list = [file[:-4] for file in os.listdir(directory) if file.endswith(".png")]
    image_list.sort()
    ts_full_path = os.path.join(ts_path, "timestamp.txt")
    
    with open(ts_full_path, "w") as file:
        for image_name in image_list:
            file.write(image_name + "\n")

if __name__ == "__main__":
    main()

