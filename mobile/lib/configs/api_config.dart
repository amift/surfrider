library surfrider.app;

const PROD_API = "https://surfrider-api.neutrapp.com/api/";
const TEST_API = "http://127.0.0.1/api/";

const API_URL = TEST_API;

class ClassApi {
  String login = API_URL + "auth/login";
  String register = API_URL + "auth/register";
  String profile = API_URL + "profile";
  String history = API_URL + "history";
  String session_start = API_URL + "session/start";
  String session_end = API_URL + "session/stop";

}

ClassApi api = new ClassApi();