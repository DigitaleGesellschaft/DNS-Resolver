# doh-httpproxy

- `sudo vim /etc/systemd/system/doh-httpproxy@8053.service`


    [Unit]
    Description=DOH HTTP Proxy on 8053
    After=syslog.target network.target
    Before=nginx.target
    
    [Service]
    Type=simple
    ExecStart=/usr/local/bin/doh-httpproxy --upstream-resolver 127.0.0.1 --listen-address=::1 --port 8053
    Restart=always
    User=doh-proxy
    
    [Install]
    WantedBy=multi-user.target


- `sudo vim /etc/systemd/system/doh-httpproxy@8054.service`

    [Unit]
    Description=DOH HTTP Proxy on 8054
    After=syslog.target network.target
    Before=nginx.target
    
    [Service]
    Type=simple
    ExecStart=/usr/local/bin/doh-httpproxy --upstream-resolver 127.0.0.1 --listen-address=::1 --port 8054
    Restart=always
    User=doh-proxy
    
    [Install]
    WantedBy=multi-user.target

- ` sudo systemctl daemon-reload`
- ` sudo systemctl enable doh-httpproxy@8053`
- ` sudo systemctl start doh-httpproxy@8053`
- ` sudo systemctl enable doh-httpproxy@8054`
- ` sudo systemctl start doh-httpproxy@8054`
- ` sudo systemctl status doh-httpproxy@8053`
- ` sudo systemctl status doh-httpproxy@8054`
