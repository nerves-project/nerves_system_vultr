# Vultr Cloud Server
[![Build Status](https://travis-ci.org/nerves-project/nerves_system_vultr.png?branch=master)](https://travis-ci.org/nerves-project/nerves_system_vultr)

This is the base Nerves System configuration for a Vultr cloud server. It is close to a generic x86_64
configuration and should be useful for other cloud server images.

| Feature              | Description                     |
| -------------------- | ------------------------------- |
| CPU                  | Intel                           |
| Memory               | 512 MB+ DRAM                    |
| Storage              | Virtio (/dev/vda)               |
| Linux kernel         | 4.11                            |
| IEx terminal         | VNC display - tty0              |
| Hardware I/O         | None                            |
| Ethernet             | Yes                             |

Nerves images created using this system first need to be install onto a Vultr
server and then they can be upgraded using normal Nerves methods. For an
installer, see
[nerves_vultr_loader](https://github.com/fhunleth/fhunleth-buildroot-experiments/tree/master/board/nerves_vultr_loader).
Instructions TBD.

Please contact me about this if you're really interested in it. I don't
maintain it, and unless you really dig through the code, it's not going
to be obvious how it works. I'm happy to help if you're really interested.

## Installation

Add `nerves_system_vultr` to your list of dependencies in mix.exs:

```
  def deps do
    [{:nerves_system_vultr, "~> 0.1"}]
  end
```
