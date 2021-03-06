### Keys Command Cheat Sheet

```bash
Set Key value

Get Key

DEL key1 key2 key3 (To delete a key).

EXISTS key1 key2 (To check a key exist or not).

TTL key  (To check time to live).

EXPIRE key 10(in seconds).

PTTL mykey (to check time in millisecond).

PEXPIRE mykey 1500 (Time in Milliseconds).

PERSIST mykey (Remove EXPIRATION from the key)

KEYS a?? (Returns all keys matching pattern)
```
![Keys matching pattern](keys-command.png)
```bash
RANDOMKEY (Return a random key from the currently selected database)

RENAME mykey myotherkey

RENAMENX mykey myotherkey (Renames key to newkey if newkey does not yet exist)

TOUCH key1 key2 (Alters the last access time of a key(s).

UNLINK key1 key2 key3 (The actual removal will happen later asynchronously.)

TYPE key1 (Return Type of Value)

DUMP mykey (Serialize the value stored at key in a Redis-specific format)

RESTORE mykey 0 "\n\x17\x17\x00\x00\x00\x12\x00\x00\x00\x03\x00\”
```


### String Command Cheat Sheet

```bash
APPEND mykey "Hello" (appends the value at the end of the string).

INCR mykey (Increments the number stored at key by one).

INCRBY mykey 5

DECR mykey (Decrements the number stored at key by one.)

DECRBY mykey 3 (Decrements the number stored at key )

INCRBYFLOAT mykey 0.1(Increment the string representing a floating point number)

GETSET mycounter "0" (Atomically sets key to value and returns the old value stored at key)

MSET key1 "Hello" key2 "World" (Sets the given keys to their respective values.)

MGET key1 key2 (Returns the values of all specified keys).

SETNX mykey "Hello" (Set key to hold string value if key does not exist.)

MSETNX key1 "Hello" key2 "there" (Sets the given keys to their respective values.)

GETRANGE mykey 0 3 (Returns the substring of the string value stored at key).

GETRANGE mykey -3 -1. (-1 means the last character and so on).

SETEX mykey 10 "Hello" (Set key to hold the string value and set key to timeout after a given number of seconds.)

PSETEX mykey 1000 "Hello" ( expire time is specified in milliseconds instead of seconds.)

SETRANGE key1 6 "Redis" (Overwrites part of the string stored at key) .

STRLEN mykey ( Returns the length of the string ).
```


### List Command Cheat Sheet

```bash
RPUSH mylist "hello" (Insert all the specified values at the tail of the list stored at key.)

LRANGE mylist 0 -1 (Returns the specified elements of the list stored at key.)

LPUSH mylist "world" (Insert all the specified values at the head of the list stored at key.)

RPUSHX mylist "World" (Inserts value at the tail of the list stored at key, only if key already exists and holds a list.)

LPUSH mylist "World" (Inserts value at the head of the list stored at key, only if key already exists and holds a list.)

RPOP mylist (Removes and returns the last element of the list stored at key.)

LPOP mylist (Removes and returns the first element of the list stored at key.)

LTRIM mylist 1 -1 (Trim an existing list so that it will contain only the specified range of elements specified)

LSET mylist 0 "four" (Sets the list element at index to value.)

LINDEX mylist 0 (Returns the element at index in the list stored at key.)

LINSERT mylist BEFORE "World" "There" (Inserts value in the list stored at key either before or after the reference value pivot.)

LLEN mylist (Returns the length of the list stored at key. )

LREM mylist 2 "hello" (Removes the first count occurrences of elements equal to value from the list stored at key.)
```


### Hashes Command Cheat Sheet

```bash
HSET myhash field1 "Hello".  (Sets field in the hash stored at key to value. If field already exists in the hash, it is overwritten.)

HGET myhash field1 (Returns the value associated with field in the hash stored at key.)


HMSET myhash field1 "Hello" field2 "World" ( Set Multiple values.)

HGETALL myhash  (Returns all fields and values of the hash stored at key.)

HMGET myhash field1 field2 (Returns the values associated with the specified fields in the hash stored at key.)

HEXISTS myhash field1 (Returns if field is an existing field in the hash stored at key.)

HKEYS myhash (Returns all field names in the hash stored at key.)

HLEN myhash (Returns the number of fields contained in the hash stored at key.)

HSETNX myhash field "Hello" (Sets field in the hash stored at key to value, only if field does not yet exist.)

HDEL myhash field1 (Removes the specified fields from the hash stored at key.)

HINCRBY myhash field 1 (Increments the number stored at field in the hash stored at key by increment.)

HINCRBYFLOAT mykey field 0.1 (Increment the specified field of a hash stored at key, and representing a floating point number, by the specified increment.)

HSTRLEN myhash f1 (Returns the string length of the value associated with field in the hash stored at key.)

HVALS myhash (Returns all values in the hash stored at key.)
```


