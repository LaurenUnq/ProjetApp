import React from "react";
import { Button } from "react-bootstrap";

import API from "../../utils/API";

export class Dashboard extends React.Component {
  disconnect = () => {
    API.logout();
    window.location = "/";
  };
  render() {
    return (
	  <div className = "Page">
		<div className = "menu">
		  <h1>Qwing</h1>
		  <ul>
			<li><a className="active" href= "/dashboard">Home</a></li>
			<li><a href="/Propos">Propos</a></li>
			<li><a href="#reponses">Reponses</a></li>
			<li><a href="#about">About</a></li>
			<Button onClick={this.disconnect} bsSize="large" type="submit">
					Se deconnecter
			</Button>
		  </ul>
		</div>
		<div className="Dashboard">
		  <h2>Accueil</h2>
		  <p>
		    Vous trouverez ici les propos sexistes que les utilisateurs ont entendus
			Vous pouvez proposer une réponse pour ne pas rester de marbre face � ces diffamations.
		  </p>
		  <Button onClick={ () => window.location = "/Propos"} bsSize="large" type="submit">
			Voir les propos
		  </Button>
		  <Button onClick={ () => window.location = "/CatPropos"} bsSize="large" type="submit">
			ajouter une categorie (admin)
		  </Button>
		  <h3>Top 10 des propos</h3>
		</div>
	  </div>
    );
  }
}