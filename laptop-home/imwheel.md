# Enable imwheel

Firstly we have to create `~/.imwheelrc` file and write a name of application
such as `google-chrome-unstable`. To correctly determine the name of the 
application, we can use the `xprop` then find `WM_CLASS(STRING)` line and read
name of application

```sh  
# Speed up scrolling for chromium and pass unchanged for zoom
"^google-chrome-unstable$"
    None, Up, Button4, 4
    None, Down, Button5, 4
    Shift_L,   Up,   Shift_L|Button4, 4
    Shift_L,   Down, Shift_L|Button5, 4
    Control_L, Up,   Control_L|Button4
    Control_L, Down, Control_L|Button5
```

Then we have to create `~/.config/systemd/user/imwheel.service` file with such
content

```sh
[Unit]
Description=IMWheel
Wants=display-manager.service
After=display-manager.service

[Service]
Type=simple
Environment=XAUTHORITY=%h/.Xauthority
ExecStart=/usr/bin/imwheel -d
ExecStop=/usr/bin/pkill imwheel
RemainAfterExit=yes

[Install]
WantedBy=graphical-session.target
```
After all we have to enable daemon

```sh
systemctl --user daemon-reload
systemctl --user enable --now imwheel
journalctl --user --unit imwheel 
```