import axios from "axios";
const token = localStorage.getItem("token");

const headers = {
  "Content-Type": "application/json"
};
const burl = "http://localhost:4000/api";

export default {

/*----------------- CONNEXION --------------*/
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

  /*----------------- PROPOS --------------*/
  addPropos: function(send){
    return axios.post(`${burl}/propos/create-propos`, send, { headers: headers, token : token });
  },

  getAllPropos: function(){
  	  return axios.get(`${burl}/propos/`, { headers: headers });
  },

  getProposId: function(proposId){
    return axios.get(`${burl}/propos/${proposId}`, { headers: headers });
},


  /*----------------- COMMENTAIRE --------------*/

  addCommentaire: function(send){
    return axios.put(`${burl}/propos/add-commentaire `, send, { headers: headers, token : token });
  },

  getAllCommentaire: function(proposId){
    console.log("api")
    console.log(`${burl}/propos/${proposId}/commentaire`)
    return axios.get(`${burl}/propos/${proposId}/commentaire`, { headers: headers });
  },

  /*----------------- CATEGORIE PROPOS --------------*/
  addCatPropos: function(send){
    return axios.post(`${burl}/categories/create-categorie-propos`, send, { headers: headers });
  },

  getAllCatPropos: function(){
    return axios.get(`${burl}/categories/propos`, { headers: headers });
  },

  
}