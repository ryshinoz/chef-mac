# chef-mac

chef

```bash
$ cd /tmp
$ curl -O http://production.cf.rubygems.org/rubygems/rubygems-1.8.10.tgz
$ tar zxf rubygems-1.8.10.tgz
$ cd rubygems-1.8.10
$ sudo ruby setup.rb --no-format-executable
$ sudo gem install chef --no-ri --no-rdoc
```

mysql

```bash
$ unset TMPDIR
$ mkdir -p /usr/local/var/mysql
$ mysql_install_db --verbose --user=`whoami` --basedir="$(brew --prefix mysql)" --datadir=/usr/local/var/mysql --tmpdir=/tmp
```
