import React from "react";
import { Button, FormGroup, FormControl, ControlLabel } from "react-bootstrap";
import API from "../../utils/API";

export class CatPropos extends React.Component {

  constructor(propos){
    super(propos);
    this.state = {
      contenu: "",
      allCatPropos : []
  	}

	this.getAllCatPropos = this.getAllCatPropos.bind(this);

  this.getAllCatPropos();
  
  }

  getAllCatPropos = async() => {
    const callCatPropos = await API.getAllCatPropos();
  //console.log(callPropos.data)
    this.setState({allCatPropos : callCatPropos.data})
}

  send = async () => {
    const { contenu} = this.state;
    if (!contenu || contenu.length === 0) return;
    try {
	  const { data } = await API.addCatPropos({ contenu});
	  console.log("addd CATprpos")
      window.location = "/dashboard";
    } catch (error) {
      console.error(error);
    }
  };
  
  handleChange = (event) => {
    this.setState({
      [event.target.id]: event.target.value
    });
  };
  
  render() {
    const {contenu, allCatPropos} = this.state;
    return (
      <div className = "Page">
        <div className = "menu">
          <h1>Qwing</h1>
          <ul>
            <li><a className="active" href= "/dashboard">Home</a></li>
            <li><a href="#propos">Propos</a></li>
            <li><a href="#reponses">Reponses</a></li>
            <li><a href="#about">About</a></li>
            <Button onClick={this.disconnect} bsSize="large" type="submit">
                  Se deconnecter
            </Button>
          </ul>
        </div>
        <div className="addPropos">
          <FormGroup controlId="contenu" bsSize="large">
            <ControlLabel>Categorie</ControlLabel>
            <FormControl
              autoFocus
              type="contenu"
              value={contenu}
              onChange={this.handleChange}
            />
          </FormGroup>

          <Button onClick={this.send} block bsSize="large" type="submit">
            Ajouter la categorie
          </Button>
          {
            allCatPropos.map
              (CatPropos => 
                {
                  return(
                    <div className = "Catpropos">
                      {CatPropos.contenu}
                    </div>
                  )
                }
              )
          }
        </div>
      </div>
	)
  }
}