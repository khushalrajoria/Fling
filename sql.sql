create table users{
    email varchar(50) not null unique,
    password varchar(50) not null,
    userid serial primary key
};

create table data{
    userid int references users(userid),
    fullname varchar(100) not null,
    dateofBirth date not null,
    country varchar(50) not null,
    gender varchar(20),
    maingender varchar(20),
    instaid varchar(50) unique,
    snapchatid varchar(50) unique,
    imageFile text not null unique,
    imageFile2 text unique,
    imageFile3 text unique,
    preferredcountry varchar(50) not null,
    preferredgender varchar(50) not null,
    prefgender varchar(50),
    gemcount int default 100
};


create table leftswipeusers{
    userwhoswiped int references users(userid),
    userwhogotswiped int references users(userid),
    timestamp timestamp not null
};

create table rightswipeusers{
    userwhoswiped int references users(userid),
    userwhogotswiped int references users(userid)
};

create table friendList{
    uId int references users(userid),
    userId int references users(userid),
    timestamp timestamp not null
};