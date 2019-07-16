# Wine on Docker

Wine + x11vnc example

## Usage

```sh
$ docker build -t wine-test .
$ docker run -d --rm -p 5900:5900 wine-test
```

Connect to `vnc://localhost:5900` on your VNC client with password: `1234`.

![demo](demo.png)
