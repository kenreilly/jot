import 'package:meta/meta.dart';

class User {

	User({ this.id, this.username, this.first_name, this.last_name, this.phone, this.is_active });

	String id;
	String username;
	String first_name;
	String last_name;
	String phone;
	bool is_active;

	static User fromDynamicMap(Map<String, dynamic> map) =>
		User(
			id: map['id'], 
			username: map['username'],
			first_name: map['first_name'],
			last_name: map['last_name'],
			phone: map['phone'],
			is_active: (map['is_active'] == 'true')
		);
}