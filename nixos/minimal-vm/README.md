## HackTheBox
When connecting through OpenVPN, only one machine can be routed at a given point. Trying to connect on both host machine & VM would fail. To fix, open SSH SOCKS5 tunnel on host machine:

```bash
ssh -N -D 127.0.0.1:1080 cirno@192.168.122.170
```

### Firefox
- Access `about:preferences#connectionSecurity` and click `Configure proxy`, or follow `Settings -> Privacy & Security -> Connection and software security -> Advanced settings -> Proxy settings -> Configure proxy`.
- Fill:
    - SOCKS Host: `127.0.0.1`
    - Port: `1080`
    - Select `SOCKS v5` and `Proxy DNS when using SOCKS v5`

Main host be able to established connection to HTB's machines.
