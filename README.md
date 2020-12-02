## Install Apps Toolkit

data path       | config path    | bin path
--              | --             | --
/opt/data/{app} | /opt/{app}/etc | /opt/{app}/bin


#### Useful commands
```
sudo systemctl start ${app}
sudo systemctl stop ${app}
sudo systemctl status ${app}
sudo systemctl enable ${app}
sudo systemctl disable ${app}
sudo journalctl -u ${app} -f
```
