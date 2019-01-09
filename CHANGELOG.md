# Changelog

## v0.3.0

**Host requirements**

Building firmware using this system requires `fwup` to be updated on your
host computer to at least `v1.2.5`. The target minimum version requirement
has not changed from `0.15.0`.

**Serial numbers**

Device serial numbers are now set using `NERVES_SERIAL_NUMBER` instead of
`SERIAL_NUMBER`. This is to reduce ambiguity on the source of the serial
by name spacing it along side other Nerves variables. The U-Boot environment
key has also changed from `serial_number` to `nerves_serial_number`. The
erlinit.config has been updated to provide backwards compatibility for setting
the hostname from the serial number by checking for `nerves_serial_number`
and falling back to `serial_number`.

**Custom provisioning**

Provisioning data is applied at the time of calling the `fwup` task `complete`.
The `complete` task is executed when writing the firmware to the target disk.
During this time, `fwup` will include the contents of a provisioning file
located at `${NERVES_SYSTEM}/images/fwup_include/provisioning.conf`. By default,
this file only sets `nerves_serial_number`. You can add additional provisioning
data by overriding the location of this file to include your own by setting
the environment variable `NERVES_PROVISIONING`. If you override this variable
you will be responsible for also setting `nerves_serial_number`.

* Updated dependencies
  * [nerves_system_br v1.6.5](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.6.5)
  * Erlang 21.2.2
  * boardid 1.5.2
  * erlinit 1.4.9
  * OpenSSL 1.1.1a
  * Linux 4.18

* Enhancements
  * Moved boardid config from inside erlinit.config to /etc/boardid.config

## v0.2.1

* Fix up toolchain references

## v0.2.0

* Switch from glibc to muslc to reduce image size
* Update to nerves_system_br v0.14.0

## v0.1.0

* Initial release
