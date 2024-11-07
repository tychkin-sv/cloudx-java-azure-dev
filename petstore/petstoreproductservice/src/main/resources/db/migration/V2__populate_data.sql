
insert into category (id, name)
values (1, 'Dog Toy'),
       (2, 'Dog Food'),
       (3, 'Cat Toy'),
       (4, 'Cat Food'),
       (5, 'Fish Toy'),
       (6, 'Fish Food');

insert into tag (id, name)
values (1, 'small'),
       (2, 'large');

insert into product (id, name, category_id, photoURL, status)
values (1, 'Ball', 1, 'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-toys/ball.jpg?raw=true', 'available'),
       (2, 'Ball Launcher', 1, 'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-toys/ball-launcher.jpg?raw=true', 'available'),
       (3, 'Plush Lamb', 1, 'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-toys/plush-lamb.jpg?raw=true', 'available'),
       (4, 'Plush Moose', 1, 'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-toys/plush-moose.jpg?raw=true', 'available'),
       (5, 'Large Breed Dry Food', 2, 'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-food/large-dog.jpg?raw=true', 'available'),
       (6, 'Small Breed Dry Food', 2, 'https://raw.githubusercontent.com/chtrembl/staticcontent/master/dog-food/small-dog.jpg?raw=true', 'available'),
       (7, 'Mouse', 3, 'https://raw.githubusercontent.com/chtrembl/staticcontent/master/cat-toys/mouse.jpg?raw=true', 'available'),
       (8, 'Scratcher', 3, 'https://raw.githubusercontent.com/chtrembl/staticcontent/master/cat-toys/scratcher.jpg?raw=true', 'available'),
       (9, 'All Sizes Cat Dry Food', 4, 'https://raw.githubusercontent.com/chtrembl/staticcontent/master/cat-food/cat.jpg?raw=true', 'available'),
       (10, 'Mangrove Ornament', 5, 'https://raw.githubusercontent.com/chtrembl/staticcontent/master/fish-toys/mangrove.jpg?raw=true', 'available'),
       (11, 'All Sizes Fish Food', 6, 'https://raw.githubusercontent.com/chtrembl/staticcontent/master/fish-food/fish.jpg?raw=true', 'available');

insert into product_tag (product_id, tag_id)
values (1, 1), (1, 2),
       (2, 2),
       (3, 1), (3, 2),
       (4, 1), (4, 2),
       (5, 2),
       (6, 1),
       (7, 1), (7, 2),
       (8, 1), (8, 2),
       (9, 1), (9, 2),
       (10, 1), (10, 2),
       (11, 1), (11, 2);