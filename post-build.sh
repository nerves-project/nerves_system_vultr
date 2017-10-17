#!/bin/sh

set -e

if [ -z $TARGET_DIR ]; then
    echo "Uh oh, TARGET_DIR isn't set. That's weird."
    exit 1
fi

# Create the Grub environment blocks
grub-editenv $BINARIES_DIR/grubenv_a create
grub-editenv $BINARIES_DIR/grubenv_a set boot=0
grub-editenv $BINARIES_DIR/grubenv_a set validated=0
grub-editenv $BINARIES_DIR/grubenv_a set booted_once=0

grub-editenv $BINARIES_DIR/grubenv_b create
grub-editenv $BINARIES_DIR/grubenv_b set boot=1
grub-editenv $BINARIES_DIR/grubenv_b set validated=0
grub-editenv $BINARIES_DIR/grubenv_b set booted_once=0

cp $BINARIES_DIR/grubenv_a $BINARIES_DIR/grubenv_a_valid
grub-editenv $BINARIES_DIR/grubenv_a_valid set booted_once=1
grub-editenv $BINARIES_DIR/grubenv_a_valid set validated=1

cp $BINARIES_DIR/grubenv_b $BINARIES_DIR/grubenv_b_valid
grub-editenv $BINARIES_DIR/grubenv_b_valid set booted_once=1
grub-editenv $BINARIES_DIR/grubenv_b_valid set validated=1

# Copy MBR boot code boot.img
cp $HOST_DIR/usr/lib/grub/i386-pc/boot.img $BINARIES_DIR

# UDev Mods
# Remove rules to enforce predictable net names
rm -f $TARGET_DIR/lib/udev/rules.d/75-net-description.rules

# Remove the Buildroot-generated grub.cfg so avoid confusion.
# We put our grub in the FAT filesystem at the beginning of the
# disk so that it exists across firmware updates.
rm -fr $TARGET_DIR/boot/grub

# Run the common post-build processing for nerves
$BR2_EXTERNAL_NERVES_PATH/board/nerves-common/post-build.sh $TARGET_DIR
