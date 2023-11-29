import os
import subprocess

def get_latest_file(directory, extension):
    """Returns the latest file of a given extension in the specified directory."""
    files = [os.path.join(directory, f) for f in os.listdir(directory) if f.endswith(extension)]
    if not files:
        return None
    latest_file = max(files, key=os.path.getctime)
    return latest_file

def convert_mkv_to_mp4(mkv_file, mp4_file):
    """Converts an MKV file to MP4 format using ffmpeg."""
    subprocess.run(['ffmpeg', '-i', mkv_file, '-codec', 'copy', mp4_file])

def main():
    directory = '.'  # Current directory
    mkv_file = get_latest_file(directory, '.mkv')
    if mkv_file is None:
        print("No MKV files found in the current directory.")
        return

    base_name = os.path.splitext(mkv_file)[0]
    new_name = input(f"Enter new filename (without extension) or press enter to keep [{base_name}]: ").strip()
    mp4_file = new_name + '.mp4' if new_name else base_name + '.mp4'

    convert_mkv_to_mp4(mkv_file, mp4_file)
    print(f"Converted {mkv_file} to {mp4_file}")

if __name__ == "__main__":
    main()