### Sets Command Cheat Sheet

```bash
SADD myset "Hello" Add the specified members to the set stored at key.

SMEMBERS myset (Returns all the members of the set value stored at key.)

SISMEMBER myset "one” (Returns if member is a member of the set stored at key.)


SCARD myset(Returns the set cardinality (number of elements) of the set stored at key.)


SMOVE myset myotherset "two" (Move member from the set at source to the set at destination.)

SPOP myset (Removes and returns one or more random elements from the set value store at key.)

SREM myset "one" (Remove the specified members from the set stored at key.)


SDIFF key1 key (Returns the members of the set resulting from the difference between the first set and all the successive sets.)

SDIFFSTORE key key1 key2(This command is equal to SDIFF, but instead of returning the resulting set, it is stored in destination.)


SINTER key1 key2 (Returns the members of the set resulting from the intersection of all the given sets.)

SINTERSTORE key key1 key2(This command is equal to SINTER, but instead of returning the resulting set, it is stored in destination.)

SUNION key1 key2 (Returns the members of the set resulting from the union of all the given sets.)

SUNIONSTORE key key1 key2(This command is equal to SUNION, but instead of returning the resulting set, it is stored in destination.)

SRANDMEMBER myset 2 ( When called with just the key argument, return a random element from the set value stored at key.)
```


### Sorted Sets Command Cheat Sheet

```bash
ZADD myzset 2 "two" 3 "three" (https://redis.io/commands/zadd  Refer this link to know more.)

ZRANGE myzset 0 -1 WITHSCORES (Returns the specified range of elements in the sorted set stored at key.)

ZCARD myzset (Returns the sorted set cardinality (number of elements) of the sorted set stored at key.)


ZREM myzset "two" (Removes the specified members from the sorted set stored at key. Non existing members are ignored.)

ZSCORE myzset "one" (Returns the score of member in the sorted set at key.)

ZREVRANGE myzset 0 -1 (Returns the specified range of elements in the sorted set stored at key. The elements are considered to be ordered from the highest to the lowest score.)

ZRANK myzset "three" (Returns the rank of member in the sorted set stored at key, with the scores ordered from low to high. The rank (or index) is 0-based, which means that the member with the lowest score has rank 0.)


ZREVRANK myzset "one" (Returns the rank of member in the sorted set stored at key, with the scores ordered from high to low. The rank (or index) is 0-based, which means that the member with the highest score has rank 0.)

ZINCRBY myzset 2 "one" (Increments the score of member in the sorted set stored at key by increment.)

ZCOUNT myzset -inf +inf (Returns the number of elements in the sorted set at key with a score between min and max.)

ZPOPMAX myzset (Removes and returns up to count members with the highest scores in the sorted set stored at key.)

ZPOPMIN myzset (Removes and returns up to count members with the lowest scores in the sorted set stored at key.

ZINTERSTORE out 2 zset1 zset2 WEIGHTS 2 3 (Computes the intersection of numkeys sorted sets given by the specified keys, and stores the result in destination. )

ZUNIONSTORE out 2 zset1 zset2 WEIGHTS 2 3 (Computes the union of numkeys sorted sets given by the specified keys, and stores the result in destination.)


ZRANGEBYSCORE myzset (1 2 (Returns all the elements in the sorted set at key with a score between min and max)

ZRANGEBYLEX myzset - [c (https://redis.io/commands/zrangebylex Refer to this link to know more)

ZLEXCOUNT myzset [b [f (When all the elements in a sorted set are inserted with the same score, in order to force lexicographical ordering, this command returns the number of elements in the sorted set at key with a value between min and max.)

ZREVRANGEBYLEX myzset [c – (Apart from the reversed ordering, ZREVRANGEBYLEX is similar to ZRANGEBYLEX.)


ZREMRANGEBYLEX myzset [alpha [omega  (When all the elements in a sorted set are inserted with the same score, in order to force lexicographical ordering, this command removes all elements in the sorted set stored at key between the lexicographical range specified by min and max.)

ZREMRANGEBYRANK myzset 0 1 (Removes all elements in the sorted set stored at key with rank between start and stop.)

ZREMRANGEBYSCORE myzset -inf (2  (Removes all elements in the sorted set stored at key with a score between min and max (inclusive).)

ZREVRANGEBYSCORE myzset 2 (1  (Apart from the reversed ordering, ZREVRANGEBYSCORE is similar to ZRANGEBYSCORE.)
```

