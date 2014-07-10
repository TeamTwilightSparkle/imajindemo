create table if not exists profile (
    id  serial primary key,
    username    varchar(32) not null unique,
    level       int default 0 check (level >= 0), -- administrative level
    last_seen   date        not null,
    date_joined date        not null
);

create table if not exists content (
    id            serial primary key,
    title         varchar(64)  not null,
    summary       varchar(160) not null,
    description   varchar(512) not null,
    username      varchar(64) not null,
    sector        varchar(64) not null,
    image         varchar(255),
    charges       int default 0 check (charges >= 0),
    last_modified date         not null,
    date_created  date         not null
);

create table if not exists tag (
    tag_id  serial primary key,
    tag varchar(32) unique not null
);

create table if not exists comment (
    comment_id    serial primary key,
    username      varchar(32) references profile (username),
    id            int references content (id),
    post_number   int default 1,
    comment       varchar(160),
    last_modified date not null,
    date_created  date not null
);

create table if not exists charge (
    charge_id      serial primary key,
    charged boolean default false
);

create table if not exists content_profiles (
    id         int references content (id),
    username   varchar(32) references profile (username),
    primary key (id, username)
);

create table if not exists profile_charges (
    id         int references content (id),
    username   varchar(32) references profile (username),
    charge_id  int references charge (charge_id),
    primary key (username, charge_id, id)
);

create table if not exists content_tag (
    id         int references content (id),
    tag        varchar(32) references tag (tag),
    primary key (id, tag)
);