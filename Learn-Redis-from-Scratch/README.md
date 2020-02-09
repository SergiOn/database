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

