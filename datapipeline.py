import os
import shutil


def copy_images(source_dir, destination_dir, image_extensions=None):
    if image_extensions is None:
        image_extensions = [".jpg", ".jpeg", ".png", ".gif", ".bmp", ".tiff"]

    if not os.path.exists(destination_dir):
        os.makedirs(destination_dir)

    for filename in os.listdir(source_dir):
        _, ext = os.path.splitext(filename)
        if ext.lower() in image_extensions:
            src_path = os.path.join(source_dir, filename)
            dst_path = os.path.join(destination_dir, filename)
            shutil.copy2(src_path, dst_path)
            print(f"Copied: {filename}")


copy_images(
    "/Real-Time Blood Component Count Analysis Using Image Processing and CNN Classification Model with Machine Learning. (FINAL)/test_images",
    "/Real-Time Blood Component Count Analysis Using Image Processing and CNN Classification Model with Machine Learning. (FINAL)/cbc/archive/dataset2-master/dataset2-master/images/TEST",
)
