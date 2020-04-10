## The Ultimate MySQL Bootcamp: Go from SQL Beginner to Expert

https://www.udemy.com/course/the-ultimate-mysql-bootcamp-go-from-sql-beginner-to-expert

#### About

Become an In-demand SQL Master by creating complex databases and building reports through real-world projects

### Slides

#### Section 1: Introduction and 5 Minutes of SQL

http://webdev.slides.com/coltsteele/mysql-109#/

#### Section 2: Getting Started: Overview and Installation

http://webdev.slides.com/coltsteele/mysql#/

#### Section 3: Creating Databases and Tables

http://webdev.slides.com/coltsteele/mysql-97-98#/

#### Section 5: CRUD commands

http://webdev.slides.com/coltsteele/mysql-99-100#/

#### Section 7: The World Of String Functions

http://webdev.slides.com/coltsteele/mysql-99-101#/

#### Section 10: Revisiting Data Types

http://webdev.slides.com/coltsteele/mysql-99-102#/

#### Section 11: The Power of Logical Operators

http://webdev.slides.com/coltsteele/mysql-99-103#/

#### Section 12: Section 12: One To Many

http://webdev.slides.com/coltsteele/mysql-99-104#/

https://stackoverflow.com/questions/8096550/mysql-determine-which-database-is-selected

#### Section 14: Instagram Database Clone

http://webdev.slides.com/coltsteele/mysql-106#/

http://howto.philippkeller.com/2005/06/19/Tagsystems-performance-tests/

#### Section 16: Section 16 - Introducing Node

https://github.com/nax3t/node-and-mysql

http://webdev.slides.com/coltsteele/mysql-105#/

#### Section 18: Section 18 - Database Triggers

http://webdev.slides.com/coltsteele/mysql-113#/

### Commands

#### Section 2: Getting Started: Overview and Installation

```bash
mysql -u root -p
password

show databases;
```

#### Section 18: Section 18 - Database Triggers

```mysql
CREATE TRIGGER trigger_name 
    trigger_time trigger_event ON table_name FOR EACH ROW
    BEGIN
    ...
    END;
```
| trigger_time | trigger_event | ON  | table_name |
|:------------:|:-------------:|:---:| ----------:|
| BEFORE       | INSERT        |     | photos     |
| AFTER        | UPDATE        |     | users      |
|              | DELETE        |     |            |

```mysql
DELIMITER $$

CREATE TRIGGER must_be_adult
     BEFORE INSERT ON users FOR EACH ROW
     BEGIN
          IF NEW.age < 18
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$

DELIMITER ;
```
```mysql
DELIMITER $$

CREATE TRIGGER example_cannot_follow_self
     BEFORE INSERT ON follows FOR EACH ROW
     BEGIN
          IF NEW.follower_id = NEW.following_id
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Cannot follow yourself, silly';
          END IF;
     END;
$$

DELIMITER ;
```
```mysql
DELIMITER $$

CREATE TRIGGER create_unfollow
    AFTER DELETE ON follows FOR EACH ROW 
BEGIN
    INSERT INTO unfollows
    SET follower_id = OLD.follower_id,
        followee_id = OLD.followee_id;
END$$

DELIMITER ;
```
```mysql
SHOW TRIGGERS;
DROP TRIGGER trigger_name;
```

