-- profiles
insert into profile (username, last_seen, date_joined) values ('soul', '12-12-12', '12-12-12');
insert into profile (username, last_seen, date_joined) values ('ty', '12-12-13', '12-12-13');
insert into profile (username, last_seen, date_joined) values ('ankit', '12-12-13', '12-12-13');
insert into profile (username, last_seen, date_joined) values ('abdullah', '12-12-14', '12-12-14');

-- contents
insert into content (title, summary, description, username, sector, last_modified, date_created)
    values ('title a', 'this is a summary', 'this is a description', 'ty', 'hc', '12-12-12', '12-12-12');
insert into content (title, summary, description, username, sector, last_modified, date_created)
    values ('title b', 'this is a summary 2', 'this is a description 2', 'soul', 'intel', '12-12-12', '12-12-12');
insert into content (title, summary, description, username, sector, last_modified, date_created)
    values ('title c', 'this is a summary 3', 'this is a description 3', 'abdullah', 'gss', '12-12-12', '12-12-12');
insert into content (title, summary, description, username, sector, last_modified, date_created)
    values ('title d', 'this is a summary 4', 'this is a description 4', 'ankit', 'jh', '12-12-12', '12-12-12');

-- content author

insert into content_profiles (id, username) values (1, 'soul');
insert into content_profiles (id, username) values (1, 'ty');
insert into content_profiles (id, username) values (2, 'ty');
insert into content_profiles (id, username) values (3, 'soul');
insert into content_profiles (id, username) values (3, 'ty');
insert into content_profiles (id, username) values (3, 'ankit');
insert into content_profiles (id, username) values (3, 'abdullah');
insert into content_profiles (id, username) values (4, 'ankit');
insert into content_profiles (id, username) values (4, 'abdullah');

-- tags
insert into tag (tag) values ('yolo');
insert into tag (tag) values ('swag');
insert into tag (tag) values ('agilexinterns');
insert into tag (tag) values ('sushi');

-- content tags
insert into content_tag (id, tag) values (1, 'yolo');
insert into content_tag (id, tag) values (1, 'swag');
insert into content_tag (id, tag) values (1, 'agilexinterns');
insert into content_tag (id, tag) values (1, 'sushi');
insert into content_tag (id, tag) values (2, 'yolo');
insert into content_tag (id, tag) values (3, 'yolo');
insert into content_tag (id, tag) values (2, 'agilexinterns');
insert into content_tag (id, tag) values (3, 'agilexinterns');

-- comments
insert into comment (username, id, post_number, comment, last_modified, date_created)
    values ('soul', 1, 1, 'this is a comment', '12-12-12', '12-12-12');
insert into comment (username, id, post_number, comment, last_modified, date_created)
    values ('soul', 2, 1, 'this is a comment 2', '12-12-12', '12-12-12');
insert into comment (username, id, post_number, comment, last_modified, date_created)
    values ('soul', 1, 2, 'this is a comment 3', '12-12-12', '12-12-12');

-- charges
insert into charge (charged) values (true);
insert into charge (charged) values (true);
insert into charge (charged) values (true);
insert into charge (charged) values (true);
insert into charge (charged) values (true);
insert into charge (charged) values (true);

-- profile charges on content
insert into profile_charges (id, username, charge_id) values (1, 'soul', 1);
insert into profile_charges (id, username, charge_id) values (1, 'ty', 2);
insert into profile_charges (id, username, charge_id) values (1, 'ankit', 3);
insert into profile_charges (id, username, charge_id) values (2, 'soul', 4);
insert into profile_charges (id, username, charge_id) values (3, 'abdullah', 5);
insert into profile_charges (id, username, charge_id) values (3, 'ankit', 6);

update content set charges = charges + 1 where id = 1;
update content set charges = charges + 1 where id = 1;
update content set charges = charges + 1 where id = 1;
update content set charges = charges + 1 where id = 2;
update content set charges = charges + 1 where id = 3;
update content set charges = charges + 1 where id = 3;