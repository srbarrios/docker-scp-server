# docker-scp-server

SSH server which allows SCP, SFTP and SSH access.

## Running

1) Put your authorized keys in an ENV variable and run the image:

    ```bash
    AUTHORIZED_KEYS=$(base64 -w0 my-authorized-keys)

    docker run -dit \
      -e AUTHORIZED_KEYS=$AUTHORIZED_KEYS \
      -p <PORT>:22 \
      -v <DATADIR>:/home/data \
      -v <HOSTKEYDIR>:/var/local/etc/ssh \
      srbarrios/docker-scp-server
    ```

    Alternatively, mount your `authorized_keys` file into the container at `/run/secrets/authorized_keys`:

    ```bash
    docker run -dit \
      -v /path/to/my/authorized_keys:/run/secrets/authorized_keys \
      -p <PORT>:22 \
      -v <DATADIR>:/home/data \
      -v <HOSTKEYDIR>:/var/local/etc/ssh \
      srbarrios/docker-scp-server
    ```

2) Now you can copy into the container (e.g. via scp) as the `data` user:

    ```bash
    scp -P <PORT> <FILE> data@<DOCKER-HOST>:
    ```
