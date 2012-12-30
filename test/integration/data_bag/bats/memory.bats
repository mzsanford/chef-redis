#!/usr/bin/env bats

@test "redis should be running" {
  [ "$(ps aux | grep redi[s])" ]
}

@test "redis should start on boot" {
  [ "$(chkconfig --list redis-memory | grep 3:on)" ]
}

@test "redis should be listening" {
  [ "$(netstat -plant | grep redis) | grep 7000" ]
}

@test "the config file should be in place" {
  [ -f /etc/redis/memory.conf ]
}

@test "the redis user should be there" {
  [ "$(grep ^redis /etc/passwd)" ]
}

@test "the log directory should be there" {
  [ -d /var/log/redis ]
  [ -f /var/log/redis/memory.log ]
}
