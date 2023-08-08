import os

directory = input("Path to images directory: ")
ts_path = input("Path for timestamp .txt file: ")
#directory = "/path/to/images/directory"
# may need to change extension dependent on dataset
# excludes extension from image name
image_list = [file[:-4] for file in os.listdir(directory) if file.endswith(".jpg")]
image_list.sort()
ts_full_path = ts_path + "/timestamp.txt"
with open(ts_full_path, "w") as file:
    for image_name in image_list:
        file.write(image_name + "\n")

