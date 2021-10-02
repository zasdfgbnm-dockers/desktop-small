FROM zasdfgbnmsystem/basic
COPY desktop-small /usr/local/share/packages/desktop-small
RUN yaourt -Sy --noconfirm xorg xorg-drivers
RUN yaourt -Pi --noconfirm /usr/local/share/packages/desktop-small

