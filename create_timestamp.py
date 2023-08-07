numFrames = int(input("Enter frame count: "))
fps = int(input("Enter FPS (frames per second): "))
dirPath = input("Enter directory path name: ")

dir = dirPath + '/timestamp.txt'

with open(dir, 'w') as f:
    for i in range(numFrames):
        timestamp = i / fps
        f.write(f'{timestamp:.3f}\n')
