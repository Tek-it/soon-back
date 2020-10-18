create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_restaurants (user_id bigint not null, restaurants_id bigint not null, primary key (user_id, restaurants_id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table user_restaurants add constraint UK_hrw779dr5yo48dtif1dhqcyvd unique (restaurants_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_restaurants add constraint FKi814qy9snkpsna76yoqtjy5i7 foreign key (restaurants_id) references restaurant (id)
alter table user_restaurants add constraint FKk2pdedf7yijorvk71gycfe6lb foreign key (user_id) references user (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), ticket varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), ticket varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), ticket varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), ticket varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), ticket varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), ticket varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), ticket varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), ticket varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), ticket varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), ticket varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), ticket varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), ticket varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), ticket varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), ticket varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), ticket varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), ticket varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), ticket varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
create table address (id bigint not null auto_increment, city varchar(255), house_number integer, rue varchar(255), zip_code bigint, primary key (id)) engine=InnoDB
create table authorization (id bigint not null auto_increment, permission varchar(255), role_id bigint not null, primary key (id)) engine=InnoDB
create table billing (id bigint not null auto_increment, current_time datetime(6), tax double precision not null, total double precision not null, order_id bigint, primary key (id)) engine=InnoDB
create table category (id bigint not null auto_increment, description varchar(255), image varchar(255), name varchar(255), restaurant_id bigint, primary key (id)) engine=InnoDB
create table client (id bigint not null auto_increment, primary key (id)) engine=InnoDB
create table coordinate (id bigint not null auto_increment, latitude double precision not null, longitude double precision not null, primary key (id)) engine=InnoDB
create table dish (id bigint not null auto_increment, available bit, avg_delivery integer, base_price double precision, create_at datetime(6), description varchar(255), name varchar(255), preparation_time integer, value integer, category_id bigint, dish_id bigint, primary key (id)) engine=InnoDB
create table dish_dish_images (dish_id bigint not null, dish_images varchar(255)) engine=InnoDB
create table order (id bigint not null auto_increment, timestamp datetime(6), billing_id bigint, client_id bigint, order_state_id bigint, restaurant_id bigint, primary key (id)) engine=InnoDB
create table order_details (id bigint not null auto_increment, price double precision, quantity double precision, dish_id_fk bigint, order_id_fk bigint, primary key (id)) engine=InnoDB
create table order_state (id bigint not null auto_increment, accepted bit not null, delivered bit not null, new_order bit not null, processing bit not null, rejected bit not null, order_id bigint, primary key (id)) engine=InnoDB
create table reset_password (id bigint not null auto_increment, fk_token_id bigint, fk_user_id bigint, primary key (id)) engine=InnoDB
create table restaurant (id bigint not null auto_increment, restaurant_availability bit, restaurant_description varchar(255), restaurant_image_profile varchar(255), restaurant_name varchar(255), restaurant_phone_number varchar(255), address_id bigint, coordinate_id bigint, owner_id bigint, primary key (id)) engine=InnoDB
create table restaurant_configuration (id bigint not null auto_increment, key varchar(255), value varchar(255), primary key (id)) engine=InnoDB
create table restaurant_restaurant_configurations (restaurant_id bigint not null, restaurant_configurations_id bigint not null, primary key (restaurant_id, restaurant_configurations_id)) engine=InnoDB
create table roles (id bigint not null auto_increment, role_context varchar(255), primary key (id)) engine=InnoDB
create table token (id bigint not null auto_increment, expiration datetime(6), holder varchar(255), valid bit not null, value varchar(255), primary key (id)) engine=InnoDB
create table user (id bigint not null auto_increment, age integer, email varchar(255), first_name varchar(255), last_name varchar(255), number_phone varchar(255), password varchar(255), user_avatar varchar(255), ticket varchar(255), address_id bigint, primary key (id)) engine=InnoDB
create table user_roles (user_id_fk bigint not null, role_id_key bigint not null, primary key (user_id_fk, role_id_key)) engine=InnoDB
alter table restaurant_restaurant_configurations add constraint UK_2h2xc44sun58d0e1ii0yh8e1b unique (restaurant_configurations_id)
alter table authorization add constraint FK804ttdh164wo6xn15tp1nrc5t foreign key (role_id) references roles (id)
alter table billing add constraint FK9mwc19cseuhrxnqqm4lq1ljte foreign key (order_id) references order (id)
alter table category add constraint FKp6n44aqw5n74qc4f1d6eyqgha foreign key (restaurant_id) references restaurant (id)
alter table dish add constraint FK3h7qfevodvyk24ss68mwu8ap6 foreign key (category_id) references category (id)
alter table dish add constraint FK2pfnquime4nw2r624c65olhoy foreign key (dish_id) references dish (id)
alter table dish_dish_images add constraint FK2o3jptbauobe9ouqkk05w8lkl foreign key (dish_id) references dish (id)
alter table order add constraint FKj4arc59ipyxxc07eyt4y67led foreign key (billing_id) references billing (id)
alter table order add constraint FKbb5wakyppwqmfuhp53p3jvs5u foreign key (client_id) references client (id)
alter table order add constraint FK9aic5c086nl3jsslo9vcjjyou foreign key (order_state_id) references order_state (id)
alter table order add constraint FK64rch5g46ue4a83ww6cq7r92w foreign key (restaurant_id) references restaurant (id)
alter table order_details add constraint FKqls7y813sft2ic2dqff2biwok foreign key (dish_id_fk) references dish (id)
alter table order_details add constraint FKku9bk0148vlool0s4hhynrrxg foreign key (order_id_fk) references order (id)
alter table order_state add constraint FKn61ogfsxmv0xs3dw1xm14ko3d foreign key (order_id) references order (id)
alter table reset_password add constraint FK8ymkpb56637afp7khn9adbc9k foreign key (fk_token_id) references token (id)
alter table reset_password add constraint FK3pq5t7xbqojh5oimm7vyj6q1p foreign key (fk_user_id) references user (id)
alter table restaurant add constraint FK96q13p1ptpewvus590a8o83xt foreign key (address_id) references address (id)
alter table restaurant add constraint FKe4brfxep9hgjosuq25kgg3122 foreign key (coordinate_id) references coordinate (id)
alter table restaurant add constraint FKnm7kj0jgjep1nm5rslxei79jl foreign key (owner_id) references user (id)
alter table restaurant_restaurant_configurations add constraint FK52pvtkpf8h7lqpxlqcygq21p8 foreign key (restaurant_configurations_id) references restaurant_configuration (id)
alter table restaurant_restaurant_configurations add constraint FK4lpwfiwh2s2ojmqiskkg9yfpn foreign key (restaurant_id) references restaurant (id)
alter table user add constraint FKddefmvbrws3hvl5t0hnnsv8ox foreign key (address_id) references address (id)
alter table user_roles add constraint FKiv3nlfpwxe1behku9j43ysbb9 foreign key (role_id_key) references roles (id)
alter table user_roles add constraint FKjcqwtqywj0ny5jfwhqt028826 foreign key (user_id_fk) references user (id)
