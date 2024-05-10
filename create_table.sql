-- Active: 1714056127571@@127.0.0.1@1433@CarReviews@dbo
create table IG_User (
    id int primary key,
    name varchar(255),
    email varchar(255),
    password varchar(255),
    created_at datetime,
    updated_at datetime,
    deleted Bit DEFAULT 0
);

CREATE TABLE IG_Post_Type(
    id INT PRIMARY KEY,
    type VARCHAR(20)
);


create Table IG_Music(
    id INT Identity(1,1) PRIMARY KEY,
    title VARCHAR(255),
    artist_name VARCHAR(255),
    duration VARCHAR(10),
    album_url TEXT,
    audio_url TEXT,
    lyric_available Bit DEFAULT 0,
    lyrics TEXT,
    genre   VARCHAR(50),
)

drop table "IG_POST";

create table IG_Post(
    id int primary key,
    caption varchar(255),
    image_url varchar(255),
    created_at datetime,
    updated_at datetime,
    like_count INT DEFAULT 0,
    disklike_count INT DEFAULT 0,
    hide_like_count BIT DEfault 0,
    disable_comments BIT Default 0,
    deleted Bit DEFAULT 0,
    music_id INT,
    post_type INT,
    Foreign Key (music_id) REFERENCES IG_Music(id) on delete set null,
    Foreign Key (post_type) REFERENCES IG_Post_Type(id) on delete set null
);

-- Alter table "IG_Post" add "hide_like_count" BIT default 0;
-- ALTER TABLE "IG_Post" ADD "music_id" INT;
-- ALTER TABLE "IG_POST" ADD "post_type" INT;

-- ALTER TABLE "IG_Post" ADD Constraint FK_Post_Music Foreign Key (music_id) REFERENCES IG_Music(id) on delete set null;
-- -- ALTER Table "IG_Post" DROP Constraint FK_Post_Music;
-- Alter TABLE "IG_POST" ADD CONSTRAINT FK_Post_Type Foreign Key (post_type) REFERENCES IG_Post_Type(id);



CREATE TABLE "IG_Comment"(
    id INT PRIMARY KEY,
    post_id INT,
    body TEXT,
    like_count INT DEFAULT 0,
    disklike_count INT DEFAULT 0,
    created_at DATETIME,
    updated_at DATETIME,
    deleted Bit DEFAULT 0,
    Foreign Key (post_id) REFERENCES IG_Post(id) on delete cascade
);

alter table "IG_Comment" add constraint 

### Image or Video

create table Post_Media(
    id INT IDENTITY(1,1) PRIMARY KEY,
    media_url TEXT,
    created_at DATETIME,
    updated_at DATETIME,
    delted BIT DEFAULT 0
)


### idenity (1,1 ) means that it starts with 1 and increases by 1
# PERSONAL/ PROFESSIONAL
-- account privacy type: public or private
create table IG_Account(
id INT IDENTITY(1,1) PRIMARY Key,
name VARCHAR(255),
user_name VARCHAR(50),
pronouns    VARCHAR(50),
bio TEXT,
profile_pic_url TEXT, 
verified Bit default 0,
profile_type VARCHAR(30), 
account_privacy_type VARCHAR(20) DEFAULT 'public'
);

-- alter table "IG_Account" add account_privacy_type VARCHAR(20);
-- alter table "IG_Account" add constraint DF_Constraint_Privacy default 'public' for account_privacy_type;
-- alter table "IG_Account" add  "profile_type" INT;
-- alter table "IG_Account" add  "email" VARCHAR(100);


-- alter table "IG_Account" add   "phone_number" VARCHAR(15);
-- alter table "IG_Account" add UNIQUE ("phone_number");
-- alter table "IG_Account" add UNIQUE ("email");

-- alter table "IG_Account" add "password" VARCHAR(30);



-- alter table "IG_Post" ADD account_id INT;
-- alter table "IG_Post" ADD CONSTRAINT account_id Foreign Key (account_id) REFERENCES IG_Account(id) on delete CASCADE on update CASCADE;

