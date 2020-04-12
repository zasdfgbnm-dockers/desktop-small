FROM zasdfgbnmsystem/basic

USER root
COPY install_netdata_nv_plugin.sh /
COPY sddm.conf /etc/sddm.conf.d/theme.conf

# do a full upgrade first
RUN pacman -Sy --noconfirm archlinuxcn-keyring archlinux-keyring
RUN sudo -u user yaourt -Syua --noconfirm || true

# install all packages
RUN sudo -u user yaourt -Sy --noconfirm xorg xorg-drivers zasdfgbnmsystem-desktop-small

# install netdata_nv_plugin
RUN /install_netdata_nv_plugin.sh

# system settings
RUN systemctl enable libvirtd sddm org.cups.cupsd
RUN sed -i 's/basic/desktop/g' /etc/docker-btrfs.json

COPY sddm.conf /etc/sddm.conf
COPY qemu.conf /etc/libvirt

USER user
