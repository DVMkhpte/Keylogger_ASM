# Keylogger ASM

A minimalist keylogger written in x86-64 Assembly for Linux.

It reads raw keyboard events from `/dev/input/event3` and logs the pressed keys into `logs/log`.

## Features

- Direct reading of raw keyboard events (requires root privileges)
- Basic scancode to ASCII decoding (partial AZERTY layout)
- Persistent logging: keystrokes are appended to the log file

## Getting Started

**Build the project:**

```bash
sudo make
```
The binary will be created in bin/keylogger.

**Run the keylogger as root:**

```bash
sudo make run
```
Or

```bash
sudo ./bin/keylogger
```

Keystrokes will be logged (appended) to logs/log.

## Notes
 
- The log file is not erased between runs (append mode).
- The scancode-to-ASCII mapping is partial (AZERTY basic). Edit src/scancodes.inc for your layout if needed.
- The monitored device (/dev/input/event3 by default) must match your keyboard.
- List input devices with ls /dev/input/by-path/
- Or use sudo evtest or cat /proc/bus/input/devices to identify the right device.

## Clean up

```bash
sudo make clean
```

## Disclaimer

This project is for educational purposes only.
Never use such code without explicit permission on machines you do not own.


## About

Made to practice x86-64 assembly, Linux syscalls, buffer management,
and handling raw input events on Linux.