-- -- alter table "IG_POST" Drop column account_id;


-- alter table "IG_Comment" ADD account_id INT;
-- alter table "IG_Comment" add  account_id INT;

-- alter table "IG_Comment" ADD CONSTRAINT FK_Comment_Account Foreign Key (account_id) REFERENCES IG_Account(id) on delete CASCADE on update CASCADE;





create table IG_Account_Type(
    id INT,
    type VARCHAR(20)
);

### user_id is the user and follower_id is the follower of that user.

-- drop table IG_Follower_Following_Map;

CREATE Table IG_Follower_Following_Map(
    Primary Key (account_id, follower_id),
    account_id INT ,
    account_username VARCHAR(50),
    follower_id INT,
    follower_name VARCHAR(50),
    followed_at DATETIME,
FOREIGN KEY (account_id) REFERENCES IG_Account(id),
FOREIGN KEY (follower_id) REFERENCES IG_Account(id)
);



-- saved posts table

CREATE TABLE IG_SAVED_POST(
    PRIMARY KEY (account_id, post_id),
    account_id INT,
    post_id INT,
    saved_at DATETIME,
    Foreign Key (account_id) REFERENCES IG_Account(id) on delete CASCADE on update CASCADE,
    Foreign Key (post_id)   REFERENCES IG_Post(id) on delete CASCADE on update CASCADE,
);
-- drop Table IG_SAVED_POST;


--- Archived post

CREATE TABLE IG_ARCHIVED_POST(
    PRIMARY KEY (account_id, post_id),
    account_id INT,
    post_id INT,
    archived_at DATETIME,
    Foreign Key (account_id) REFERENCES IG_Account(id) on delete CASCADE on update CASCADE,
    Foreign Key (post_id)   REFERENCES IG_Post(id) on delete CASCADE on update CASCADE,
);
-- drop table IG_ARCHIVED_POST;

CREATE TABLE IG_Story(
    id INT Identity(1,1) PRIMARY KEY,
    content Text,
    posted_at DATETIME,
    share_facebook Bit DEFAULT 0,
    account_id INT
    Foreign Key (account_id) REFERENCES IG_Account(id)
);
-- drop table "IG_Story";

Create Table IG_Story_View(
    PRIMARY key (account_id, story_id, viewer_account_id),
    viewed_at datetime,
    account_id INT,
    viewer_account_id INT,
    story_id INT,
    viewer_username VARCHAR(50),
    love_react BIT DEFAULT 0,
    Foreign Key (account_id) REFERENCES IG_Account(id)   on delete cascade,
    Foreign Key (viewer_account_id) REFERENCES IG_Account(id),
    Foreign Key (story_id) REFERENCES IG_Story(id) on delete cascade
);
drop table "IG_Story_View";

CREATE TABLE IG_PostLike(
    primary key (post_id, account_id),
    post_id INT,
    account_id INT,
    liked_at DATETIME
);

CREATE TABLE IG_PostDislike(
    primary key (post_id, account_id),
    post_id INT,
    account_id INT,
    disliked_at DATETIME
);



CREATE TABLE IG_HIGHLIGHT(
    id Int Identity(1,1) PRIMARY Key,
    name  VARCHAR(50),
    story_id INT,
    created_at Datetime,
    Foreign Key (story_id) REFERENCES IG_Story(id)
)

CREATE Table IG_Activity_Type(
    id INT Identity(1,1) PRIMARY KEY,
    type VARCHAR(50)
);


CREATE TABLE IG_Activity(
    id INT Identity(1,1) PRIMARY KEY,
    account_id INT,
    activity_type VARCHAR(50),
    activity_at DATETIME,
    activity_description TEXT,
    Foreign Key (account_id) REFERENCES IG_Account(id)
)
alter table IG_Activity add "created_at" DATETIME;

CREATE TABLE IG_Account_Update_Type(
    id INT Identity(1,1) PRIMARY KEY,
    name VARCHAR(50)

);


-- CREATE TABLE IG_Account_History(
    
-- )