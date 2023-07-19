echo "Install needed packages"
sleep 2
pkg up -y && pkg i -y x11-repo && pkg i -y proot-distro pulseaudio termux-x11-nightly
cat <<EOF > ~/../usr/etc/proot-distro/bookworm-qt.sh
DISTRO_NAME='Bookworm (bookworm lxqt)'
TARBALL_URL['aarch64']="https://archive.org/download/bookworm-qt/bookworm-qt.tar.xz"
TARBALL_SHA256['aarch64']="53ff9b3dec86937f67ab9f2528b4b1e4397f5eebb650c53f1758f03e0e67b39b"
EOF
echo "proot-distro login bookworm-qt --shared-tmp --bind /dev/null:/proc/sys/kernal/cap_last_cap" >>~/../usr/bin/bookworm-qt
chmod +x ~/../usr/bin/bookworm-qt
proot-distro install bookworm-qt

