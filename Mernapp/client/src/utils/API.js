import axios from "axios";
const headers = {
  "Content-Type": "application/json"
};
const burl = "http://localhost:4000/api";

export default {
  login: function(email, password) {
    return axios.post(
      `${burl}/users/login`,
      {
        email,
        password
      },
      {
        headers: headers
      }
    );
  },
  signup: function(send) {
    return axios.post(`${burl}/users/register`, send, { headers: headers });
  },

  isAuth: function() {
    return localStorage.getItem("token") !== null;
  },

  logout: function() {
    localStorage.clear();
  },

  addPropos: function(send){
    return axios.post(`${burl}/propos/create-propos`, send, { headers: headers });
  },

  getAllPropos: function(){
  	  return axios.get(`${burl}/propos/`, { headers: headers });
  }
}