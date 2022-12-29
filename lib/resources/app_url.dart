class AppUrl{
  static var baseUrl = 'https://reqres.in';
  static var loginEndPointUrl = '$baseUrl/api/login';
  static var registerEndPointUrl = '$baseUrl/api/register';
  static var userListEndPointUrl = '$baseUrl/api/users?page=2';

  static var movieBaseUrl = 'https://dea91516-1da3-444b-ad94-c6d0c4dfab81.mock.pstmn.io';
  static var movieList = '$movieBaseUrl/movies_list';
  
  static var jsonPlaceHolderBaseUrl = 'https://jsonplaceholder.typicode.com';
  static var postsEndPointUrl = '$jsonPlaceHolderBaseUrl/posts';
  static var commentsEndPointUrl = '$jsonPlaceHolderBaseUrl/comments';
  static var albumEndPointUrl = '$jsonPlaceHolderBaseUrl/albums';
  static var photosEndPointUrl = '$jsonPlaceHolderBaseUrl/photos';
  static var todosEndPointUrl = '$jsonPlaceHolderBaseUrl/todos';
  static var usersEndPointUrl = '$jsonPlaceHolderBaseUrl/users';

}