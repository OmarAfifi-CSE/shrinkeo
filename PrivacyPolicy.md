# Privacy Policy

**Effective Date:** September 2026

Welcome to Shrinkeo! Your privacy is critically important. This Privacy Policy outlines how your data is handled when you use the Shrinkeo desktop application.

## 1. 100% Local Processing
Shrinkeo is an offline desktop application designed to run entirely on your local machine. All video and image compression, processing, filtering, metadata handling, and file exports happen strictly on your local device. 

## 2. No Data Collection or Telemetry
Shrinkeo does not collect, store, transmit, or share any personal information, telemetry data, analytics, network logs, or media files (videos, photos, or audio) with any external servers or third parties. There are zero cloud uploads.

## 3. Embedded Open-Source Tools
Shrinkeo utilizes industry-standard open-source tools embedded directly within the application:
- **FFmpeg & FFprobe:** For video compression, audio normalization/denoising, and media probing.
- **MozJPEG (`cjpeg`):** For JPEG compression and optimization.
- **Google WebP (`cwebp`):** For WebP image encoding.
- **pngquant:** For PNG palette quantization.

All of these tools execute strictly locally as offline subprocesses on your PC and never connect to external servers or the internet.

## 4. Metadata and Photo Privacy
Shrinkeo includes features to strip sensitive EXIF metadata, camera settings, and GPS location coordinates from photos before export. This processing is performed entirely on your device.

## 5. File Permissions
Shrinkeo requires standard local file read and write permissions solely to access the video and image files you explicitly choose to compress and to save your compressed outputs to your chosen folder.

## 6. Windows Shell Integration
The optional Windows Explorer context menu integration operates entirely through local Windows registry keys and local process invocation. It does not send any file information outside your machine.

## 7. Changes to This Policy
If any significant updates are made regarding privacy practices, this document will be updated accordingly.

## 8. Contact
If you have any questions or concerns about this Privacy Policy or the Shrinkeo application, please visit the official GitHub repository: https://github.com/OmarAfifi-CSE/shrinkeo
