import 'dart:convert';

String rawJson = "{\"page_status\": {\"state\": \"home\", \"url\": \"https://www.youtube.com/\"}}";

Map<String, dynamic> map = jsonDecode(rawJson); // import 'dart:convert';


dynamic age = map['page_status'];
void main(){
print(age);
}