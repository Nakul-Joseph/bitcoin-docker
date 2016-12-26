# bitcoin-docker
Docker Repo for Bitcoind.

## Usage Instructions

**Mandatory Requirement**: Must use a local mount volume and config file.

Example:

```
sudo docker run -it --name=bitcoin-docker \   
-v /path/to/local/bitcoin/dir:/opt/bitcoin \   
-p 127.0.0.1:8332 sreekanthgs/bitcoin-docker:latest
```

**Config file is read from**: `/opt/bitcoin/bitcoind.conf`, i.e., `/path/to/local/bitcoin/dir/bitcoind.conf`

##Storing of Data

You can store data within `/opt/bitcoin/data` or any directory within `/opt/bitcoin`.

This will inturn store your data within `/path/to/local/bitcoin/dir` described above. 

Hence, to store within a different local dir, create a hard symlink for any other directory inside `/path/to/local/bitcoin/dir` and then use that directory as `datadir` in `bitcoind.conf`

###Example

If your host directory is `/usr/local/bitcoin` and want to store data in `/var/bitcoin`, do the following:

```
mkdir -p /usr/local/bitcoin
mkdir -p /var/bitcoin
ln -s /var/bitcoin /usr/local/bitcoin/data
```

and use `/opt/bitcoin/data` as your data dir inside the `bitcoind.conf`

```
#bitcoind.conf
datadir=/opt/bitcoin/data
```
