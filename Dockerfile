FROM zasdfgbnmsystem/basic

RUN yay -Sy --noconfirm xorg xorg-drivers

USER root
COPY desktop-small /usr/local/share/packages/desktop-small
COPY desktop-small /tmp/desktop-small

USER user
RUN sudo chown -R user:user /tmp/desktop-small
WORKDIR /tmp/desktop-small
RUN makepkg -p ./PKGBUILD --printsrcinfo | awk '{$1=$1};1' | grep -oP '(?<=^depends = ).*' | xargs yay -S --noconfirm
RUN makepkg -i --noconfirm

