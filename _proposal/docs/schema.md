# Schema Information

## users
column name   | data type | details
--------------|-----------|-------------------------
id            | integer   | not null, primary key
email         | string    | not null, unique
username      | string    | not null, unique
pw_digest     | integer   | not null
session_token | string    | not null, unique
description   | text      |
photo_url     | string    |

## blogs
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
author_id   | integer   | not null, foreign key (references users)
title       | string    | not null
body        | text      | not null
preview     | text      |

## logs
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
user_id     | integer   | not null, foreign key (references users)
shoe_id     | integer   | foreign key, (references shoes)
title       | string    |
date        | date      | not null
distance    | float     | not null
duration    | float     | not null
notes       | text      |

## shoes
column name  | data type | details
-------------|-----------|-----------------------
id           | integer   | not null, primary key
user_id      | integer   | not null, foreign key (references users)
name         | string    | not null
distance     | float     |

## comments
column name | data type | details
------------|-----------|-----------------------
id          | integer   | not null, primary key
author_id   | integer   | not null, foreign key (references users)
type_id     | integer   | not null, foreign key (references log OR blog)
type        | string    | not null, [blog, log]
body        | text      | not null

## followings
column name     | data type | details
----------------|-----------|-----------------------
id              | integer   | not null, primary key
follwer_id      | integer   | not null, foreign key (references users)
follwed_id      | integer   | not null, foreign key (references users)
