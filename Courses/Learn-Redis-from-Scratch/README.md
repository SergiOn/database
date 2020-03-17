# Learn Redis from Scratch

## Commands

```bash
redis-server

redis-cli
ping
KEYS *

SET foo 100
GET foo
INCR foo
DECR foo

SET bar 200
EXISTS bar
> 1 or 0
DEL bar

redis-cli ECHO hello

monitor
KEYS *
FLUSHALL
KEYS *

SET server:name myserver
GET server:name
SET server:port 6379
GET server:port

SET resource:foo hello
GET resource:foo
EXPIRE resource:foo 120
GET resource:foo
TTL resource:foo
```
```bash
MSET key1 "Hello" key2 "World"
GET key1
GET key2
MGET key1 key2

MSETNX key3 "Test"
MSETNX key4 "something" key3 "Testing"
GET key3
> "Test"
GET key4
> nil

SET greeting "Hello"
GET greeting
APPEND greeting " World"
GET greeting

RENAME greeting greet
GET greet

RENAMENX key1 mykey
> 1
GET key1
GET mykey
RENAMENX key2 mykey
> 0

SET mystring "This is my string"
GETRANGE mystring 0 -1
GETRANGE mystring 0 5

GETSET key1 "New Value"
GET key1

FLUSHALL

SET key1 "hello"
EXPIRE key1 10
TTL key1
GET key1

SETEX key1 20 "hello"
TTL key1
GET key1

PSETEX key1 5000 "hello"
TTL key1
PTTL key1

SETEX key1 120 "hello"
TTL key1
PERSIST key1
TTL key1
> -1

SETNX newkey "foobar"
> 1
SETNX newkey "foobar 2"
> 0
GET newkey
```
```bash
MSET key1 "1" key2 "2" key3 "3" key4 "4" key5 "5" key6 "6" key7 "7" key8 "8" key9 "9" key10 "10" key11 "11" key12 "12" key13 "13"
SCAN 0
SCAN 3
SCAN 0 COUNT 5
SCAN 0 COUNT 50
SCAN COUNT 100
SCAN 0 MATCH key1*
SCAN 3 MATCH key1*
SCAN 0 MATCH key1* COUNT 2
SCAN 0 MATCH key1* COUNT 20
KEYS *
KEYS key1*
RANDOMKEY
```
```bash
CONFIG GET port
CONFIG GET *
CONFIG GET *max-*-entries*
CONFIG GET lua-time-limit
CONFIG SET lua-time-limit 6000
INFO
INFO cpu
COMMAND
COMMAND INFO GET
COMMAND COUNT
CLIENT LIST
CLIENT SETNAME foo
CLIENT SET NAME bar
CLIENT GETNAME
CLIENT KILL 127.0.0.1:xxxxx
```
```bash
LPUSH friends "Bob"
LPUSH friends "Fred"
RPUSH friends "Tony"
LRANGE friends 0 -1
LRANGE friends 1 2
LLEN friends
LPOP friends
RPOP friends
LRANGE friends 0 -1
LPUSH friends "Sam"
LPUSH friends "Joe"
LRANGE friends 0 -1
LINSERT friends BEFORE "Bob" "Kevin"
LRANGE friends 0 -1
```
```bash
SADD carmakes "Toyota"
SADD carmakes "Ford"
SADD carmakes "Chevy"
SADD carmakes "Honda"
SREM carmakes "Honda"
SISMEMBER carmakes "Honda"
SISMEMBER carmakes "Hondas"
SMEMBERS carmakes
SADD carmakes "Honda"
SMEMBERS carmakes
SCARD carmakes
SADD mycars "Acura"
SMOVE carmakes mycars "Toyota"
SMEMBERS mycars
SMEMBERS carmakes
SRANDMEMBER carmakes
SPOP carmakes
```
```bash
ZADD people 1970 "John Doe"
ZADD people 1985 "Sam Smith"
ZADD people 1990 "Jen Williams"
ZRANGE people 0 -1
ZRANGEBYSCORE people 1970
ZRANK people "Sam Smith"
ZRANK people "John Doe"
ZRANK people "Jen Williams"
ZREVRANK people "Jen Williams"
ZCARD people
ZINCRBY people 1 "John Doe"
ZSCORE peope "John Doe"
```
```bash
HSET user:john name "John Doe"
HGET user:john name
HMSET user:kate name "Kate Smith" email "kate@gmail.com" age "30"
HGET user:kate age
HGET user:kate email
HGET user:kate name
HMGET user:kate name age
HGETALL user:kate
HKEYS user:kate
HVALS user:kate
HINCRBY user:kate age
HVALS user:kate
HDEL user:kate age
HGETALL user:kate
HLEN user:kate
```
```bash
sudo locate *rdb
redis-cli
SET user:john "John Doe"
SET user:mary "Mary Williams"
SET user:jill "Jill Jackson"
SET user:paul "Paul Harris"
SET user:mike "Mike SMith"
SET user:derek "Derek Hanlon"
SAVE
exit

sudo cp /var/lib/redis/dump.rdb /home/YOURUSER/redis-backup
sudo nano /home/brad/redis/redis-backup

sudo apt-get install -y rdiff-backup
sudo rdiff-backup --preserve-numerical-ids /var/lib/redis /home/YOURUSER/redis
sudo crontab -e
2

//SETUP DAILY BACKUP
0 0 * * * rdiff-backup --preserve-numerical-ids --no-file-statistics /var/lib/redis /home/YOURUSER/redis

redis-cli
SET user:mike "Mike Wells"
exit
sudo rdiff-backup --preserve-numerical-ids /var/lib/redis /home/YOURUSER/redis
sudo nano /home/brad/redis/dump.rdb

//ENABLE AOF
BGREWRITEAOF
info
//Scroll to the Persistence section, and check that the aof entries match what's shown here. If aof_rewrite_in_progress is 0, then the recreation of the AOF file has completed
exit
ls /var/lib/redis
sudo service redis-server stop
sudo nano /etc/redis/redis.conf
appendonly yes
sudo service redis-server start
sudo rdiff-backup --preserve-numerical-ids /var/lib/redis /home/YOURUSER/redis
redis-cli
SET user:tom "Tom Doe"
exit
sudo rdiff-backup --preserve-numerical-ids /var/lib/redis /home/YOURUSER/redis
```

