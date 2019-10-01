# Ubuntu16 + Apache

This is a Apache server on Ubuntu 18.

The config is tested with Joomla 3.9.

|  Directory | Description |
|------------|-------------|
| www_config | Apache config files |
| php_config | PHP config files    |
| www_data   | Web files           |

## Start the container
```
$ ./start_container.sh
```
## Test
1. Download and decompress the Joomla package to www_data.
2. Ready a MYSQL server.
3. Use a web browser to start the Joomla installation at your Docker host IP and port 8080. Example: http://192.168.1.200:8080
