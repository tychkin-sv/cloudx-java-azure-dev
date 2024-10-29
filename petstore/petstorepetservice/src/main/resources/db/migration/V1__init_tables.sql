CREATE TABLE IF NOT EXISTS category
(
    id                bigserial     not null primary key,
    name              varchar(64)   not null unique
);

CREATE TABLE IF NOT EXISTS tag
(
    id                bigserial     not null primary key,
    name              varchar(64)   not null unique
);

CREATE TABLE IF NOT EXISTS pet
(
    id                bigserial     not null primary key,
    name              varchar(64)   not null unique,
    category_id       bigserial     not null,
    photoURL          varchar(255)  not null,
    status            varchar(64)   not null,
    constraint fk_category foreign key (category_id) references category(id)
);

CREATE TABLE IF NOT EXISTS pet_tag
(
    pet_id            bigserial     not null references pet (id) on delete cascade,
    tag_id            bigserial     not null references tag (id) on delete cascade,
    constraint pet_tag_pkey primary key (pet_id, tag_id)
);